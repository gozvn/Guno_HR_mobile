import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/errors/app_failure.dart';
import '../data/dto/checkin_response_dto.dart';

part 'check_in_result.freezed.dart';

/// Sealed result returned by CheckInSubmitter.submit().
@freezed
sealed class CheckInResult with _$CheckInResult {
  /// Server accepted the submission (200 OK).
  const factory CheckInResult.success(CheckinResponseDto response) =
      CheckInSuccess;

  /// Network unavailable or 5xx — row saved to drift queue for later retry.
  const factory CheckInResult.queuedOffline(String pendingId) =
      CheckInQueuedOffline;

  /// Non-retryable 4xx (e.g. GPS invalid, WFH not approved) — surface to user.
  const factory CheckInResult.failed(AppFailure failure) = CheckInFailed;

  /// Server returned 400 "outside radius" — trigger WFH redirect flow.
  const factory CheckInResult.outsideRadius(String serverMessage) =
      CheckInOutsideRadius;
}
