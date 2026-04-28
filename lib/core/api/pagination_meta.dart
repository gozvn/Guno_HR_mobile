import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta.freezed.dart';
part 'pagination_meta.g.dart';

// Pagination info extracted from BE envelope meta.pagination field.
@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int total,
    required int limit,
    required int offset,
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}
