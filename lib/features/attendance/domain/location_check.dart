import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_check.freezed.dart';

/// Result of client-side GPS-to-office distance check.
/// Server is authoritative — this is for pre-flight UX only.
@freezed
sealed class LocationCheck with _$LocationCheck {
  /// Within the office GPS radius.
  const factory LocationCheck.inRadius({
    required String locationCode,
    required String locationName,
    required double distanceM,
    required int radiusM,
  }) = LocationInRadius;

  /// Outside radius — show amber warning, offer WFH flow.
  const factory LocationCheck.outsideRadius({
    required String? locationCode,
    required String? locationName,
    required double distanceM,
    required int radiusM,
  }) = LocationOutsideRadius;

  /// No office locations cached or GPS unavailable.
  const factory LocationCheck.unknown() = LocationUnknown;
}
