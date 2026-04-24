// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarEntryDtoImpl _$$CalendarEntryDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CalendarEntryDtoImpl(
  id: (json['id'] as num).toInt(),
  date: json['date'] as String,
  type: json['type'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$CalendarEntryDtoImplToJson(
  _$CalendarEntryDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'type': instance.type,
  'name': instance.name,
  if (instance.description case final value?) 'description': value,
};
