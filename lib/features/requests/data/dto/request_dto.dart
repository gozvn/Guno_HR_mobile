import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_dto.freezed.dart';
part 'request_dto.g.dart';

@freezed
class RequestDto with _$RequestDto {
  const factory RequestDto({
    required int id,
    required int employeeId,
    required String type,
    required String status,
    required String startDate,
    required String endDate,
    String? reason,
    required String createdAt,
    String? updatedAt,
    String? typeName,
    String? typeIcon,
    // Present when manager queries pending list — server joins employee table.
    @JsonKey(name: 'employee_name') String? employeeName,
    @JsonKey(name: 'employee_avatar_url') String? employeeAvatarUrl,
  }) = _RequestDto;

  factory RequestDto.fromJson(Map<String, dynamic> json) =>
      _$RequestDtoFromJson(json);
}
