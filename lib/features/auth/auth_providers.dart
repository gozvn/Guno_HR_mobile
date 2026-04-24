import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import 'data/auth_api.dart';
import 'data/auth_repository.dart';

part 'auth_providers.g.dart';

/// Shared mutable JWT state — read by AuthInterceptor on every request,
/// written by AuthNotifier on login/logout.
final tokenProvider = StateProvider<String?>((ref) => null);

@riverpod
AuthApi authApi(Ref ref) => AuthApi(ref.watch(dioProvider));

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository(
      ref.watch(authApiProvider),
      ref.watch(secureStorageProvider),
    );
