import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_record_dto.freezed.dart';
part 'attendance_record_dto.g.dart';

bool? _toBoolNullable(Object? v) =>
    v == null ? null : (v == true || v == 1 || v == '1');

/// Single attendance row from GET /api/hr/attendance.
@freezed
class AttendanceRecordDto with _$AttendanceRecordDto {
  const factory AttendanceRecordDto({
    required int id,
    @JsonKey(name: 'employee_id') required int employeeId,
    required String date,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    @JsonKey(name: 'check_in_method') String? checkInMethod,
    required String status,
    @JsonKey(name: 'late_minutes') @Default(0) int lateMinutes,
    @JsonKey(name: 'early_minutes') @Default(0) int earlyMinutes,
    @JsonKey(name: 'work_minutes') @Default(0) int workMinutes,
    @JsonKey(name: 'ot_minutes') @Default(0) int otMinutes,
    @JsonKey(name: 'working_point') @Default(0) double workingPoint,
    @JsonKey(name: 'text_symbol') String? textSymbol,
    @JsonKey(name: 'color_status') String? colorStatus,
    @JsonKey(name: 'shift_name') String? shiftName,
    @JsonKey(name: 'shift_work_from') String? shiftWorkFrom,
    @JsonKey(name: 'shift_work_to') String? shiftWorkTo,
    @JsonKey(name: 'actual_working_hours') double? actualWorkingHours,
    @JsonKey(name: 'ot_hours') double? otHours,
    @JsonKey(name: 'is_lack_working_point', fromJson: _toBoolNullable)
    bool? isLackWorkingPoint,
    @Default('') String note,
  }) = _AttendanceRecordDto;

  factory AttendanceRecordDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordDtoFromJson(json);
}
