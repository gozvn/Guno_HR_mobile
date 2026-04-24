import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_dto.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

bool _toBool(Object? v) => v == true || v == 1 || v == '1';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String token,
    @JsonKey(name: 'must_change_password', fromJson: _toBool)
    required bool mustChangePassword,
    required UserDto user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
