import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/api/auth_interceptor.dart';
import '../core/api/cache_interceptor.dart';
import '../core/api/dio_client.dart';
import '../core/api/error_mapper_interceptor.dart';
import '../core/api/refresh_interceptor.dart';
import '../core/storage/secure_storage.dart';
import '../core/utils/env.dart';

// Re-export connectivity stream shape used by attendance feature.
// ConnectivityResult is List-based in connectivity_plus v6.
export 'package:connectivity_plus/connectivity_plus.dart' show ConnectivityResult;

part 'providers.g.dart';

@riverpod
SecureStorage secureStorage(Ref ref) {
  return const SecureStorage(
    FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    ),
  );
}

// Interceptor order: auth → refresh → cache → error-mapper.
@riverpod
Dio dio(Ref ref) {
  return buildDio(
    baseUrl: apiBase,
    interceptors: [
      AuthInterceptor(ref),
      RefreshInterceptor(ref),
      CacheInterceptor(),
      ErrorMapperInterceptor(),
    ],
  );
}

@riverpod
Stream<List<ConnectivityResult>> connectivity(Ref ref) {
  return Connectivity().onConnectivityChanged;
}
