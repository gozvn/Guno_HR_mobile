// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_balance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveBalanceDtoImpl _$$LeaveBalanceDtoImplFromJson(
  Map<String, dynamic> json,
) => _$LeaveBalanceDtoImpl(
  sourceCode: json['source_code'] as String,
  sourceName: json['source_name'] as String,
  total: (json['total'] as num).toDouble(),
  used: (json['used'] as num).toDouble(),
  remaining: (json['remaining'] as num).toDouble(),
  expired: (json['expired'] as num?)?.toDouble() ?? 0,
  syncedAt: json['synced_at'] as String?,
);

Map<String, dynamic> _$$LeaveBalanceDtoImplToJson(
  _$LeaveBalanceDtoImpl instance,
) => <String, dynamic>{
  'source_code': instance.sourceCode,
  'source_name': instance.sourceName,
  'total': instance.total,
  'used': instance.used,
  'remaining': instance.remaining,
  'expired': instance.expired,
  if (instance.syncedAt case final value?) 'synced_at': value,
};
