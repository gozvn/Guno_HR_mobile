import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Thin wrapper around FirebaseAnalytics.
///
/// - Debug mode: events are printed to console only (no upload).
/// - Release mode: events sent to Firebase Analytics.
/// - All calls are try/catch — placeholder firebase_options.dart must not crash app.
/// - No PII in event params: user_id is internal employee int, role is a string label.
class AnalyticsService {
  /// Log a named event with optional parameters.
  ///
  /// Event name must match Firebase naming rules: lowercase, underscores, ≤40 chars.
  /// Known events: login_success, login_failed, checkin_submitted, checkin_failed,
  ///   checkin_queued_offline, request_created, approval_done, push_opened.
  Future<void> log(String name, {Map<String, Object>? params}) async {
    if (kDebugMode) {
      debugPrint('[Analytics] $name ${params ?? {}}');
      return;
    }
    try {
      await FirebaseAnalytics.instance
          .logEvent(name: name, parameters: params);
    } catch (_) {}
  }

  /// Set user context after login. Uses internal employee id (not email/PII).
  Future<void> setUser(int id, String role) async {
    if (kDebugMode) return;
    try {
      await FirebaseAnalytics.instance.setUserId(id: id.toString());
      await FirebaseAnalytics.instance
          .setUserProperty(name: 'role', value: role);
    } catch (_) {}
  }

  /// Clear user context on logout.
  Future<void> clearUser() async {
    if (kDebugMode) return;
    try {
      await FirebaseAnalytics.instance.setUserId(id: null);
    } catch (_) {}
  }
}
