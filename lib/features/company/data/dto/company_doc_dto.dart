import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_doc_dto.freezed.dart';
part 'company_doc_dto.g.dart';

// Maps GET /api/hr/company-docs flat list item (audit line 2168–2181).
@freezed
class CompanyDocDto with _$CompanyDocDto {
  const factory CompanyDocDto({
    required int id,
    @JsonKey(name: 'parent_id') int? parentId,
    required String name,
    // 'folder' | 'file'
    required String type,
    @JsonKey(name: 'mime_type') String? mimeType,
    @JsonKey(name: 'file_size') int? fileSize,
    @JsonKey(name: 'file_url') String? fileUrl,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _CompanyDocDto;

  factory CompanyDocDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyDocDtoFromJson(json);
}
