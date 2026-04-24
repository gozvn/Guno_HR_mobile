// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval_step_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApprovalStepDtoImpl _$$ApprovalStepDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ApprovalStepDtoImpl(
  id: (json['id'] as num).toInt(),
  requestId: (json['request_id'] as num).toInt(),
  approverId: (json['approver_id'] as num).toInt(),
  approverName: json['approver_name'] as String,
  approverAvatar: json['approver_avatar'] as String?,
  stepOrder: (json['step_order'] as num).toInt(),
  status: json['status'] as String,
  comment: json['comment'] as String?,
  approvedAt: json['approved_at'] as String?,
);

Map<String, dynamic> _$$ApprovalStepDtoImplToJson(
  _$ApprovalStepDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'request_id': instance.requestId,
  'approver_id': instance.approverId,
  'approver_name': instance.approverName,
  if (instance.approverAvatar case final value?) 'approver_avatar': value,
  'step_order': instance.stepOrder,
  'status': instance.status,
  if (instance.comment case final value?) 'comment': value,
  if (instance.approvedAt case final value?) 'approved_at': value,
};
