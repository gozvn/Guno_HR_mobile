import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_team_dto.freezed.dart';
part 'live_team_dto.g.dart';

bool _toBool(Object? v) => v == true || v == 1 || v == '1';

// ---------------------------------------------------------------------------
// Live team member — GET /api/hr/live-team/members

@freezed
class LiveTeamMemberDto with _$LiveTeamMemberDto {
  const factory LiveTeamMemberDto({
    required int id, // roster row id (for PUT/DELETE)
    @JsonKey(name: 'employee_id') required int employeeId,
    required String role, // host | editor
    @JsonKey(fromJson: _toBool) @Default(true) bool active,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'emp_code') String? empCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  }) = _LiveTeamMemberDto;

  factory LiveTeamMemberDto.fromJson(Map<String, dynamic> json) =>
      _$LiveTeamMemberDtoFromJson(json);
}

// ---------------------------------------------------------------------------
// Channel lookup — GET /api/hr/live-team/channels

@freezed
class LiveChannelDto with _$LiveChannelDto {
  const factory LiveChannelDto({
    required String code,
    required String name,
    String? icon,
  }) = _LiveChannelDto;

  factory LiveChannelDto.fromJson(Map<String, dynamic> json) =>
      _$LiveChannelDtoFromJson(json);
}

// ---------------------------------------------------------------------------
// Employee search result — GET /api/hr/employees?search=

@freezed
class EmployeeSearchDto with _$EmployeeSearchDto {
  const factory EmployeeSearchDto({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'emp_code') String? empCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? position,
  }) = _EmployeeSearchDto;

  factory EmployeeSearchDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSearchDtoFromJson(json);
}
