import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth_user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required int id,
    @JsonKey(name: 'emp_code') required String empCode,
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    String? phone,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
    @JsonKey(name: 'department_id') int? departmentId,
    @JsonKey(name: 'department_name') String? departmentName,
    required String role,
    @JsonKey(name: 'managed_department_id') int? managedDepartmentId,
    // Extended fields from /auth/me (audit line 167–188).
    String? gender,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'contract_type') String? contractType,
    @JsonKey(name: 'work_status') String? workStatus,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  AuthUser toDomain() => AuthUser(
        id: id,
        empCode: empCode,
        email: email,
        fullName: fullName,
        phone: phone,
        avatarUrl: avatarUrl,
        position: position,
        departmentId: departmentId,
        departmentName: departmentName,
        role: role,
        managedDepartmentId: managedDepartmentId,
        gender: gender,
        dateOfBirth: dateOfBirth,
        startDate: startDate,
        contractType: contractType,
        workStatus: workStatus,
      );
}
