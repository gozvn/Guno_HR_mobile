import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:gu_hr_mobile/features/manager/presentation/approval_action_sheet.dart';
import 'package:gu_hr_mobile/features/requests/data/requests_api.dart';
import 'package:gu_hr_mobile/features/requests/requests_db_providers.dart';

// ---------------------------------------------------------------------------
// Minimal mock

class MockRequestsApi extends Mock implements RequestsApi {}

// ---------------------------------------------------------------------------
// Helpers

Widget _wrap(Widget child, {RequestsApi? api}) {
  return ProviderScope(
    overrides: [
      if (api != null) requestsApiProvider.overrideWithValue(api),
    ],
    child: MaterialApp(
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  late MockRequestsApi mockApi;

  setUp(() {
    mockApi = MockRequestsApi();
    // No Dio fallback needed — mock API is never called in these UI-only tests.
  });

  group('ApprovalActionSheet', () {
    testWidgets('reject button disabled when comment is empty', (tester) async {
      await tester.pumpWidget(_wrap(
        ApprovalActionSheet(requestId: 1, onDone: (_) {}),
        api: mockApi,
      ));
      await tester.pump();

      // Comment field is empty → reject button should be disabled (onPressed==null).
      final rejectBtn = tester.widget<OutlinedButton>(
        find.widgetWithText(OutlinedButton, 'Từ chối'),
      );
      expect(rejectBtn.onPressed, isNull);
    });

    testWidgets('reject button enabled after typing comment', (tester) async {
      await tester.pumpWidget(_wrap(
        ApprovalActionSheet(requestId: 1, onDone: (_) {}),
        api: mockApi,
      ));
      await tester.pump();

      await tester.enterText(find.byType(TextField), 'Lý do từ chối');
      await tester.pump();

      final rejectBtn = tester.widget<OutlinedButton>(
        find.widgetWithText(OutlinedButton, 'Từ chối'),
      );
      expect(rejectBtn.onPressed, isNotNull);
    });

    testWidgets('approve button always enabled', (tester) async {
      await tester.pumpWidget(_wrap(
        ApprovalActionSheet(requestId: 1, onDone: (_) {}),
        api: mockApi,
      ));
      await tester.pump();

      final approveBtn = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Duyệt'),
      );
      expect(approveBtn.onPressed, isNotNull);
    });

    testWidgets('reject button disabled again when comment cleared', (tester) async {
      await tester.pumpWidget(_wrap(
        ApprovalActionSheet(requestId: 1, onDone: (_) {}),
        api: mockApi,
      ));
      await tester.pump();

      // Type then clear
      await tester.enterText(find.byType(TextField), 'something');
      await tester.pump();
      await tester.enterText(find.byType(TextField), '');
      await tester.pump();

      final rejectBtn = tester.widget<OutlinedButton>(
        find.widgetWithText(OutlinedButton, 'Từ chối'),
      );
      expect(rejectBtn.onPressed, isNull);
    });
  });
}
