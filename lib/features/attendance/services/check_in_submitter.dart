import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/api/api_error.dart';
import '../../../core/errors/app_failure.dart';
import '../../../instrumentation/analytics_service.dart';
import '../data/attendance_api.dart';
import '../data/dto/checkin_request_dto.dart';
import '../data/dto/checkin_response_dto.dart';
import '../data/local/attendance_database.dart';
import '../data/local/pending_checkins_dao.dart';
import '../domain/check_in_result.dart';

/// Decides whether to submit immediately (online) or queue in drift (offline/5xx).
/// Idempotency: client UUID written to note field as "ck:<uuid>|<user-note>".
/// Server deduplication: 400 "Đã check-in lúc" treated as success.
class CheckInSubmitter {
  CheckInSubmitter({
    required AttendanceApi api,
    required PendingCheckinsDao dao,
    AnalyticsService? analytics,
  })  : _api = api,
        _dao = dao,
        _analytics = analytics ?? AnalyticsService();

  final AttendanceApi _api;
  final PendingCheckinsDao _dao;
  final AnalyticsService _analytics;

  static const _uuid = Uuid();

  Future<CheckInResult> submit({
    required String type,
    double? gpsLat,
    double? gpsLng,
    String? locationCode,
    File? photoFile,
    String userNote = '',
  }) async {
    final clientId = _uuid.v4();
    // Prefix note with client UUID for weak idempotency tracing on server.
    final note = 'ck:$clientId${userNote.isNotEmpty ? '|$userNote' : ''}';

    // Skip pre-flight connectivity check — `onConnectivityChanged` only emits
    // on state change so `.first` can block. Rely on Dio connectionError to
    // detect offline at request time instead (see _isRetryable).
    try {
      final photoB64 =
          photoFile != null ? await _encodePhoto(photoFile) : null;
      final body = CheckinRequestDto(
        gpsLat: gpsLat,
        gpsLng: gpsLng,
        locationCode: locationCode,
        photoBase64: photoB64,
        note: note,
      );

      final wfhBody = WfhCheckinRequestDto(
        photoBase64: photoB64,
        note: note,
      );
      final resp = switch (type) {
        'checkout' => await _api.mobileCheckout(body),
        'wfh_checkin' => await _api.wfhCheckin(wfhBody),
        'wfh_checkout' => await _api.wfhCheckout(wfhBody),
        _ => await _api.mobileCheckin(body),
      };
      await _analytics.log('checkin_submitted', params: {'type': type});
      return CheckInResult.success(resp);
    } on DioException catch (e) {
      // 400 "Đã check-in lúc HH:MM" → server upsert already processed → treat as success.
      if (_isAlreadyCheckedIn(e)) {
        await _analytics.log('checkin_submitted', params: {'type': type, 'idempotent': 'true'});
        return CheckInResult.success(_emptyOkResponse());
      }
      // 400 "Chấm công ngoài văn phòng" → trigger WFH redirect.
      if (_isOutsideRadius(e)) {
        return CheckInResult.outsideRadius(_extractError(e));
      }
      // 5xx or network error → queue for retry.
      if (_isRetryable(e)) {
        final pendingId = await _enqueue(
          id: clientId,
          type: type,
          gpsLat: gpsLat,
          gpsLng: gpsLng,
          locationCode: locationCode,
          photoFile: photoFile,
          note: note,
        );
        await _analytics.log('checkin_queued_offline', params: {'type': type, 'reason': '5xx'});
        return CheckInResult.queuedOffline(pendingId);
      }
      final failure = _mapFailure(e);
      await _analytics.log('checkin_failed', params: {
        'type': type,
        'code': (e.response?.statusCode ?? 0).toString(),
      });
      return CheckInResult.failed(failure);
    }
  }

  // ---------------------------------------------------------------------------
  // Private helpers

  Future<String> _encodePhoto(File file) async {
    final bytes = await file.readAsBytes();
    final b64 = base64Encode(bytes);
    return 'data:image/jpeg;base64,$b64';
  }

  Future<String> _enqueue({
    required String id,
    required String type,
    double? gpsLat,
    double? gpsLng,
    String? locationCode,
    File? photoFile,
    required String note,
  }) async {
    await _dao.insert(
      PendingCheckinsCompanion.insert(
        id: id,
        type: type,
        gpsLat: Value(gpsLat),
        gpsLng: Value(gpsLng),
        locationCode: Value(locationCode),
        photoPath: Value(photoFile?.path),
        note: Value(note),
        occurredAt: DateTime.now(),
      ),
    );
    return id;
  }

  /// Network errors (no response) or 5xx status are retryable.
  bool _isRetryable(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.connectionTimeout) {
      return true;
    }
    final status = e.response?.statusCode;
    return status != null && status >= 500;
  }

  bool _isAlreadyCheckedIn(DioException e) {
    if (e.error is ApiError) {
      final code = (e.error as ApiError).code;
      if (code == 'ATT_ALREADY_CHECKED_IN' || code == 'ATT_ALREADY_CHECKED_OUT') return true;
    }
    final body = _extractError(e);
    return body.contains('Đã check-in lúc') || body.contains('Đã check-out');
  }

  bool _isOutsideRadius(DioException e) {
    if (e.error is ApiError && (e.error as ApiError).code == 'ATT_GPS_OUT_OF_RANGE') return true;
    return _extractError(e).contains('Chấm công ngoài văn phòng');
  }

  String _extractError(DioException e) {
    if (e.error is ApiError) return (e.error as ApiError).message;
    try {
      final data = e.response?.data;
      if (data is Map) {
        final raw = data['error'];
        if (raw is String) return raw;
        if (raw is Map) return raw['message']?.toString() ?? '';
      }
    } catch (_) {}
    return '';
  }

  AppFailure _mapFailure(DioException e) {
    final status = e.response?.statusCode;
    final msg = _extractError(e);
    if (status == 401) return const AppFailure.unauthorized();
    if (status == 403) {
      return AppFailure.forbidden(msg.isNotEmpty ? msg : null);
    }
    if (status != null) {
      return AppFailure.server(status, msg.isNotEmpty ? msg : null);
    }
    return AppFailure.network(e.message ?? 'Network error');
  }

  CheckinResponseDto _emptyOkResponse() {
    // Minimal ok=true response for idempotent 400 "already checked in" cases.
    return const CheckinResponseDto(ok: true);
  }
}
