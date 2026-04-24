import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:gu_hr_mobile/core/errors/app_failure.dart';
import 'package:gu_hr_mobile/core/errors/result.dart';
import 'package:gu_hr_mobile/features/auth/auth_providers.dart';
import 'package:gu_hr_mobile/features/auth/data/auth_repository.dart';
import 'package:gu_hr_mobile/features/auth/presentation/change_password_page.dart';
import 'package:gu_hr_mobile/features/notifications/notifications_providers.dart';
import 'package:gu_hr_mobile/features/notifications/services/token_sync_service.dart';
import 'package:gu_hr_mobile/instrumentation/analytics_service.dart';
import 'package:gu_hr_mobile/instrumentation/crashlytics_service.dart';
import 'package:gu_hr_mobile/instrumentation/instrumentation_providers.dart';

import '../helpers/fakes/fake_analytics_service.dart';
import '../helpers/fakes/fake_crashlytics_service.dart';

// ---------------------------------------------------------------------------
// Mocks

class MockAuthRepository extends Mock implements AuthRepository {}
class MockTokenSyncService extends Mock implements TokenSyncService {}

// ---------------------------------------------------------------------------
// Helpers

Widget _buildPage({
  required bool isForced,
  required MockAuthRepository repo,
  required MockTokenSyncService tokenSync,
}) {
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWithValue(repo),
      tokenSyncServiceProvider.overrideWithValue(tokenSync),
      analyticsServiceProvider
          .overrideWith((_) => FakeAnalyticsService() as AnalyticsService),
      crashlyticsServiceProvider
          .overrideWith((_) => FakeCrashlyticsService() as CrashlyticsService),
    ],
    child: MaterialApp(home: ChangePasswordPage(isForced: isForced)),
  );
}

// ---------------------------------------------------------------------------

void main() {
  late MockAuthRepository repo;
  late MockTokenSyncService tokenSync;

  setUp(() {
    repo = MockAuthRepository();
    tokenSync = MockTokenSyncService();

    // Minimal stubs — these tests focus on UI, not auth state transitions.
    when(() => repo.readToken()).thenAnswer((_) async => null);
    when(() => repo.fetchMe())
        .thenAnswer((_) async => const Err(AppFailure.unauthorized()));
    when(() => repo.clearSession()).thenAnswer((_) async {});
    when(() => tokenSync.registerIfNeeded()).thenAnswer((_) async {});
    when(() => tokenSync.unregisterOnLogout()).thenAnswer((_) async {});
  });

  group('ChangePasswordPage — forced mode (isForced: true)', () {
    testWidgets('PopScope canPop is false', (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: true, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      final popScope = tester.widget<PopScope>(find.byType(PopScope));
      expect(popScope.canPop, isFalse);
    });

    testWidgets('AppBar does not show back arrow', (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: true, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.automaticallyImplyLeading, isFalse);
    });

    testWidgets('shows forced-change warning banner', (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: true, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      // The banner contains Vietnamese text about needing to change password.
      expect(find.textContaining('đổi mật khẩu'), findsOneWidget);
    });
  });

  group('ChangePasswordPage — non-forced mode (isForced: false)', () {
    testWidgets('PopScope canPop is true', (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: false, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      final popScope = tester.widget<PopScope>(find.byType(PopScope));
      expect(popScope.canPop, isTrue);
    });

    testWidgets('AppBar shows back arrow', (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: false, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.automaticallyImplyLeading, isTrue);
    });

    testWidgets('does not show forced-change warning banner', (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: false, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      // The warning container should not appear in non-forced mode.
      expect(find.textContaining('Bạn cần đổi mật khẩu'), findsNothing);
    });
  });

  group('ChangePasswordPage — form validation', () {
    testWidgets('shows mismatch error when confirm password differs',
        (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: false, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      final fields = find.byType(TextFormField);
      await tester.enterText(fields.at(0), 'oldPass123');
      await tester.enterText(fields.at(1), 'newPass123');
      await tester.enterText(fields.at(2), 'different456');

      await tester.tap(find.widgetWithText(FilledButton, 'Đổi mật khẩu'));
      await tester.pump();

      expect(find.text('Mật khẩu xác nhận không khớp'), findsOneWidget);
    });

    testWidgets('shows error when new password is too short', (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: false, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      final fields = find.byType(TextFormField);
      await tester.enterText(fields.at(0), 'old');
      await tester.enterText(fields.at(1), '12345'); // 5 chars < 6
      await tester.enterText(fields.at(2), '12345');

      await tester.tap(find.widgetWithText(FilledButton, 'Đổi mật khẩu'));
      await tester.pump();

      expect(find.text('Mật khẩu mới tối thiểu 6 ký tự'), findsOneWidget);
    });

    testWidgets('shows required error when current password is empty',
        (tester) async {
      await tester.pumpWidget(
          _buildPage(isForced: false, repo: repo, tokenSync: tokenSync));
      await tester.pump();

      await tester.tap(find.widgetWithText(FilledButton, 'Đổi mật khẩu'));
      await tester.pump();

      expect(find.text('Vui lòng nhập mật khẩu hiện tại'), findsOneWidget);
    });
  });
}
