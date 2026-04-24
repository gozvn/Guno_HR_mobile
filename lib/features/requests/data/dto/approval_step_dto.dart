import 'package:freezed_annotation/freezed_annotation.dart';

part 'approval_step_dto.freezed.dart';
part 'approval_step_dto.g.dart';

@freezed
class ApprovalStepDto with _$ApprovalStepDto {
  const factory ApprovalStepDto({
    required int id,
    required int requestId,
    required int approverId,
    required String approverName,
    String? approverAvatar,
    required int stepOrder,
    required String status,
    String? comment,
    String? approvedAt,
  }) = _ApprovalStepDto;

  factory ApprovalStepDto.fromJson(Map<String, dynamic> json) =>
      _$ApprovalStepDtoFromJson(json);
}
