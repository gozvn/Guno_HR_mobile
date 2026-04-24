import 'package:gu_hr_mobile/instrumentation/crashlytics_service.dart';

/// No-op CrashlyticsService for tests — records calls without touching Firebase.
class FakeCrashlyticsService extends CrashlyticsService {
  int? lastUserId;
  String? lastRole;
  bool userCleared = false;
  final List<Object> recordedErrors = [];

  @override
  Future<void> init() async {}

  @override
  Future<void> setUser(int id, String role) async {
    lastUserId = id;
    lastRole = role;
    userCleared = false;
  }

  @override
  Future<void> clearUser() async {
    userCleared = true;
    lastUserId = null;
    lastRole = null;
  }

  @override
  Future<void> recordHandled(
    Object error,
    StackTrace stack, {
    Map<String, Object>? context,
  }) async {
    recordedErrors.add(error);
  }
}
