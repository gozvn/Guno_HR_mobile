import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_attendance_dto.freezed.dart';
part 'monthly_attendance_dto.g.dart';

/// Response from GET /api/hr/attendance/monthly?employee_id=me&month=YYYY-MM.
/// Server shape: `{ rows: AttendanceRow[], summary: { ... } }`.
@freezed
class MonthlyAttendanceDto with _$MonthlyAttendanceDto {
  const factory MonthlyAttendanceDto({
    @Default([]) List<MonthlyDayDto> rows,
    MonthlySummaryDto? summary,
  }) = _MonthlyAttendanceDto;

  factory MonthlyAttendanceDto.fromJson(Map<String, dynamic> json) =>
      _$MonthlyAttendanceDtoFromJson(json);
}

/// Single attendance row. Field names mirror server `V4_SELECT` projection.
@freezed
class MonthlyDayDto with _$MonthlyDayDto {
  const factory MonthlyDayDto({
    required String date,
    required String status,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
    @JsonKey(name: 'late_minutes') @Default(0) int lateMinutes,
    @JsonKey(name: 'work_minutes') @Default(0) int workMinutes,
    @JsonKey(name: 'ot_minutes') @Default(0) int otMinutes,
  }) = _MonthlyDayDto;

  factory MonthlyDayDto.fromJson(Map<String, dynamic> json) =>
      _$MonthlyDayDtoFromJson(json);
}

/// Server-side aggregates so we don't recompute on client when not needed.
@freezed
class MonthlySummaryDto with _$MonthlySummaryDto {
  const factory MonthlySummaryDto({
    @JsonKey(name: 'total_days') @Default(0) int totalDays,
    @Default(0) int present,
    @Default(0) int late,
    @Default(0) int absent,
    @Default(0) int leave,
    @JsonKey(name: 'total_work_minutes') @Default(0) int totalWorkMinutes,
    @JsonKey(name: 'total_ot_minutes') @Default(0) int totalOtMinutes,
    @JsonKey(name: 'total_late_minutes') @Default(0) int totalLateMinutes,
  }) = _MonthlySummaryDto;

  factory MonthlySummaryDto.fromJson(Map<String, dynamic> json) =>
      _$MonthlySummaryDtoFromJson(json);
}
