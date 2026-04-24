import 'package:freezed_annotation/freezed_annotation.dart';

import 'approval_step_dto.dart';
import 'attachment_dto.dart';

part 'request_detail_dto.freezed.dart';
part 'request_detail_dto.g.dart';

@freezed
class RequestDetailDto with _$RequestDetailDto {
  const factory RequestDetailDto({
    required int id,
    required int employeeId,
    required String type,
    required String status,
    required String startDate,
    required String endDate,
    String? reason,
    required String createdAt,
    String? typeName,
    String? typeIcon,
    @Default([]) List<ApprovalStepDto> approvals,
    @Default([]) List<AttachmentDto> attachments,
  }) = _RequestDetailDto;

  factory RequestDetailDto.fromJson(Map<String, dynamic> json) =>
      _$RequestDetailDtoFromJson(json);
}
