/// Request body for POST /api/hr/notifications/register-device.
///
/// Backend blocker: endpoint not present in API audit as of 2026-04-24.
/// [NotificationsApi.registerDevice] handles 404 gracefully until it ships.
class RegisterDeviceRequest {
  const RegisterDeviceRequest({
    required this.fcmToken,
    required this.platform,
    required this.deviceId,
    required this.appVersion,
  });

  final String fcmToken;

  /// Always 'ios' for this app.
  final String platform;

  /// iOS: identifierForVendor (IDFV). Resets on app reinstall.
  final String deviceId;

  /// Semver string from PackageInfo e.g. "1.0.0+1".
  final String appVersion;

  Map<String, dynamic> toJson() => {
        'fcm_token': fcmToken,
        'platform': platform,
        'device_id': deviceId,
        'app_version': appVersion,
      };
}
