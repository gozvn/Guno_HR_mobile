// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDtoImpl _$$LocationDtoImplFromJson(Map<String, dynamic> json) =>
    _$LocationDtoImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      gpsLat: (json['gps_lat'] as num?)?.toDouble(),
      gpsLng: (json['gps_lng'] as num?)?.toDouble(),
      gpsRadiusM: (json['gps_radius_m'] as num?)?.toInt() ?? 500,
      isActive: json['is_active'] == null ? true : _toBool(json['is_active']),
      address: json['address'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$LocationDtoImplToJson(_$LocationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      if (instance.gpsLat case final value?) 'gps_lat': value,
      if (instance.gpsLng case final value?) 'gps_lng': value,
      'gps_radius_m': instance.gpsRadiusM,
      'is_active': instance.isActive,
      if (instance.address case final value?) 'address': value,
      if (instance.createdAt case final value?) 'created_at': value,
    };

_$NearestLocationDtoImpl _$$NearestLocationDtoImplFromJson(
  Map<String, dynamic> json,
) => _$NearestLocationDtoImpl(
  nearest: json['nearest'] == null
      ? null
      : NearestLocationEntryDto.fromJson(
          json['nearest'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$NearestLocationDtoImplToJson(
  _$NearestLocationDtoImpl instance,
) => <String, dynamic>{
  if (instance.nearest?.toJson() case final value?) 'nearest': value,
};

_$NearestLocationEntryDtoImpl _$$NearestLocationEntryDtoImplFromJson(
  Map<String, dynamic> json,
) => _$NearestLocationEntryDtoImpl(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  distanceM: (json['distance_m'] as num).toDouble(),
);

Map<String, dynamic> _$$NearestLocationEntryDtoImplToJson(
  _$NearestLocationEntryDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'distance_m': instance.distanceM,
};
