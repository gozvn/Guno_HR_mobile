// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: (json['id'] as num).toInt(),
      empCode: json['emp_code'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      phone: json['phone'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      position: json['position'] as String?,
      departmentId: (json['department_id'] as num?)?.toInt(),
      departmentName: json['department_name'] as String?,
      role: json['role'] as String,
      managedDepartmentId: (json['managed_department_id'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      startDate: json['start_date'] as String?,
      contractType: json['contract_type'] as String?,
      workStatus: json['work_status'] as String?,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emp_code': instance.empCode,
      'email': instance.email,
      'full_name': instance.fullName,
      if (instance.phone case final value?) 'phone': value,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
      if (instance.position case final value?) 'position': value,
      if (instance.departmentId case final value?) 'department_id': value,
      if (instance.departmentName case final value?) 'department_name': value,
      'role': instance.role,
      if (instance.managedDepartmentId case final value?)
        'managed_department_id': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.dateOfBirth case final value?) 'date_of_birth': value,
      if (instance.startDate case final value?) 'start_date': value,
      if (instance.contractType case final value?) 'contract_type': value,
      if (instance.workStatus case final value?) 'work_status': value,
    };
