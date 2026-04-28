import 'package:dio/dio.dart';

import 'api_error.dart';
import 'pagination_meta.dart';

// Unwraps the BE standard envelope before feature code deserializes.
//
// Success envelope: { "success": true, "data": <T>, "meta": { "request_id", "pagination"? } }
// Error envelope:   { "success": false, "error": { "code", "message", "field"?, "details"? }, "meta": { "request_id" } }
//
// After this interceptor runs:
//   - response.data = the unwrapped payload (T)
//   - response.extra['pagination'] = PaginationMeta? (set when present)
//   - response.extra['meta'] = raw meta map
//
// This interceptor MUST be placed first in the chain so downstream
// interceptors and feature code never see the envelope wrapper.
class ApiResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final body = response.data;

    // Skip non-envelope responses: binary downloads, already-unwrapped, etc.
    if (body is! Map<String, dynamic> || !body.containsKey('success')) {
      handler.next(response);
      return;
    }

    final success = body['success'] as bool;

    if (success) {
      response.data = body['data'];
      final meta = body['meta'] as Map<String, dynamic>?;
      if (meta != null) {
        response.extra['meta'] = meta;
        final paginationRaw = meta['pagination'];
        if (paginationRaw is Map<String, dynamic>) {
          response.extra['pagination'] =
              PaginationMeta.fromJson(paginationRaw);
        }
      }
      handler.next(response);
    } else {
      // Reject with structured ApiError so error interceptors can read it.
      final errorBody = body['error'] as Map<String, dynamic>;
      final meta = body['meta'] as Map<String, dynamic>?;
      final apiError = ApiError(
        code: errorBody['code'] as String,
        message: errorBody['message'] as String,
        field: errorBody['field'] as String?,
        details: errorBody['details'] as Map<String, dynamic>?,
        requestId: meta?['request_id'] as String?,
      );
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: apiError,
        ),
      );
    }
  }
}
