// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_doc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyDocDtoImpl _$$CompanyDocDtoImplFromJson(Map<String, dynamic> json) =>
    _$CompanyDocDtoImpl(
      id: (json['id'] as num).toInt(),
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      mimeType: json['mime_type'] as String?,
      fileSize: (json['file_size'] as num?)?.toInt(),
      fileUrl: json['file_url'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$CompanyDocDtoImplToJson(_$CompanyDocDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.parentId case final value?) 'parent_id': value,
      'name': instance.name,
      'type': instance.type,
      if (instance.mimeType case final value?) 'mime_type': value,
      if (instance.fileSize case final value?) 'file_size': value,
      if (instance.fileUrl case final value?) 'file_url': value,
      'created_at': instance.createdAt,
    };
