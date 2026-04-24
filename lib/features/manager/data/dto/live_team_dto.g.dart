// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_team_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveTeamMemberDtoImpl _$$LiveTeamMemberDtoImplFromJson(
  Map<String, dynamic> json,
) => _$LiveTeamMemberDtoImpl(
  id: (json['id'] as num).toInt(),
  employeeId: (json['employee_id'] as num).toInt(),
  role: json['role'] as String,
  active: json['active'] == null ? true : _toBool(json['active']),
  fullName: json['full_name'] as String,
  empCode: json['emp_code'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  position: json['position'] as String?,
);

Map<String, dynamic> _$$LiveTeamMemberDtoImplToJson(
  _$LiveTeamMemberDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'employee_id': instance.employeeId,
  'role': instance.role,
  'active': instance.active,
  'full_name': instance.fullName,
  if (instance.empCode case final value?) 'emp_code': value,
  if (instance.avatarUrl case final value?) 'avatar_url': value,
  if (instance.position case final value?) 'position': value,
};

_$LiveChannelDtoImpl _$$LiveChannelDtoImplFromJson(Map<String, dynamic> json) =>
    _$LiveChannelDtoImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$LiveChannelDtoImplToJson(
  _$LiveChannelDtoImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  if (instance.icon case final value?) 'icon': value,
};

_$EmployeeSearchDtoImpl _$$EmployeeSearchDtoImplFromJson(
  Map<String, dynamic> json,
) => _$EmployeeSearchDtoImpl(
  id: (json['id'] as num).toInt(),
  fullName: json['full_name'] as String,
  empCode: json['emp_code'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  position: json['position'] as String?,
);

Map<String, dynamic> _$$EmployeeSearchDtoImplToJson(
  _$EmployeeSearchDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  if (instance.empCode case final value?) 'emp_code': value,
  if (instance.avatarUrl case final value?) 'avatar_url': value,
  if (instance.position case final value?) 'position': value,
};
