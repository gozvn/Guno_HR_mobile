import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Wraps FirebaseCrashlytics with PII-safe helpers.
///
/// All methods are no-ops in kDebugMode so local development is not polluted.
/// Every Firebase call is wrapped in try/catch — placeholder firebase_options.dart
/// causes init to fail silently; the app must never crash because of Crashlytics.
///
/// PII redaction: the following keys are NEVER forwarded to Crashlytics:
///   jwt, password, fcm_token, gps_lat, gps_lng, attachment_url
class CrashlyticsService {
  static const _piiKeys = {
    'jwt',
    'password',
    'fcm_token',
    'gps_lat',
    'gps_lng',
    'attachment_url',
  };

  /// Wire global Flutter + platform error handlers.
  /// Must be called after Firebase.initializeApp().
  Future<void> init() async {
    if (kDebugMode) return;
    try {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      // Non-Flutter errors (platform channels, isolate errors).
      PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    } catch (e) {
      debugPrint('[Crashlytics] init skipped: $e');
    }
  }

  /// Called after successful login.
  Future<void> setUser(int id, String role) async {
    if (kDebugMode) return;
    try {
      await FirebaseCrashlytics.instance.setUserIdentifier(id.toString());
      await FirebaseCrashlytics.instance.setCustomKey('role', role);
    } catch (_) {}
  }

  /// Called on logout — clears user context.
  Future<void> clearUser() async {
    if (kDebugMode) return;
    try {
      await FirebaseCrashlytics.instance.setUserIdentifier('');
    } catch (_) {}
  }

  /// Record a handled exception (not a crash).
  /// [context] entries with PII keys are silently dropped before upload.
  Future<void> recordHandled(
    Object error,
    StackTrace stack, {
    Map<String, Object>? context,
  }) async {
    if (kDebugMode) {
      debugPrint('[Crashlytics] handled error: $error');
      return;
    }
    try {
      if (context != null) {
        for (final entry in context.entries) {
          if (_piiKeys.contains(entry.key)) continue;
          await FirebaseCrashlytics.instance
              .setCustomKey(entry.key, entry.value);
        }
      }
      await FirebaseCrashlytics.instance
          .recordError(error, stack, fatal: false);
    } catch (_) {}
  }
}
