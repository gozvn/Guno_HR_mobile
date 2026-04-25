import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../errors/app_failure.dart';
import '../../features/auth/data/auth_repository.dart';

// Maps DioException / HTTP status codes to typed AppFailure so callers
// never need to inspect raw DioException.
class ErrorMapperInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      final uri = err.requestOptions.uri;
      final status = err.response?.statusCode;
      final body = err.response?.data;
      debugPrint('[HTTP-ERR] ${err.requestOptions.method} $uri → $status : $body');
    }
    final failure = _map(err);
    handler.next(
      err.copyWith(
        error: AppFailureException(failure),
        message: failure.toString(),
      ),
    );
  }

  AppFailure _map(DioException err) {
    final status = err.response?.statusCode;
    final body = err.response?.data;
    final message = body is Map ? (body['error'] as String?) : null;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError) {
      return const AppFailure.network('Không có kết nối mạng');
    }

    switch (status) {
      case 400:
        return AppFailure.validation(message ?? 'Dữ liệu không hợp lệ');
      case 401:
        return AppFailure.unauthorized(message);
      case 403:
        final required = body is Map ? body['required'] : null;
        return AppFailure.forbidden(
          required is List ? required.join(', ') : message,
        );
      default:
        return AppFailure.server(status ?? 0, message);
    }
  }
}
