// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestDtoImpl _$$RequestDtoImplFromJson(Map<String, dynamic> json) =>
    _$RequestDtoImpl(
      id: (json['id'] as num).toInt(),
      employeeId: (json['employee_id'] as num).toInt(),
      type: json['type'] as String,
      status: json['status'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      reason: json['reason'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      typeName: json['type_name'] as String?,
      typeIcon: json['type_icon'] as String?,
      employeeName: json['employee_name'] as String?,
      employeeAvatarUrl: json['employee_avatar_url'] as String?,
    );

Map<String, dynamic> _$$RequestDtoImplToJson(_$RequestDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'type': instance.type,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      if (instance.reason case final value?) 'reason': value,
      'created_at': instance.createdAt,
      if (instance.updatedAt case final value?) 'updated_at': value,
      if (instance.typeName case final value?) 'type_name': value,
      if (instance.typeIcon case final value?) 'type_icon': value,
      if (instance.employeeName case final value?) 'employee_name': value,
      if (instance.employeeAvatarUrl case final value?)
        'employee_avatar_url': value,
    };
