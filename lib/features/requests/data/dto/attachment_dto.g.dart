// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentDtoImpl _$$AttachmentDtoImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentDtoImpl(
      id: (json['id'] as num).toInt(),
      requestId: (json['request_id'] as num).toInt(),
      url: json['url'] as String,
      filename: json['filename'] as String,
      uploadedAt: json['uploaded_at'] as String?,
    );

Map<String, dynamic> _$$AttachmentDtoImplToJson(_$AttachmentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_id': instance.requestId,
      'url': instance.url,
      'filename': instance.filename,
      if (instance.uploadedAt case final value?) 'uploaded_at': value,
    };
