import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin_response_dto.freezed.dart';
part 'checkin_response_dto.g.dart';

bool _toBool(Object? v) => v == true || v == 1 || v == '1';
bool? _toBoolNullable(Object? v) => v == null ? null : _toBool(v);

/// Response shape for POST /api/hr/attendance/mobile-checkin|checkout.
@freezed
class CheckinResponseDto with _$CheckinResponseDto {
  const factory CheckinResponseDto({
    @JsonKey(fromJson: _toBool) required bool ok,
    @JsonKey(name: 'attendance_id') int? attendanceId,
    @JsonKey(name: 'gps_score') double? gpsScore,
    @JsonKey(name: 'gps_distance_m') double? gpsDistanceM,
    CheckinLocationDto? location,
    @JsonKey(name: 'photo_saved', fromJson: _toBoolNullable) bool? photoSaved,
    // WFH checkout adds work_minutes.
    @JsonKey(name: 'work_minutes') int? workMinutes,
    // WFH checkin adds method.
    String? method,
  }) = _CheckinResponseDto;

  factory CheckinResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckinResponseDtoFromJson(json);
}

@freezed
class CheckinLocationDto with _$CheckinLocationDto {
  const factory CheckinLocationDto({
    required String code,
    required String name,
  }) = _CheckinLocationDto;

  factory CheckinLocationDto.fromJson(Map<String, dynamic> json) =>
      _$CheckinLocationDtoFromJson(json);
}
