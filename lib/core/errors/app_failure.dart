import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

// Typed failure domain — exhaustive set covering all HTTP + local error cases.

@freezed
sealed class AppFailure with _$AppFailure {
  const factory AppFailure.network(String message) = _Network;
  const factory AppFailure.unauthorized() = _Unauthorized;
  const factory AppFailure.forbidden(String? required) = _Forbidden;
  const factory AppFailure.server(int code, String? message) = _Server;
  const factory AppFailure.validation(String message) = _Validation;
  const factory AppFailure.unknown(Object error) = _Unknown;
}
