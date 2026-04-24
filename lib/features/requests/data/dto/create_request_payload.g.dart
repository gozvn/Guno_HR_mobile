// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateRequestPayloadImpl _$$CreateRequestPayloadImplFromJson(
  Map<String, dynamic> json,
) => _$CreateRequestPayloadImpl(
  type: json['type'] as String,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  reason: json['reason'] as String?,
  attachmentUrls:
      (json['attachment_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CreateRequestPayloadImplToJson(
  _$CreateRequestPayloadImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  if (instance.reason case final value?) 'reason': value,
  'attachment_urls': instance.attachmentUrls,
};

_$AttachmentUploadResultImpl _$$AttachmentUploadResultImplFromJson(
  Map<String, dynamic> json,
) => _$AttachmentUploadResultImpl(
  url: json['url'] as String,
  filename: json['filename'] as String,
);

Map<String, dynamic> _$$AttachmentUploadResultImplToJson(
  _$AttachmentUploadResultImpl instance,
) => <String, dynamic>{'url': instance.url, 'filename': instance.filename};

_$CreatedRequestImpl _$$CreatedRequestImplFromJson(Map<String, dynamic> json) =>
    _$CreatedRequestImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      firstApproverId: (json['firstApproverId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CreatedRequestImplToJson(
  _$CreatedRequestImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  if (instance.firstApproverId case final value?) 'firstApproverId': value,
};
