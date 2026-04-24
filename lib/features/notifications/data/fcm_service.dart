import 'package:firebase_messaging/firebase_messaging.dart';

/// Thin wrapper around [FirebaseMessaging] instance.
///
/// Isolates the rest of the codebase from the Firebase SDK surface area and
/// makes token/permission logic easy to mock in tests.
class FcmService {
  FcmService(this._messaging);

  final FirebaseMessaging _messaging;

  /// Requests iOS permission prompt. Must be called before [getToken].
  /// On Android this is a no-op (permission granted at install time).
  Future<NotificationSettings> requestPermission() =>
      _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

  /// Returns the FCM registration token.
  ///
  /// On iOS, [getAPNSToken] must be awaited first — if APNs token is not yet
  /// available [getToken] returns null. The caller ([TokenSyncService]) retries
  /// on the next token-refresh event.
  Future<String?> getToken() async {
    // iOS quirk: APNs token must be fetched before FCM token becomes available.
    await _messaging.getAPNSToken();
    return _messaging.getToken();
  }

  /// Stream that emits whenever FCM rotates the registration token.
  /// [TokenSyncService] listens to this and re-registers with backend.
  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  /// Returns the current iOS authorization status without prompting.
  Future<AuthorizationStatus> getCurrentStatus() async {
    final settings = await _messaging.getNotificationSettings();
    return settings.authorizationStatus;
  }
}
