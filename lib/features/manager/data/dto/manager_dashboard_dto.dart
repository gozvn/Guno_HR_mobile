import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_dashboard_dto.freezed.dart';
part 'manager_dashboard_dto.g.dart';

// ---------------------------------------------------------------------------
// Manager stats (4 tiles in dashboard grid)

@freezed
class ManagerStatsDto with _$ManagerStatsDto {
  const factory ManagerStatsDto({
    @Default(0) int present,
    @Default(0) int late,
    @Default(0) int absent,
    @JsonKey(name: 'pending_count') @Default(0) int pendingCount,
  }) = _ManagerStatsDto;

  factory ManagerStatsDto.fromJson(Map<String, dynamic> json) =>
      _$ManagerStatsDtoFromJson(json);
}

// ---------------------------------------------------------------------------
// One row in today_attendance[]

@freezed
class TodayAttendanceRowDto with _$TodayAttendanceRowDto {
  const factory TodayAttendanceRowDto({
    @JsonKey(name: 'employee_id') required int employeeId,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'check_in_at') String? checkInAt,
    @JsonKey(name: 'check_out_at') String? checkOutAt,
    required String status, // present | late | absent
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _TodayAttendanceRowDto;

  factory TodayAttendanceRowDto.fromJson(Map<String, dynamic> json) =>
      _$TodayAttendanceRowDtoFromJson(json);
}

// ---------------------------------------------------------------------------
// One team member in team[] roster

@freezed
class TeamMemberDto with _$TeamMemberDto {
  const factory TeamMemberDto({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  }) = _TeamMemberDto;

  factory TeamMemberDto.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberDtoFromJson(json);
}

// ---------------------------------------------------------------------------
// Pending request summary for manager dashboard (top 3 list)

@freezed
class PendingRequestSummaryDto with _$PendingRequestSummaryDto {
  const factory PendingRequestSummaryDto({
    required int id,
    @JsonKey(name: 'employee_id') required int employeeId,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    required String type,
    @JsonKey(name: 'type_name') String? typeName,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    String? reason,
    required String status,
  }) = _PendingRequestSummaryDto;

  factory PendingRequestSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$PendingRequestSummaryDtoFromJson(json);
}

// ---------------------------------------------------------------------------
// Root response from GET /api/hr/dashboard/manager

@freezed
class ManagerDashboardDto with _$ManagerDashboardDto {
  const factory ManagerDashboardDto({
    @JsonKey(name: 'team_size') @Default(0) int teamSize,
    @Default([]) List<TeamMemberDto> team,
    @JsonKey(name: 'today_attendance')
    @Default([])
    List<TodayAttendanceRowDto> todayAttendance,
    @JsonKey(name: 'pending_requests')
    @Default([])
    List<PendingRequestSummaryDto> pendingRequests,
    required ManagerStatsDto stats,
  }) = _ManagerDashboardDto;

  factory ManagerDashboardDto.fromJson(Map<String, dynamic> json) =>
      _$ManagerDashboardDtoFromJson(json);
}
