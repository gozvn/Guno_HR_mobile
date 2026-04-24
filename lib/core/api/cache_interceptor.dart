import 'package:dio/dio.dart';

// HTTP response caching via dio_cache_interceptor.
// TODO(phase-04): configure CacheStore (drift-backed) + cache policies per route.

class CacheInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // phase-04 fills: apply cache policy, return cached response if fresh
    super.onRequest(options, handler);
  }
}
