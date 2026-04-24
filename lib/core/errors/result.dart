import 'app_failure.dart';

// Lightweight Result<T> — no external dependency (no Dartz).
// Pattern-match with switch: case Ok(:final value) / case Err(:final failure).

sealed class Result<T> {
  const Result();
}

final class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;
}

final class Err<T> extends Result<T> {
  const Err(this.failure);
  final AppFailure failure;
}

extension ResultX<T> on Result<T> {
  bool get isOk => this is Ok<T>;
  bool get isErr => this is Err<T>;

  T? get valueOrNull => switch (this) {
        Ok(:final value) => value,
        Err() => null,
      };

  AppFailure? get failureOrNull => switch (this) {
        Ok() => null,
        Err(:final failure) => failure,
      };
}
