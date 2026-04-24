// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodaySummaryDtoImpl _$$TodaySummaryDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TodaySummaryDtoImpl(
  totalEmployees: (json['total_employees'] as num?)?.toInt() ?? 0,
  presentCount: (json['checked_in'] as num?)?.toInt() ?? 0,
  lateCount: (json['late'] as num?)?.toInt() ?? 0,
  absentCount: (json['absent'] as num?)?.toInt() ?? 0,
  leaveCount: (json['leave_count'] as num?)?.toInt() ?? 0,
  wfhCount: (json['wfh_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$TodaySummaryDtoImplToJson(
  _$TodaySummaryDtoImpl instance,
) => <String, dynamic>{
  'total_employees': instance.totalEmployees,
  'checked_in': instance.presentCount,
  'late': instance.lateCount,
  'absent': instance.absentCount,
  'leave_count': instance.leaveCount,
  'wfh_count': instance.wfhCount,
};
