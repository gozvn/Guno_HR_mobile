import 'package:flutter_test/flutter_test.dart';
import 'package:gu_hr_mobile/features/notifications/domain/notification_type.dart';

void main() {
  group('NotificationType.fromString', () {
    test('maps request_status_changed correctly', () {
      expect(
        NotificationType.fromString('request_status_changed'),
        NotificationType.requestStatusChanged,
      );
    });

    test('maps leave_balance_updated correctly', () {
      expect(
        NotificationType.fromString('leave_balance_updated'),
        NotificationType.leaveBalanceUpdated,
      );
    });

    test('maps new_pending_approval correctly', () {
      expect(
        NotificationType.fromString('new_pending_approval'),
        NotificationType.newPendingApproval,
      );
    });

    test('maps team_checkin_alert correctly', () {
      expect(
        NotificationType.fromString('team_checkin_alert'),
        NotificationType.teamCheckinAlert,
      );
    });

    test('maps checkin_reminder correctly', () {
      expect(
        NotificationType.fromString('checkin_reminder'),
        NotificationType.checkInReminder,
      );
    });

    test('returns unknown for unrecognised string', () {
      expect(
        NotificationType.fromString('totally_unknown_type'),
        NotificationType.unknown,
      );
    });

    test('returns unknown for null', () {
      expect(NotificationType.fromString(null), NotificationType.unknown);
    });

    test('returns unknown for empty string', () {
      expect(NotificationType.fromString(''), NotificationType.unknown);
    });
  });
}
