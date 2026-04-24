/// Notification types sent from backend via FCM data payload.
/// See phase-07 for full payload contract.
enum NotificationType {
  requestStatusChanged,
  leaveBalanceUpdated,
  newPendingApproval,
  teamCheckinAlert,
  checkInReminder,
  unknown;

  /// Maps the raw `type` string from FCM data payload to enum value.
  /// Unknown or null values safely fall back to [unknown].
  static NotificationType fromString(String? raw) => switch (raw) {
        'request_status_changed' => NotificationType.requestStatusChanged,
        'leave_balance_updated' => NotificationType.leaveBalanceUpdated,
        'new_pending_approval' => NotificationType.newPendingApproval,
        'team_checkin_alert' => NotificationType.teamCheckinAlert,
        'checkin_reminder' => NotificationType.checkInReminder,
        _ => NotificationType.unknown,
      };
}
