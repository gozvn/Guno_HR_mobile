import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_dto.freezed.dart';
part 'attachment_dto.g.dart';

@freezed
class AttachmentDto with _$AttachmentDto {
  const factory AttachmentDto({
    required int id,
    required int requestId,
    required String url,
    required String filename,
    String? uploadedAt,
  }) = _AttachmentDto;

  factory AttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDtoFromJson(json);
}
