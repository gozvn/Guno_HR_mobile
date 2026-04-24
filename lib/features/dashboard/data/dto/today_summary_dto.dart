import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_summary_dto.freezed.dart';
part 'today_summary_dto.g.dart';

// Maps GET /api/hr/attendance/today/summary response.
// Server shape (verified 2026-04-24):
//   { date, total_employees, checked_in, late, absent }
// leave/wfh counts not returned — default to 0.
@freezed
class TodaySummaryDto with _$TodaySummaryDto {
  const factory TodaySummaryDto({
    @JsonKey(name: 'total_employees') @Default(0) int totalEmployees,
    @JsonKey(name: 'checked_in') @Default(0) int presentCount,
    @JsonKey(name: 'late') @Default(0) int lateCount,
    @JsonKey(name: 'absent') @Default(0) int absentCount,
    @JsonKey(name: 'leave_count') @Default(0) int leaveCount,
    @JsonKey(name: 'wfh_count') @Default(0) int wfhCount,
  }) = _TodaySummaryDto;

  factory TodaySummaryDto.fromJson(Map<String, dynamic> json) =>
      _$TodaySummaryDtoFromJson(json);
}
