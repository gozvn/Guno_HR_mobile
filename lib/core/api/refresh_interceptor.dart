import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/auth_notifier.dart';

// TODO(backend): Replace force-logout with silent token refresh once
// POST /api/hr/auth/refresh endpoint is available. Blocker tracked in plan.md.
class RefreshInterceptor extends Interceptor {
  const RefreshInterceptor(this._ref);

  final Ref _ref;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // No refresh endpoint available — force logout immediately.
      _ref.read(authNotifierProvider.notifier).forceLogout();
    }
    handler.next(err);
  }
}
