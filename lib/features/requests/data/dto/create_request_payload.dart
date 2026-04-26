import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_request_payload.freezed.dart';
part 'create_request_payload.g.dart';

@freezed
class CreateRequestPayload with _$CreateRequestPayload {
  const factory CreateRequestPayload({
    required String type,
    required String startDate,
    required String endDate,
    String? reason,
    @Default([]) List<String> attachmentUrls,
  }) = _CreateRequestPayload;

  factory CreateRequestPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateRequestPayloadFromJson(json);
}

@freezed
class AttachmentUploadResult with _$AttachmentUploadResult {
  const factory AttachmentUploadResult({
    required String url,
    required String filename,
  }) = _AttachmentUploadResult;

  factory AttachmentUploadResult.fromJson(Map<String, dynamic> json) =>
      _$AttachmentUploadResultFromJson(json);
}

@freezed
class CreatedRequest with _$CreatedRequest {
  const factory CreatedRequest({
    required int id,
    // Server response from POST /requests is `{id, request_code, firstApproverId?}`
    // — no status field. Default to 'pending' (the DB default for new rows).
    @Default('pending') String status,
    @JsonKey(name: 'request_code') String? requestCode,
    // Server sends camelCase 'firstApproverId' despite snake_case build.yaml global setting.
    @JsonKey(name: 'firstApproverId') int? firstApproverId,
  }) = _CreatedRequest;

  factory CreatedRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatedRequestFromJson(json);
}
