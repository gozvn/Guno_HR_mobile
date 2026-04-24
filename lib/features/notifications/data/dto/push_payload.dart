import '../../domain/notification_type.dart';

/// Parsed representation of FCM data payload.
///
/// FCM data values always arrive as strings — all numeric fields use
/// [int.tryParse] to handle missing / malformed values gracefully.
/// Unknown [type] values map to [NotificationType.unknown] → dispatcher
/// falls back to home route, no crash.
class PushPayload {
  const PushPayload({
    required this.type,
    this.requestId,
    this.sourceCode,
    this.focusId,
  });

  final NotificationType type;

  /// For request_status_changed / new_pending_approval notifications.
  final int? requestId;

  /// For leave_balance_updated — identifies which leave type changed.
  final String? sourceCode;

  /// For new_pending_approval — optional request to highlight in list.
  final int? focusId;

  factory PushPayload.fromData(Map<String, dynamic> data) => PushPayload(
        type: NotificationType.fromString(data['type'] as String?),
        requestId: int.tryParse(data['request_id']?.toString() ?? ''),
        sourceCode: data['source_code'] as String?,
        focusId: int.tryParse(data['focus_id']?.toString() ?? ''),
      );

  /// Safe conversion back to map — used by [PendingIntentStore].
  /// Uses the wire-format snake_case string so the round-trip
  /// through [fromData] → [toJson] → [fromData] is lossless.
  Map<String, dynamic> toJson() => {
        'type': _typeToWire(type),
        if (requestId != null) 'request_id': requestId.toString(),
        if (sourceCode != null) 'source_code': sourceCode,
        if (focusId != null) 'focus_id': focusId.toString(),
      };

  static String _typeToWire(NotificationType t) => switch (t) {
        NotificationType.requestStatusChanged => 'request_status_changed',
        NotificationType.leaveBalanceUpdated => 'leave_balance_updated',
        NotificationType.newPendingApproval => 'new_pending_approval',
        NotificationType.teamCheckinAlert => 'team_checkin_alert',
        NotificationType.checkInReminder => 'checkin_reminder',
        NotificationType.unknown => 'unknown',
      };
}
