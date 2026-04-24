import 'package:flutter_test/flutter_test.dart';
import 'package:gu_hr_mobile/features/notifications/data/dto/push_payload.dart';
import 'package:gu_hr_mobile/features/notifications/domain/notification_type.dart';

void main() {
  group('PushPayload.fromData', () {
    test('parses full request_status_changed payload', () {
      final payload = PushPayload.fromData({
        'type': 'request_status_changed',
        'request_id': '42',
        'source_code': null,
        'focus_id': null,
      });

      expect(payload.type, NotificationType.requestStatusChanged);
      expect(payload.requestId, 42);
      expect(payload.sourceCode, isNull);
      expect(payload.focusId, isNull);
    });

    test('parses leave_balance_updated with source_code', () {
      final payload = PushPayload.fromData({
        'type': 'leave_balance_updated',
        'source_code': 'AL',
      });

      expect(payload.type, NotificationType.leaveBalanceUpdated);
      expect(payload.sourceCode, 'AL');
      expect(payload.requestId, isNull);
    });

    test('parses new_pending_approval with focus_id', () {
      final payload = PushPayload.fromData({
        'type': 'new_pending_approval',
        'request_id': '99',
        'focus_id': '7',
      });

      expect(payload.type, NotificationType.newPendingApproval);
      expect(payload.requestId, 99);
      expect(payload.focusId, 7);
    });

    test('handles missing fields gracefully — all nullable fields null', () {
      final payload = PushPayload.fromData({'type': 'checkin_reminder'});

      expect(payload.type, NotificationType.checkInReminder);
      expect(payload.requestId, isNull);
      expect(payload.sourceCode, isNull);
      expect(payload.focusId, isNull);
    });

    test('handles completely empty data map — falls back to unknown', () {
      final payload = PushPayload.fromData({});

      expect(payload.type, NotificationType.unknown);
      expect(payload.requestId, isNull);
    });

    test('handles non-numeric request_id gracefully', () {
      final payload = PushPayload.fromData({
        'type': 'request_status_changed',
        'request_id': 'not-a-number',
      });

      expect(payload.requestId, isNull);
    });

    test('handles integer request_id sent as number (not string)', () {
      // Some server implementations may send numeric values.
      final payload = PushPayload.fromData({
        'type': 'request_status_changed',
        'request_id': 123,
      });

      expect(payload.requestId, 123);
    });

    test('toJson round-trip preserves non-null fields', () {
      final original = PushPayload.fromData({
        'type': 'request_status_changed',
        'request_id': '10',
      });
      final json = original.toJson();
      final restored = PushPayload.fromData(json);

      expect(restored.type, original.type);
      expect(restored.requestId, original.requestId);
    });
  });
}
