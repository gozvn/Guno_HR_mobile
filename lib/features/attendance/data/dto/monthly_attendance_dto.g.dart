// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyAttendanceDtoImpl _$$MonthlyAttendanceDtoImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlyAttendanceDtoImpl(
  rows:
      (json['rows'] as List<dynamic>?)
          ?.map((e) => MonthlyDayDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  summary: json['summary'] == null
      ? null
      : MonthlySummaryDto.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$MonthlyAttendanceDtoImplToJson(
  _$MonthlyAttendanceDtoImpl instance,
) => <String, dynamic>{
  'rows': instance.rows.map((e) => e.toJson()).toList(),
  if (instance.summary?.toJson() case final value?) 'summary': value,
};

_$MonthlyDayDtoImpl _$$MonthlyDayDtoImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyDayDtoImpl(
      date: json['date'] as String,
      status: json['status'] as String,
      checkIn: json['check_in'] as String?,
      checkOut: json['check_out'] as String?,
      lateMinutes: (json['late_minutes'] as num?)?.toInt() ?? 0,
      workMinutes: (json['work_minutes'] as num?)?.toInt() ?? 0,
      otMinutes: (json['ot_minutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MonthlyDayDtoImplToJson(_$MonthlyDayDtoImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'status': instance.status,
      if (instance.checkIn case final value?) 'check_in': value,
      if (instance.checkOut case final value?) 'check_out': value,
      'late_minutes': instance.lateMinutes,
      'work_minutes': instance.workMinutes,
      'ot_minutes': instance.otMinutes,
    };

_$MonthlySummaryDtoImpl _$$MonthlySummaryDtoImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlySummaryDtoImpl(
  totalDays: (json['total_days'] as num?)?.toInt() ?? 0,
  present: (json['present'] as num?)?.toInt() ?? 0,
  late: (json['late'] as num?)?.toInt() ?? 0,
  absent: (json['absent'] as num?)?.toInt() ?? 0,
  leave: (json['leave'] as num?)?.toInt() ?? 0,
  totalWorkMinutes: (json['total_work_minutes'] as num?)?.toInt() ?? 0,
  totalOtMinutes: (json['total_ot_minutes'] as num?)?.toInt() ?? 0,
  totalLateMinutes: (json['total_late_minutes'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$MonthlySummaryDtoImplToJson(
  _$MonthlySummaryDtoImpl instance,
) => <String, dynamic>{
  'total_days': instance.totalDays,
  'present': instance.present,
  'late': instance.late,
  'absent': instance.absent,
  'leave': instance.leave,
  'total_work_minutes': instance.totalWorkMinutes,
  'total_ot_minutes': instance.totalOtMinutes,
  'total_late_minutes': instance.totalLateMinutes,
};
