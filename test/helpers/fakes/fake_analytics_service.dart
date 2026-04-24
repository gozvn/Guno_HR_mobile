import 'package:gu_hr_mobile/instrumentation/analytics_service.dart';

/// Records analytics calls so widget/unit tests can verify events without
/// requiring Firebase to be initialised.
class FakeAnalyticsService extends AnalyticsService {
  final List<({String name, Map<String, Object>? params})> events = [];
  int? lastUserId;
  String? lastRole;
  bool userCleared = false;

  @override
  Future<void> log(String name, {Map<String, Object>? params}) async {
    events.add((name: name, params: params));
  }

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

  /// Convenience: names of all logged events.
  List<String> get eventNames => events.map((e) => e.name).toList();

  /// True if an event with [name] was logged.
  bool logged(String name) => eventNames.contains(name);
}
