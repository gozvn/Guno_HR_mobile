import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import '../auth/domain/auth_state.dart';
import '../auth/presentation/auth_notifier.dart';
import 'data/dashboard_api.dart';
import 'domain/dashboard_state.dart';

part 'dashboard_providers.g.dart';

@riverpod
DashboardApi dashboardApi(DashboardApiRef ref) =>
    DashboardApi(ref.watch(dioProvider));

@riverpod
Future<DashboardState> dashboard(DashboardRef ref) async {
  final api = ref.watch(dashboardApiProvider);
  final authState = ref.watch(authNotifierProvider);

  final employeeId = switch (authState) {
    AuthAuthenticated(:final user) => user.id,
    _ => throw StateError('dashboard requires authenticated user'),
  };

  // Typed parallel fetch — p95 target <1.5s on 4G.
  final (summary, requests, attendance) = await (
    api.todaySummary(),
    api.requestSummary(),
    api.myTodayAttendance(employeeId),
  ).wait;

  return DashboardState(
    todaySummary: summary,
    requestSummary: requests,
    todayAttendance: attendance,
  );
}

// Convenience record-wait extension for 3-tuple (Dart 3 records).
extension _Wait3<A, B, C> on (Future<A>, Future<B>, Future<C>) {
  Future<(A, B, C)> get wait async {
    final results = await Future.wait([$1, $2, $3]);
    return (results[0] as A, results[1] as B, results[2] as C);
  }
}
