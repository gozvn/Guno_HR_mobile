import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_attendance_dto.freezed.dart';
part 'today_attendance_dto.g.dart';

// Subset of GET /api/hr/attendance array item (audit line 620–645).
// employee_id=me&date=today — may be null if no check-in yet.
@freezed
class TodayAttendanceDto with _$TodayAttendanceDto {
  const factory TodayAttendanceDto({
    required int id,
    @JsonKey(name: 'employee_id') required int employeeId,
    required String date,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    required String status,
    @JsonKey(name: 'working_point') double? workingPoint,
    @JsonKey(name: 'shift_name') String? shiftName,
    @JsonKey(name: 'late_minutes') int? lateMinutes,
  }) = _TodayAttendanceDto;

  factory TodayAttendanceDto.fromJson(Map<String, dynamic> json) =>
      _$TodayAttendanceDtoFromJson(json);
}
