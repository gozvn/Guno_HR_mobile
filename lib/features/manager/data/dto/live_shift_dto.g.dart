// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_shift_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveShiftDtoImpl _$$LiveShiftDtoImplFromJson(Map<String, dynamic> json) =>
    _$LiveShiftDtoImpl(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      startAt: json['start_at'] as String,
      endAt: json['end_at'] as String,
      employeeId: (json['employee_id'] as num).toInt(),
      employeeName: json['employee_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      channel: json['channel'] as String,
      status: json['status'] as String,
      gpsDistanceM: (json['gps_distance_m'] as num?)?.toDouble(),
      note: json['note'] as String?,
      rejectReason: json['reject_reason'] as String?,
      approvedByName: json['approved_by_name'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$LiveShiftDtoImplToJson(_$LiveShiftDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
      'employee_id': instance.employeeId,
      if (instance.employeeName case final value?) 'employee_name': value,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
      'channel': instance.channel,
      'status': instance.status,
      if (instance.gpsDistanceM case final value?) 'gps_distance_m': value,
      if (instance.note case final value?) 'note': value,
      if (instance.rejectReason case final value?) 'reject_reason': value,
      if (instance.approvedByName case final value?) 'approved_by_name': value,
      if (instance.createdAt case final value?) 'created_at': value,
    };
