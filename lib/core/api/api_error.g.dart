// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      field: json['field'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      requestId: json['request_id'] as String?,
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      if (instance.field case final value?) 'field': value,
      if (instance.details case final value?) 'details': value,
      if (instance.requestId case final value?) 'request_id': value,
    };
