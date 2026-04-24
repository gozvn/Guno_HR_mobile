import 'package:freezed_annotation/freezed_annotation.dart';

part 'ht_request_dto.freezed.dart';
part 'ht_request_dto.g.dart';

@freezed
class HtRequestDto with _$HtRequestDto {
  const factory HtRequestDto({
    required int id,
    required String htRequestId,
    required int employeeId,
    required String date,
    String? type,
    String? typeLabel,
    String? typeCode,
    String? typeEmoji,
    String? typeColor,
    String? status,
    String? syncedAt,
    String? empCode,
    String? fullName,
  }) = _HtRequestDto;

  factory HtRequestDto.fromJson(Map<String, dynamic> json) =>
      _$HtRequestDtoFromJson(json);
}
