import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../errors/app_failure.dart';
import '../../features/auth/data/auth_repository.dart';
import 'api_error.dart';

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
    // Network failures take precedence over response parsing.
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError) {
      return const AppFailure.network('Không có kết nối mạng');
    }

    // Envelope path: ApiResponseInterceptor attaches structured ApiError.
    final apiError = err.error;
    final status = err.response?.statusCode;
    if (apiError is ApiError) {
      switch (status) {
        case 400:
          return AppFailure.validation(apiError.message);
        case 401:
          return AppFailure.unauthorized(apiError.message);
        case 403:
          final requiredRoles = apiError.details?['required_roles'];
          return AppFailure.forbidden(
            requiredRoles is List ? requiredRoles.join(', ') : apiError.message,
          );
        default:
          return AppFailure.server(status ?? 0, apiError.message);
      }
    }

    // Legacy fallback for non-envelope error bodies (webhooks, health, etc.).
    final body = err.response?.data;
    final message = body is Map
        ? (body['error'] is String ? body['error'] as String? : body['error']?['message'] as String?)
        : null;

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
