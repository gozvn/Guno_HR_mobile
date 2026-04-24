import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_filters.freezed.dart';

@freezed
class RequestFilters with _$RequestFilters {
  const factory RequestFilters({
    String? status,
    String? type,
    String? month,
    @Default(0) int offset,
  }) = _RequestFilters;
}
