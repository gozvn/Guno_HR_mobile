// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckinRequestDtoImpl _$$CheckinRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CheckinRequestDtoImpl(
  gpsLat: (json['gps_lat'] as num?)?.toDouble(),
  gpsLng: (json['gps_lng'] as num?)?.toDouble(),
  locationCode: json['location_code'] as String?,
  photoBase64: json['photo_base64'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$$CheckinRequestDtoImplToJson(
  _$CheckinRequestDtoImpl instance,
) => <String, dynamic>{
  if (instance.gpsLat case final value?) 'gps_lat': value,
  if (instance.gpsLng case final value?) 'gps_lng': value,
  if (instance.locationCode case final value?) 'location_code': value,
  if (instance.photoBase64 case final value?) 'photo_base64': value,
  if (instance.note case final value?) 'note': value,
};

_$WfhCheckinRequestDtoImpl _$$WfhCheckinRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$WfhCheckinRequestDtoImpl(
  photoBase64: json['photo_base64'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$$WfhCheckinRequestDtoImplToJson(
  _$WfhCheckinRequestDtoImpl instance,
) => <String, dynamic>{
  if (instance.photoBase64 case final value?) 'photo_base64': value,
  if (instance.note case final value?) 'note': value,
};
