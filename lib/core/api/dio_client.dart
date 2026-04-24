import 'package:dio/dio.dart';

// Factory that assembles a Dio instance with a fixed timeout policy and
// a caller-supplied interceptor chain (auth → refresh → cache → error-mapper).

Dio buildDio({
  required String baseUrl,
  required List<Interceptor> interceptors,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 60), // generous for selfie upload
      headers: const {'Accept': 'application/json'},
    ),
  );
  dio.interceptors.addAll(interceptors);
  return dio;
}
