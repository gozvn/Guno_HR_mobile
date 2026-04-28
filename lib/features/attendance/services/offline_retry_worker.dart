import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../../core/api/api_error.dart';
import '../data/attendance_api.dart';
import '../data/dto/checkin_request_dto.dart';
import '../data/local/attendance_database.dart';
import '../data/local/pending_checkins_dao.dart';

/// Listens for connectivity events and app foreground transitions,
/// then drains the drift pending queue with exponential backoff.
/// On 401: stops immediately and calls [onForceLogout] so auth can clear state.
class OfflineRetryWorker with WidgetsBindingObserver {
  OfflineRetryWorker({
    required AttendanceApi api,
    required PendingCheckinsDao dao,
    required Stream<List<ConnectivityResult>> connectivity,
    required void Function() onForceLogout,
  })  : _api = api,
        _dao = dao,
        _connectivity = connectivity,
        _onForceLogout = onForceLogout;

  final AttendanceApi _api;
  final PendingCheckinsDao _dao;
  final Stream<List<ConnectivityResult>> _connectivity;
  final void Function() _onForceLogout;

  StreamSubscription<List<ConnectivityResult>>? _sub;
  bool _running = false;

  /// Call after user authenticates. Safe to call multiple times.
  void start() {
    _sub ??= _connectivity.listen((results) {
      if (results.any((r) => r != ConnectivityResult.none)) {
        runOnce();
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  /// Stop listening. Call when user logs out.
  void stop() {
    _sub?.cancel();
    _sub = null;
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Trigger retry when app comes back to foreground.
    if (state == AppLifecycleState.resumed) runOnce();
  }

  /// Process all due pending rows sequentially (FIFO by occurredAt).
  /// Guard against concurrent runs — connectivity events can fire rapidly.
  Future<void> runOnce() async {
    if (_running) return;
    _running = true;
    try {
      final pending = await _dao.dueNow();
      for (final row in pending) {
        final shouldContinue = await _retryOne(row);
        if (!shouldContinue) break; // 401 → stop worker
      }
    } finally {
      _running = false;
    }
  }

  /// Returns false if worker should stop (401 received).
  Future<bool> _retryOne(PendingCheckin row) async {
    try {
      final photoB64 = await _encodePhoto(row.photoPath);
      final body = CheckinRequestDto(
        gpsLat: row.gpsLat,
        gpsLng: row.gpsLng,
        locationCode: row.locationCode,
        photoBase64: photoB64,
        note: row.note,
      );

      switch (row.type) {
        case 'checkout':
          await _api.mobileCheckout(body);
        case 'wfh_checkin':
          await _api.wfhCheckin(
            WfhCheckinRequestDto(photoBase64: photoB64, note: row.note),
          );
        case 'wfh_checkout':
          await _api.wfhCheckout(
            WfhCheckinRequestDto(note: row.note),
          );
        default:
          await _api.mobileCheckin(body);
      }

      // Success — clean up row + photo file.
      await _dao.deleteAndCleanup(row);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _onForceLogout();
        return false;
      }

      // 400 "Đã check-in lúc" → server already has it → treat as done.
      if (_isAlreadyCheckedIn(e)) {
        await _dao.deleteAndCleanup(row);
        return true;
      }

      // 4xx (client error — e.g. 403 no WFH request, 400 outside radius) is
      // terminal: retrying won't help. Drop row so we don't spin forever.
      final status = e.response?.statusCode;
      if (status != null && status >= 400 && status < 500) {
        // ignore: avoid_print
        print('[RETRY-DEAD] ${row.type} → $status ${_extractError(e)}');
        await _dao.deleteAndCleanup(row);
        return true;
      }

      // 5xx or network error → apply backoff and leave row.
      final newCount = row.retryCount + 1;
      await _dao.updateRetry(
        id: row.id,
        retryCount: newCount,
        nextRetryAt: DateTime.now().add(_backoff(newCount)),
        lastError: _extractError(e),
      );
    } catch (e) {
      // Unexpected error — still update retry so we don't tight-loop.
      final newCount = row.retryCount + 1;
      await _dao.updateRetry(
        id: row.id,
        retryCount: newCount,
        nextRetryAt: DateTime.now().add(_backoff(newCount)),
        lastError: e.toString(),
      );
    }
    return true;
  }

  // ---------------------------------------------------------------------------
  // Helpers

  Future<String?> _encodePhoto(String? path) async {
    if (path == null) return null;
    final file = File(path);
    if (!await file.exists()) return null;
    final bytes = await file.readAsBytes();
    return 'data:image/jpeg;base64,${base64Encode(bytes)}';
  }

  /// Backoff: 5^n seconds, capped at 1h.
  /// n=1 → 5s, n=2 → 25s ≈ 30s, n=3 → 125s ≈ 2m, n=4 → 625s ≈ 10m,
  /// n≥5 → 3600s = 1h.
  Duration _backoff(int n) =>
      Duration(seconds: math.min(3600, math.pow(5, n).toInt()));

  bool _isAlreadyCheckedIn(DioException e) {
    if (e.error is ApiError) {
      final code = (e.error as ApiError).code;
      if (code == 'ATT_ALREADY_CHECKED_IN' || code == 'ATT_ALREADY_CHECKED_OUT') return true;
    }
    final body = _extractError(e);
    return body.contains('Đã check-in lúc') || body.contains('Đã check-out');
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
    return e.message ?? 'Unknown error';
  }
}
