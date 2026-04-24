import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/dto/request_summary_dto.dart';
import '../data/dto/today_attendance_dto.dart';
import '../data/dto/today_summary_dto.dart';

part 'dashboard_state.freezed.dart';

// Freezed bundle combining all 3 dashboard endpoint responses.
@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required TodaySummaryDto todaySummary,
    required RequestSummaryDto requestSummary,
    // null = no attendance record today (not yet checked in or day off).
    TodayAttendanceDto? todayAttendance,
  }) = _DashboardState;
}
