import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import 'location_check.dart';

part 'check_in_flow_state.freezed.dart';

/// Accumulates state across the 4-step wizard.
/// Held by checkInFlowControllerProvider (Notifier).
@freezed
class CheckInFlowState with _$CheckInFlowState {
  const factory CheckInFlowState({
    /// Which wizard step is active (0=permission, 1=location, 2=selfie, 3=confirm).
    @Default(0) int step,

    /// 'checkin' | 'checkout' | 'wfh_checkin' | 'wfh_checkout'
    @Default('checkin') String type,

    /// GPS fix (null until step 1 completes).
    Position? position,

    /// Client-side location pre-check result.
    LocationCheck? locationCheck,

    /// Compressed JPEG file ready for encoding.
    File? photoFile,

    /// User-entered note (optional, step 3).
    @Default('') String note,

    /// True while submitting — disables confirm button.
    @Default(false) bool isSubmitting,

    /// Non-null when submission completed.
    String? errorMessage,
  }) = _CheckInFlowState;
}
