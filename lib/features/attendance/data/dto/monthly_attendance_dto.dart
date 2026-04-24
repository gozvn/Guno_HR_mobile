import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_attendance_dto.freezed.dart';
part 'monthly_attendance_dto.g.dart';

/// Response from GET /api/hr/attendance/monthly?year=YYYY&month=MM.
@freezed
class MonthlyAttendanceDto with _$MonthlyAttendanceDto {
  const factory MonthlyAttendanceDto({
    required int year,
    required int month,
    @Default([]) List<MonthlyDayDto> days,
  }) = _MonthlyAttendanceDto;

  factory MonthlyAttendanceDto.fromJson(Map<String, dynamic> json) =>
      _$MonthlyAttendanceDtoFromJson(json);
}

/// Single day entry in the monthly response (audit line 840–849).
@freezed
class MonthlyDayDto with _$MonthlyDayDto {
  const factory MonthlyDayDto({
    required String date,
    required String status,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    @JsonKey(name: 'working_hours') @Default(0) double workingHours,
    @JsonKey(name: 'late_minutes') @Default(0) int lateMinutes,
  }) = _MonthlyDayDto;

  factory MonthlyDayDto.fromJson(Map<String, dynamic> json) =>
      _$MonthlyDayDtoFromJson(json);
}
