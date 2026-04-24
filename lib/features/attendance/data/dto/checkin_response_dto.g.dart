// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckinResponseDtoImpl _$$CheckinResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CheckinResponseDtoImpl(
  ok: _toBool(json['ok']),
  attendanceId: (json['attendance_id'] as num?)?.toInt(),
  gpsScore: (json['gps_score'] as num?)?.toDouble(),
  gpsDistanceM: (json['gps_distance_m'] as num?)?.toDouble(),
  location: json['location'] == null
      ? null
      : CheckinLocationDto.fromJson(json['location'] as Map<String, dynamic>),
  photoSaved: _toBoolNullable(json['photo_saved']),
  workMinutes: (json['work_minutes'] as num?)?.toInt(),
  method: json['method'] as String?,
);

Map<String, dynamic> _$$CheckinResponseDtoImplToJson(
  _$CheckinResponseDtoImpl instance,
) => <String, dynamic>{
  'ok': instance.ok,
  if (instance.attendanceId case final value?) 'attendance_id': value,
  if (instance.gpsScore case final value?) 'gps_score': value,
  if (instance.gpsDistanceM case final value?) 'gps_distance_m': value,
  if (instance.location?.toJson() case final value?) 'location': value,
  if (instance.photoSaved case final value?) 'photo_saved': value,
  if (instance.workMinutes case final value?) 'work_minutes': value,
  if (instance.method case final value?) 'method': value,
};

_$CheckinLocationDtoImpl _$$CheckinLocationDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CheckinLocationDtoImpl(
  code: json['code'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$$CheckinLocationDtoImplToJson(
  _$CheckinLocationDtoImpl instance,
) => <String, dynamic>{'code': instance.code, 'name': instance.name};
