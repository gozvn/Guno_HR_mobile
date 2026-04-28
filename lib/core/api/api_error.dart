import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

// Structured error from BE envelope: { "success": false, "error": {...} }
@freezed
class ApiError with _$ApiError implements Exception {
  const factory ApiError({
    required String code,
    required String message,
    String? field,
    Map<String, dynamic>? details,
    String? requestId,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
