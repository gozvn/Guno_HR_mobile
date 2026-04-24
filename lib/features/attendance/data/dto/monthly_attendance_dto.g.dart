// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyAttendanceDtoImpl _$$MonthlyAttendanceDtoImplFromJson(
  Map<String, dynamic> json,
) => _$MonthlyAttendanceDtoImpl(
  year: (json['year'] as num).toInt(),
  month: (json['month'] as num).toInt(),
  days:
      (json['days'] as List<dynamic>?)
          ?.map((e) => MonthlyDayDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$MonthlyAttendanceDtoImplToJson(
  _$MonthlyAttendanceDtoImpl instance,
) => <String, dynamic>{
  'year': instance.year,
  'month': instance.month,
  'days': instance.days.map((e) => e.toJson()).toList(),
};

_$MonthlyDayDtoImpl _$$MonthlyDayDtoImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyDayDtoImpl(
      date: json['date'] as String,
      status: json['status'] as String,
      checkIn: json['check_in'] as String?,
      checkOut: json['check_out'] as String?,
      workingHours: (json['working_hours'] as num?)?.toDouble() ?? 0,
      lateMinutes: (json['late_minutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MonthlyDayDtoImplToJson(_$MonthlyDayDtoImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'status': instance.status,
      if (instance.checkIn case final value?) 'check_in': value,
      if (instance.checkOut case final value?) 'check_out': value,
      'working_hours': instance.workingHours,
      'late_minutes': instance.lateMinutes,
    };
