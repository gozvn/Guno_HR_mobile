import 'dart:convert';

import '../../../core/errors/app_failure.dart';
import '../../../core/errors/result.dart';
import '../../../core/storage/secure_storage.dart';
import '../domain/auth_user.dart';
import 'auth_api.dart';
import 'dto/change_password_request.dart';
import 'dto/login_request.dart';
import 'dto/login_response.dart';

// Keychain keys — centralised to avoid string scatter.
abstract final class _Keys {
  static const jwt = 'jwt';
  static const userCached = 'user_cached';
}

class AuthRepository {
  const AuthRepository(this._api, this._storage);

  final AuthApi _api;
  final SecureStorage _storage;

  /// Reads stored JWT from Keychain. Returns null if absent.
  Future<String?> readToken() => _storage.read(_Keys.jwt);

  /// Calls /auth/me to rehydrate session. Expects token already set on Dio
  /// via [tokenProvider] before calling this.
  Future<Result<AuthUser>> fetchMe() async {
    try {
      final dto = await _api.me();
      return Ok(dto.toDomain());
    } on Exception catch (e) {
      return Err(_mapException(e));
    }
  }

  Future<Result<LoginResponse>> login(String email, String? password) async {
    try {
      final req = LoginRequest(email: email, password: password);
      final response = await _api.login(req);
      // Persist JWT — password is never stored.
      await _storage.write(_Keys.jwt, response.token);
      // Cache user JSON for offline display (phase-03 uses this).
      await _storage.write(
        _Keys.userCached,
        jsonEncode(response.user.toJson()),
      );
      return Ok(response);
    } on Exception catch (e) {
      return Err(_mapException(e));
    }
  }

  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final req = ChangePasswordRequest(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      await _api.changePassword(req);
      return const Ok(null);
    } on Exception catch (e) {
      return Err(_mapException(e));
    }
  }

  /// Clears Keychain entries. Caller (AuthNotifier) invalidates Riverpod
  /// providers and navigates to login.
  Future<void> clearSession() async {
    await _storage.delete(_Keys.jwt);
    await _storage.delete(_Keys.userCached);
  }

  AppFailure _mapException(Exception e) {
    // DioException is mapped by ErrorMapperInterceptor to AppFailure;
    // here we handle any residual raw exceptions.
    if (e is AppFailureException) return e.failure;
    return AppFailure.unknown(e);
  }
}

/// Thin wrapper so ErrorMapperInterceptor can throw typed failures through Dio.
class AppFailureException implements Exception {
  const AppFailureException(this.failure);
  final AppFailure failure;
}
