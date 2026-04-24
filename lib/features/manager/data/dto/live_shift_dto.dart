import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_shift_dto.freezed.dart';
part 'live_shift_dto.g.dart';

// ---------------------------------------------------------------------------
// Live shift — GET /api/hr/live-shifts

@freezed
class LiveShiftDto with _$LiveShiftDto {
  const factory LiveShiftDto({
    required int id,
    required String date,           // YYYY-MM-DD
    @JsonKey(name: 'start_at') required String startAt,  // HH:mm
    @JsonKey(name: 'end_at') required String endAt,      // HH:mm
    @JsonKey(name: 'employee_id') required int employeeId,
    @JsonKey(name: 'employee_name') String? employeeName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    required String channel,        // fb | tiktok | ...
    required String status,         // planned | active | completed | cancelled | rejected | approved
    @JsonKey(name: 'gps_distance_m') double? gpsDistanceM,
    String? note,
    @JsonKey(name: 'reject_reason') String? rejectReason,
    @JsonKey(name: 'approved_by_name') String? approvedByName,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _LiveShiftDto;

  factory LiveShiftDto.fromJson(Map<String, dynamic> json) =>
      _$LiveShiftDtoFromJson(json);
}
