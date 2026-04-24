import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

/// SQLite-backed API returns booleans as 0/1 ints — accept both.
bool _toBool(Object? v) => v == true || v == 1 || v == '1';

/// Office location from GET /api/hr/locations.
@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    required int id,
    required String code,
    required String name,
    @JsonKey(name: 'gps_lat') double? gpsLat,
    @JsonKey(name: 'gps_lng') double? gpsLng,
    @JsonKey(name: 'gps_radius_m') @Default(500) int gpsRadiusM,
    @JsonKey(name: 'is_active', fromJson: _toBool) @Default(true) bool isActive,
    String? address,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

/// Nearest location result from GET /api/hr/locations/near.
@freezed
class NearestLocationDto with _$NearestLocationDto {
  const factory NearestLocationDto({
    NearestLocationEntryDto? nearest,
  }) = _NearestLocationDto;

  factory NearestLocationDto.fromJson(Map<String, dynamic> json) =>
      _$NearestLocationDtoFromJson(json);
}

@freezed
class NearestLocationEntryDto with _$NearestLocationEntryDto {
  const factory NearestLocationEntryDto({
    required int id,
    required String code,
    required String name,
    @JsonKey(name: 'distance_m') required double distanceM,
  }) = _NearestLocationEntryDto;

  factory NearestLocationEntryDto.fromJson(Map<String, dynamic> json) =>
      _$NearestLocationEntryDtoFromJson(json);
}
