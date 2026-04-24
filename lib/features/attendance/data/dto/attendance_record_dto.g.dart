// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceRecordDtoImpl _$$AttendanceRecordDtoImplFromJson(
  Map<String, dynamic> json,
) => _$AttendanceRecordDtoImpl(
  id: (json['id'] as num).toInt(),
  employeeId: (json['employee_id'] as num).toInt(),
  date: json['date'] as String,
  checkIn: json['check_in'] as String?,
  checkOut: json['check_out'] as String?,
  checkInMethod: json['check_in_method'] as String?,
  status: json['status'] as String,
  lateMinutes: (json['late_minutes'] as num?)?.toInt() ?? 0,
  earlyMinutes: (json['early_minutes'] as num?)?.toInt() ?? 0,
  workMinutes: (json['work_minutes'] as num?)?.toInt() ?? 0,
  otMinutes: (json['ot_minutes'] as num?)?.toInt() ?? 0,
  workingPoint: (json['working_point'] as num?)?.toDouble() ?? 0,
  textSymbol: json['text_symbol'] as String?,
  colorStatus: json['color_status'] as String?,
  shiftName: json['shift_name'] as String?,
  shiftWorkFrom: json['shift_work_from'] as String?,
  shiftWorkTo: json['shift_work_to'] as String?,
  actualWorkingHours: (json['actual_working_hours'] as num?)?.toDouble(),
  otHours: (json['ot_hours'] as num?)?.toDouble(),
  isLackWorkingPoint: _toBoolNullable(json['is_lack_working_point']),
  note: json['note'] as String? ?? '',
);

Map<String, dynamic> _$$AttendanceRecordDtoImplToJson(
  _$AttendanceRecordDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'employee_id': instance.employeeId,
  'date': instance.date,
  if (instance.checkIn case final value?) 'check_in': value,
  if (instance.checkOut case final value?) 'check_out': value,
  if (instance.checkInMethod case final value?) 'check_in_method': value,
  'status': instance.status,
  'late_minutes': instance.lateMinutes,
  'early_minutes': instance.earlyMinutes,
  'work_minutes': instance.workMinutes,
  'ot_minutes': instance.otMinutes,
  'working_point': instance.workingPoint,
  if (instance.textSymbol case final value?) 'text_symbol': value,
  if (instance.colorStatus case final value?) 'color_status': value,
  if (instance.shiftName case final value?) 'shift_name': value,
  if (instance.shiftWorkFrom case final value?) 'shift_work_from': value,
  if (instance.shiftWorkTo case final value?) 'shift_work_to': value,
  if (instance.actualWorkingHours case final value?)
    'actual_working_hours': value,
  if (instance.otHours case final value?) 'ot_hours': value,
  if (instance.isLackWorkingPoint case final value?)
    'is_lack_working_point': value,
  'note': instance.note,
};
