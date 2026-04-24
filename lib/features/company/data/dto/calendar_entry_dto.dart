import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_entry_dto.freezed.dart';
part 'calendar_entry_dto.g.dart';

// Maps GET /api/hr/company-calendar array item (audit line 2114–2125).
@freezed
class CalendarEntryDto with _$CalendarEntryDto {
  const factory CalendarEntryDto({
    required int id,
    required String date,
    // 'holiday' | 'working_saturday' | 'custom'
    required String type,
    required String name,
    String? description,
  }) = _CalendarEntryDto;

  factory CalendarEntryDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarEntryDtoFromJson(json);
}
