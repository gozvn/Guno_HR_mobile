import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin_request_dto.freezed.dart';
part 'checkin_request_dto.g.dart';

/// Wire DTO for POST /api/hr/attendance/mobile-checkin and /mobile-checkout.
/// photo_base64 is a data URI string: "data:image/jpeg;base64,<data>".
/// Max decoded size 5MB — enforced by PhotoCompressor before encoding.
@freezed
class CheckinRequestDto with _$CheckinRequestDto {
  const factory CheckinRequestDto({
    @JsonKey(name: 'gps_lat') double? gpsLat,
    @JsonKey(name: 'gps_lng') double? gpsLng,
    @JsonKey(name: 'location_code') String? locationCode,
    @JsonKey(name: 'photo_base64') String? photoBase64,
    String? note,
  }) = _CheckinRequestDto;

  factory CheckinRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CheckinRequestDtoFromJson(json);
}

/// Wire DTO for POST /api/hr/attendance/wfh-checkin and /wfh-checkout.
@freezed
class WfhCheckinRequestDto with _$WfhCheckinRequestDto {
  const factory WfhCheckinRequestDto({
    @JsonKey(name: 'photo_base64') String? photoBase64,
    String? note,
  }) = _WfhCheckinRequestDto;

  factory WfhCheckinRequestDto.fromJson(Map<String, dynamic> json) =>
      _$WfhCheckinRequestDtoFromJson(json);
}
