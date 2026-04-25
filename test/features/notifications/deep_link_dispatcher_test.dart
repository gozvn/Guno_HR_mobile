import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:gu_hr_mobile/features/notifications/data/dto/push_payload.dart';
import 'package:gu_hr_mobile/features/notifications/domain/notification_type.dart';
import 'package:gu_hr_mobile/features/notifications/services/deep_link_dispatcher.dart';

class MockGoRouter extends Mock implements GoRouter {}

void main() {
  late MockGoRouter router;
  late DeepLinkDispatcher dispatcher;

  setUp(() {
    router = MockGoRouter();
    dispatcher = DeepLinkDispatcher(router);
    // Accept any path argument.
    when(() => router.go(any())).thenReturn(null);
  });

  String capturedPath() {
    final captured = verify(() => router.go(captureAny())).captured;
    return captured.last as String;
  }

  group('DeepLinkDispatcher.handle', () {
    test('requestStatusChanged with requestId → /requests/:id', () {
      dispatcher.handle(PushPayload.fromData({
        'type': 'request_status_changed',
        'request_id': '42',
      }));
      expect(capturedPath(), '/requests/42');
    });

    test('requestStatusChanged without requestId → /home', () {
      dispatcher.handle(PushPayload.fromData({
        'type': 'request_status_changed',
      }));
      expect(capturedPath(), '/home');
    });

    test('newPendingApproval with focusId → /reports/approvals?focus=7', () {
      dispatcher.handle(PushPayload.fromData({
        'type': 'new_pending_approval',
        'request_id': '7',
      }));
      expect(capturedPath(), '/reports/approvals?focus=7');
    });

    test('newPendingApproval without focusId → /reports/approvals', () {
      dispatcher.handle(PushPayload.fromData({
        'type': 'new_pending_approval',
      }));
      expect(capturedPath(), '/reports/approvals');
    });

    test('leaveBalanceUpdated → /leave', () {
      dispatcher.handle(PushPayload.fromData({
        'type': 'leave_balance_updated',
      }));
      expect(capturedPath(), '/leave');
    });

    test('checkInReminder → /attendance/check-in', () {
      dispatcher.handle(PushPayload.fromData({
        'type': 'checkin_reminder',
      }));
      expect(capturedPath(), '/attendance/check-in');
    });

    test('teamCheckinAlert → /reports', () {
      dispatcher.handle(PushPayload.fromData({
        'type': 'team_checkin_alert',
      }));
      expect(capturedPath(), '/reports');
    });

    test('unknown type → /home (no crash)', () {
      dispatcher.handle(PushPayload.fromData({
        'type': 'totally_unknown',
      }));
      expect(capturedPath(), '/home');
    });

    test('empty payload → /home (no crash)', () {
      dispatcher.handle(PushPayload.fromData({}));
      expect(capturedPath(), '/home');
    });
  });

  group('DeepLinkIntent paths', () {
    test('NotificationType enum has 6 values including unknown', () {
      expect(NotificationType.values.length, 6);
      expect(NotificationType.values.contains(NotificationType.unknown), isTrue);
    });
  });
}
