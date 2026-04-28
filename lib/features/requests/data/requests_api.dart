import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

import '../../../core/api/pagination_meta.dart';
import 'dto/create_request_payload.dart';
import 'dto/ht_request_dto.dart';
import 'dto/request_detail_dto.dart';
import 'dto/request_dto.dart';
import 'dto/request_type_dto.dart';

/// Thin Dio wrapper for /api/hr/requests/* endpoints.
class RequestsApi {
  RequestsApi(this._dio);

  final Dio _dio;

  /// GET /api/hr/requests — server auto-filters by JWT.
  /// After envelope unwrap: response.data = List<...>; pagination in response.extra['pagination'].
  Future<({List<RequestDto> items, int total})> list({
    String? status,
    String? type,
    String? month,
    int limit = 20,
    int offset = 0,
  }) async {
    final resp = await _dio.get<List<dynamic>>(
      '/api/hr/requests',
      queryParameters: {
        if (status != null) 'status': status,
        if (type != null) 'type': type,
        if (month != null) 'month': month,
        'limit': limit,
        'offset': offset,
      },
    );
    final items = (resp.data ?? [])
        .map((e) => RequestDto.fromJson(e as Map<String, dynamic>))
        .toList();
    final pagination = resp.extra['pagination'] as PaginationMeta?;
    return (items: items, total: pagination?.total ?? items.length);
  }

  /// GET /api/hr/requests/:id
  Future<RequestDetailDto> byId(int id) async {
    final resp = await _dio.get<Map<String, dynamic>>('/api/hr/requests/$id');
    return RequestDetailDto.fromJson(resp.data!);
  }

  /// GET /api/hr/requests/types — cached 24h by caller.
  Future<List<RequestTypeDto>> types() async {
    try {
      final resp = await _dio.get<List<dynamic>>('/api/hr/requests/types');
      // ignore: avoid_print
      print('[DBG types] ${resp.statusCode} count=${resp.data?.length} sample=${resp.data?.isNotEmpty == true ? resp.data!.first : null}');
      return (resp.data ?? [])
          .map((e) => RequestTypeDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, s) {
      // ignore: avoid_print
      print('[DBG types FAIL] $e\n$s');
      rethrow;
    }
  }

  /// POST /api/hr/requests
  Future<CreatedRequest> create(CreateRequestPayload payload) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/api/hr/requests',
      data: payload.toJson()
        ..removeWhere((_, v) => v == null)
        // Remove empty attachment list to keep payload clean when no uploads.
        ..removeWhere((k, v) => k == 'attachment_urls' && (v as List).isEmpty),
    );
    return CreatedRequest.fromJson(resp.data!);
  }

  /// POST /api/hr/requests/upload-attachment — multipart field 'file'.
  /// Image only, max 10MB. Returns {url, filename}.
  Future<AttachmentUploadResult> uploadAttachment(File file) async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: p.basename(file.path),
      ),
    });
    final resp = await _dio.post<Map<String, dynamic>>(
      '/api/hr/requests/upload-attachment',
      data: form,
    );
    return AttachmentUploadResult.fromJson(resp.data!);
  }

  /// POST /api/hr/requests/:id/cancel
  Future<void> cancel(int id) async {
    await _dio.post<void>('/api/hr/requests/$id/cancel');
  }

  /// GET /api/hr/requests/ht?month=YYYY-MM — legacy HappyTime read-only.
  /// Endpoint may not be implemented server-side (404) — treat as empty list.
  Future<List<HtRequestDto>> htList({String? month}) async {
    try {
      final resp = await _dio.get<List<dynamic>>(
        '/api/hr/requests/ht',
        queryParameters: {
          if (month != null) 'month': month,
          'limit': 100,
        },
      );
      return (resp.data ?? [])
          .map((e) => HtRequestDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return const [];
      rethrow;
    }
  }

  // ---------------------------------------------------------------------------
  // Manager-only endpoints

  /// POST /api/hr/requests/:id/approve — comment is optional.
  /// Returns {ok, nextApproverId?, finalApproved}.
  Future<ApproveResult> approve(int id, {String? comment}) async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/api/hr/requests/$id/approve',
      data: {
        if (comment != null && comment.isNotEmpty) 'comment': comment,
      },
    );
    return ApproveResult.fromJson(resp.data!);
  }

  /// POST /api/hr/requests/:id/reject — comment is REQUIRED by server.
  Future<void> reject(int id, {required String comment}) async {
    await _dio.post<void>(
      '/api/hr/requests/$id/reject',
      data: {'comment': comment},
    );
  }

  /// GET /api/hr/requests/pending-count — badge poll for manager tab.
  Future<int> pendingCount() async {
    final resp = await _dio.get<Map<String, dynamic>>(
      '/api/hr/requests/pending-count',
    );
    return (resp.data!['count'] as num).toInt();
  }
}

/// Response shape from POST /api/hr/requests/:id/approve.
class ApproveResult {
  const ApproveResult({
    required this.ok,
    this.nextApproverId,
    required this.finalApproved,
  });

  final bool ok;
  final int? nextApproverId;
  final bool finalApproved;

  factory ApproveResult.fromJson(Map<String, dynamic> json) => ApproveResult(
        ok: (json['ok'] as bool?) ?? true,
        nextApproverId: json['nextApproverId'] as int?,
        finalApproved: (json['finalApproved'] as bool?) ?? false,
      );
}
