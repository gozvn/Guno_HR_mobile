import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/storage/secure_storage.dart';
import '../data/dto/register_device_request.dart';
import '../data/fcm_service.dart';
import '../data/notifications_api.dart';

/// Manages FCM token lifecycle: initial registration + rotation on refresh.
///
/// Token is cached in [SecureStorage] under [_tokenKey]. Registration is
/// skipped when the cached token matches the current FCM token — avoids
/// redundant backend calls on every app launch.
///
/// Security: only the first 8 chars of the token are logged.
class TokenSyncService {
  TokenSyncService({
    required FcmService fcmService,
    required NotificationsApi api,
    required SecureStorage storage,
  })  : _fcm = fcmService,
        _api = api,
        _storage = storage;

  static const _tokenKey = 'fcm_token';

  final FcmService _fcm;
  final NotificationsApi _api;
  final SecureStorage _storage;

  /// Subscribes to FCM token rotation. Call once after [registerIfNeeded].
  /// The subscription keeps running for the app's lifetime — no cancel needed
  /// since this service is singleton-scoped via Riverpod.
  void listenTokenRefresh() {
    _fcm.onTokenRefresh.listen((newToken) async {
      debugPrint('[PUSH] token rotated — re-registering');
      await _doRegister(newToken);
    });
  }

  /// Registers this device if the FCM token has changed since last sync.
  /// Safe to call on every login — exits early on cache hit.
  Future<void> registerIfNeeded() async {
    try {
      final token = await _fcm.getToken();
      if (token == null) {
        debugPrint('[PUSH] FCM token unavailable (APNs not ready yet)');
        return;
      }

      final cached = await _storage.read(_tokenKey);
      if (cached == token) {
        debugPrint('[PUSH] token unchanged — skipping registration');
        return;
      }

      await _doRegister(token);
    } catch (e) {
      // Non-fatal — push setup failed but app stays functional.
      debugPrint('[PUSH] registerIfNeeded error: $e');
    }
  }

  /// Clears locally cached token and best-effort unregisters from backend.
  /// Must not throw — called from logout which cannot be blocked.
  Future<void> unregisterOnLogout() async {
    try {
      final cached = await _storage.read(_tokenKey);
      if (cached != null) {
        await _api.unregisterDevice(cached);
        await _storage.delete(_tokenKey);
      }
    } catch (e) {
      debugPrint('[PUSH] unregisterOnLogout error: $e');
    }
  }

  // ── Private ───────────────────────────────────────────────────────────────

  Future<void> _doRegister(String token) async {
    final deviceId = await _getDeviceId();
    final appVersion = await _getAppVersion();

    final req = RegisterDeviceRequest(
      fcmToken: token,
      platform: 'ios',
      deviceId: deviceId,
      appVersion: appVersion,
    );

    await _api.registerDevice(req);
    await _storage.write(_tokenKey, token);

    // Security: log only first 8 chars of token.
    final preview = token.length > 8 ? '${token.substring(0, 8)}…' : token;
    debugPrint('[PUSH] token registered: $preview');
  }

  Future<String> _getDeviceId() async {
    try {
      final info = await DeviceInfoPlugin().iosInfo;
      return info.identifierForVendor ?? 'unknown';
    } catch (_) {
      return 'unknown';
    }
  }

  Future<String> _getAppVersion() async {
    try {
      final pkg = await PackageInfo.fromPlatform();
      return '${pkg.version}+${pkg.buildNumber}';
    } catch (_) {
      return '0.0.0+0';
    }
  }
}
