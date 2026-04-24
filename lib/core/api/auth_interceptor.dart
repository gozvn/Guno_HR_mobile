import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/auth_providers.dart';

// Attaches Bearer token to every request except public auth endpoints.
class AuthInterceptor extends Interceptor {
  const AuthInterceptor(this._ref);

  final Ref _ref;

  // Paths that do not require a Bearer token.
  static const _publicPaths = [
    '/api/hr/auth/login',
    '/api/hr/auth/from-telegram',
  ];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final isPublic = _publicPaths.any(options.path.contains);
    if (!isPublic) {
      final token = _ref.read(tokenProvider);
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }
}
