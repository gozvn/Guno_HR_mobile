// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodayAttendanceDtoImpl _$$TodayAttendanceDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TodayAttendanceDtoImpl(
  id: (json['id'] as num).toInt(),
  employeeId: (json['employee_id'] as num).toInt(),
  date: json['date'] as String,
  checkIn: json['check_in'] as String?,
  checkOut: json['check_out'] as String?,
  status: json['status'] as String,
  workingPoint: (json['working_point'] as num?)?.toDouble(),
  shiftName: json['shift_name'] as String?,
  lateMinutes: (json['late_minutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$$TodayAttendanceDtoImplToJson(
  _$TodayAttendanceDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'employee_id': instance.employeeId,
  'date': instance.date,
  if (instance.checkIn case final value?) 'check_in': value,
  if (instance.checkOut case final value?) 'check_out': value,
  'status': instance.status,
  if (instance.workingPoint case final value?) 'working_point': value,
  if (instance.shiftName case final value?) 'shift_name': value,
  if (instance.lateMinutes case final value?) 'late_minutes': value,
};
