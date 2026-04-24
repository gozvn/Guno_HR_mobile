import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/dto/push_payload.dart';

/// Persists push notification data across process boundaries.
///
/// The top-level [_firebaseBackgroundHandler] in main.dart writes here when
/// the app receives a notification in killed state. The splash/cold-start flow
/// reads and clears the stored payload AFTER auth rehydration completes.
class PendingIntentStore {
  static const _key = 'pending_push_data';

  /// Reads and clears the pending payload atomically.
  /// Returns null if nothing is stored or if the stored JSON is malformed.
  Future<PushPayload?> consume() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return null;
    await prefs.remove(_key);
    try {
      final data = jsonDecode(raw) as Map<String, dynamic>;
      return PushPayload.fromData(data);
    } catch (_) {
      // Malformed JSON — discard silently.
      return null;
    }
  }

  /// Stores a raw FCM data map for later consumption.
  Future<void> store(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(data));
  }
}
