// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ht_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HtRequestDtoImpl _$$HtRequestDtoImplFromJson(Map<String, dynamic> json) =>
    _$HtRequestDtoImpl(
      id: (json['id'] as num).toInt(),
      htRequestId: json['ht_request_id'] as String,
      employeeId: (json['employee_id'] as num).toInt(),
      date: json['date'] as String,
      type: json['type'] as String?,
      typeLabel: json['type_label'] as String?,
      typeCode: json['type_code'] as String?,
      typeEmoji: json['type_emoji'] as String?,
      typeColor: json['type_color'] as String?,
      status: json['status'] as String?,
      syncedAt: json['synced_at'] as String?,
      empCode: json['emp_code'] as String?,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$$HtRequestDtoImplToJson(_$HtRequestDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ht_request_id': instance.htRequestId,
      'employee_id': instance.employeeId,
      'date': instance.date,
      if (instance.type case final value?) 'type': value,
      if (instance.typeLabel case final value?) 'type_label': value,
      if (instance.typeCode case final value?) 'type_code': value,
      if (instance.typeEmoji case final value?) 'type_emoji': value,
      if (instance.typeColor case final value?) 'type_color': value,
      if (instance.status case final value?) 'status': value,
      if (instance.syncedAt case final value?) 'synced_at': value,
      if (instance.empCode case final value?) 'emp_code': value,
      if (instance.fullName case final value?) 'full_name': value,
    };
