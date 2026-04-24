/// All Riverpod providers for the manager feature.
/// Kept in one file (under 200 LOC) — split if it grows.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import '../auth/domain/auth_state.dart';
import '../auth/presentation/auth_notifier.dart';
import '../requests/data/dto/request_dto.dart';
import '../requests/requests_db_providers.dart';
import 'data/dto/live_shift_dto.dart';
import 'data/dto/live_team_dto.dart';
import 'data/dto/manager_dashboard_dto.dart';
import 'data/live_shifts_api.dart';
import 'data/live_team_api.dart';
import 'data/manager_dashboard_api.dart';

part 'manager_providers.g.dart';

// ---------------------------------------------------------------------------
// API providers

@riverpod
ManagerDashboardApi managerDashboardApi(Ref ref) =>
    ManagerDashboardApi(ref.watch(dioProvider));

@riverpod
LiveTeamApi liveTeamApi(Ref ref) => LiveTeamApi(ref.watch(dioProvider));

@riverpod
LiveShiftsApi liveShiftsApi(Ref ref) => LiveShiftsApi(ref.watch(dioProvider));

// ---------------------------------------------------------------------------
// Role gate — derived from sealed AuthState

@riverpod
bool isManager(Ref ref) {
  final state = ref.watch(authNotifierProvider);
  final user = switch (state) {
    AuthAuthenticated(:final user) => user,
    _ => null,
  };
  return user?.isManager ?? false;
}

// ---------------------------------------------------------------------------
// Manager dashboard — auto-dispose so 60s timer stops when page pops

@riverpod
Future<ManagerDashboardDto> managerDashboard(Ref ref) {
  // Poll every 60 seconds via a periodic stream; autoDispose cleans up timer.
  ref.listen(dashboardTimerProvider, (_, __) {
    ref.invalidateSelf();
  });
  return ref.watch(managerDashboardApiProvider).fetch();
}

// ---------------------------------------------------------------------------
// 60s periodic ticker — shared across dashboard + pending count

@riverpod
Stream<int> dashboardTimer(Ref ref) => Stream.periodic(
      const Duration(seconds: 60),
      (tick) => tick,
    );

// ---------------------------------------------------------------------------
// Pending approvals list — server filters by managed_department_id from JWT

@riverpod
Future<List<RequestDto>> pendingApprovals(Ref ref, String? typeFilter) =>
    ref.watch(requestsApiProvider).list(
          status: 'pending',
          type: typeFilter,
          limit: 50,
        ).then((r) => r.items);

// ---------------------------------------------------------------------------
// Pending count badge — polls every 60s

@riverpod
Stream<int> pendingCount(Ref ref) async* {
  // Emit immediately, then every 60 seconds.
  yield await ref.watch(requestsApiProvider).pendingCount();
  await for (final _ in Stream.periodic(const Duration(seconds: 60))) {
    try {
      yield await ref.watch(requestsApiProvider).pendingCount();
    } catch (_) {
      // Swallow transient errors — badge stays at last known value.
    }
  }
}

// ---------------------------------------------------------------------------
// Live team

@riverpod
Future<List<LiveTeamMemberDto>> liveTeamMembers(Ref ref) =>
    ref.watch(liveTeamApiProvider).listMembers();

@riverpod
Future<List<LiveChannelDto>> liveChannels(Ref ref) =>
    ref.watch(liveTeamApiProvider).listChannels();

// ---------------------------------------------------------------------------
// Live shifts — family keyed by {date, channel}

@riverpod
Future<List<LiveShiftDto>> liveShifts(
  Ref ref, {
  String? date,
  String? channel,
}) =>
    ref.watch(liveShiftsApiProvider).list(date: date, channel: channel);
