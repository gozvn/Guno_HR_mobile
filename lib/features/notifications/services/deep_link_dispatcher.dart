import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../../instrumentation/analytics_service.dart';
import '../data/dto/push_payload.dart';
import '../domain/deep_link_intent.dart';
import '../domain/notification_type.dart';

/// Maps a [PushPayload] to a [DeepLinkIntent] and navigates via GoRouter.
///
/// All dispatch logic is centralised here so foreground, background-tap, and
/// cold-start paths share the same routing table. Unknown notification types
/// fall back to home — no crash on malformed payloads.
class DeepLinkDispatcher {
  DeepLinkDispatcher(this._router, {AnalyticsService? analytics})
      : _analytics = analytics ?? AnalyticsService();

  final GoRouter _router;
  final AnalyticsService _analytics;

  void handle(PushPayload payload) {
    final intent = _mapToIntent(payload);
    debugPrint('[PUSH] dispatch → ${intent.path}');
    // Fire-and-forget analytics log — must not block navigation.
    _analytics.log('push_opened', params: {'type': payload.type.name});
    _router.go(intent.path);
  }

  DeepLinkIntent _mapToIntent(PushPayload p) => switch (p.type) {
        NotificationType.requestStatusChanged when p.requestId != null =>
          DeepLinkIntent.requestDetail(p.requestId!),
        NotificationType.requestStatusChanged =>
          // requestId missing — fall back to request list
          const DeepLinkIntent.home(),
        NotificationType.newPendingApproval =>
          DeepLinkIntent.approvals(p.requestId),
        NotificationType.leaveBalanceUpdated =>
          const DeepLinkIntent.leaveBalance(),
        NotificationType.checkInReminder =>
          const DeepLinkIntent.attendanceCheckin(),
        NotificationType.teamCheckinAlert =>
          const DeepLinkIntent.managerDashboard(),
        NotificationType.unknown => const DeepLinkIntent.home(),
      };
}
