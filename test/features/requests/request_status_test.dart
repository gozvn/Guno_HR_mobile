import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gu_hr_mobile/features/requests/domain/request_status.dart';

void main() {
  group('RequestStatus.fromString', () {
    test('maps known status strings', () {
      expect(RequestStatus.fromString('pending'), RequestStatus.pending);
      expect(RequestStatus.fromString('processing'), RequestStatus.processing);
      expect(RequestStatus.fromString('approved'), RequestStatus.approved);
      expect(RequestStatus.fromString('rejected'), RequestStatus.rejected);
      expect(RequestStatus.fromString('cancelled'), RequestStatus.cancelled);
    });

    test('unknown string falls back to pending', () {
      expect(RequestStatus.fromString('unknown_value'), RequestStatus.pending);
    });
  });

  group('RequestStatus.canCancel', () {
    test('pending and processing can be cancelled', () {
      expect(RequestStatus.pending.canCancel, isTrue);
      expect(RequestStatus.processing.canCancel, isTrue);
    });

    test('approved, rejected, cancelled cannot be cancelled', () {
      expect(RequestStatus.approved.canCancel, isFalse);
      expect(RequestStatus.rejected.canCancel, isFalse);
      expect(RequestStatus.cancelled.canCancel, isFalse);
    });
  });

  group('RequestStatus.labelVi', () {
    test('all statuses have non-empty Vietnamese labels', () {
      for (final s in RequestStatus.values) {
        expect(s.labelVi, isNotEmpty);
      }
    });
  });

  group('RequestStatus.color', () {
    testWidgets('each status returns a non-transparent color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (ctx) {
              for (final s in RequestStatus.values) {
                final c = s.color(ctx);
                expect(c.a, greaterThan(0),
                    reason: '${s.name} color should not be fully transparent');
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });
}
