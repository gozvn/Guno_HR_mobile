import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_type_dto.freezed.dart';
part 'request_type_dto.g.dart';

// Server may omit icon/color/name_en — keep nullable/default so UI always renders.
@freezed
class RequestTypeDto with _$RequestTypeDto {
  const factory RequestTypeDto({
    required String code,
    @Default('') String nameVi,
    @Default('') String nameEn,
    @Default('') String icon,
    @Default('') String color,
    @Default(0) int orderIdx,
  }) = _RequestTypeDto;

  factory RequestTypeDto.fromJson(Map<String, dynamic> json) =>
      _$RequestTypeDtoFromJson(json);
}
