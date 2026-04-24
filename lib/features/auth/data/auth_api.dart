import 'package:dio/dio.dart';

import 'dto/change_password_request.dart';
import 'dto/login_request.dart';
import 'dto/login_response.dart';
import 'dto/user_dto.dart';

// Direct Dio calls — no Retrofit. Keeps the dependency surface minimal.
class AuthApi {
  const AuthApi(this._dio);

  final Dio _dio;

  Future<LoginResponse> login(LoginRequest req) async {
    final res = await _dio.post(
      '/api/hr/auth/login',
      data: req.toJson(),
    );
    return LoginResponse.fromJson(res.data as Map<String, dynamic>);
  }

  Future<UserDto> me() async {
    final res = await _dio.get('/api/hr/auth/me');
    return UserDto.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> changePassword(ChangePasswordRequest req) async {
    await _dio.post(
      '/api/hr/auth/change-password',
      data: req.toJson(),
    );
  }
}
