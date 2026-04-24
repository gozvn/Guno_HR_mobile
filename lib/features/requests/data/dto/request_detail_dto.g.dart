// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestDetailDtoImpl _$$RequestDetailDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RequestDetailDtoImpl(
  id: (json['id'] as num).toInt(),
  employeeId: (json['employee_id'] as num).toInt(),
  type: json['type'] as String,
  status: json['status'] as String,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  reason: json['reason'] as String?,
  createdAt: json['created_at'] as String,
  typeName: json['type_name'] as String?,
  typeIcon: json['type_icon'] as String?,
  approvals:
      (json['approvals'] as List<dynamic>?)
          ?.map((e) => ApprovalStepDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$RequestDetailDtoImplToJson(
  _$RequestDetailDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'employee_id': instance.employeeId,
  'type': instance.type,
  'status': instance.status,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  if (instance.reason case final value?) 'reason': value,
  'created_at': instance.createdAt,
  if (instance.typeName case final value?) 'type_name': value,
  if (instance.typeIcon case final value?) 'type_icon': value,
  'approvals': instance.approvals.map((e) => e.toJson()).toList(),
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
};
