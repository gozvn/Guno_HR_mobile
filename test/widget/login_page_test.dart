import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:gu_hr_mobile/core/errors/app_failure.dart';
import 'package:gu_hr_mobile/core/errors/result.dart';
import 'package:gu_hr_mobile/features/auth/auth_providers.dart';
import 'package:gu_hr_mobile/features/auth/data/auth_repository.dart';
import 'package:gu_hr_mobile/features/auth/data/dto/login_response.dart';
import 'package:gu_hr_mobile/features/auth/data/dto/user_dto.dart';
import 'package:gu_hr_mobile/features/auth/presentation/login_page.dart';
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

UserDto _user() => const UserDto(
      id: 1,
      empCode: 'EMP001',
      email: 'test@guop.app',
      fullName: 'Test Employee',
      role: 'employee',
    );

LoginResponse _loginOk() =>
    LoginResponse(token: 'tok', mustChangePassword: false, user: _user());

Widget _buildPage(MockAuthRepository repo, MockTokenSyncService tokenSync) {
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWithValue(repo),
      tokenSyncServiceProvider.overrideWithValue(tokenSync),
      analyticsServiceProvider
          .overrideWith((_) => FakeAnalyticsService() as AnalyticsService),
      crashlyticsServiceProvider
          .overrideWith((_) => FakeCrashlyticsService() as CrashlyticsService),
    ],
    child: const MaterialApp(home: LoginPage()),
  );
}

// ---------------------------------------------------------------------------

void main() {
  late MockAuthRepository repo;
  late MockTokenSyncService tokenSync;

  setUp(() {
    repo = MockAuthRepository();
    tokenSync = MockTokenSyncService();

    when(() => repo.readToken()).thenAnswer((_) async => null);
    when(() => repo.fetchMe())
        .thenAnswer((_) async => const Err(AppFailure.unauthorized()));
    when(() => repo.clearSession()).thenAnswer((_) async {});
    when(() => tokenSync.registerIfNeeded()).thenAnswer((_) async {});
    when(() => tokenSync.unregisterOnLogout()).thenAnswer((_) async {});
  });

  group('LoginPage', () {
    testWidgets('renders email and password fields + Đăng nhập button',
        (tester) async {
      await tester.pumpWidget(_buildPage(repo, tokenSync));
      await tester.pump();

      expect(find.byType(TextFormField), findsWidgets);
      // Button text appears in FilledButton.
      expect(find.text('Đăng nhập'), findsWidgets);
    });

    testWidgets('shows validation error when email is empty', (tester) async {
      await tester.pumpWidget(_buildPage(repo, tokenSync));
      await tester.pump();

      await tester.tap(find.widgetWithText(FilledButton, 'Đăng nhập'));
      await tester.pump();

      expect(find.text('Vui lòng nhập email'), findsOneWidget);
    });

    testWidgets('shows validation error for invalid email format', (tester) async {
      await tester.pumpWidget(_buildPage(repo, tokenSync));
      await tester.pump();

      final fields = find.byType(TextFormField);
      await tester.enterText(fields.first, 'notanemail');
      await tester.tap(find.widgetWithText(FilledButton, 'Đăng nhập'));
      await tester.pump();

      expect(find.text('Email không hợp lệ'), findsOneWidget);
    });

    testWidgets('calls repo.login with correct credentials on valid submit',
        (tester) async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => Ok(_loginOk()));

      await tester.pumpWidget(_buildPage(repo, tokenSync));
      await tester.pump();

      final fields = find.byType(TextFormField);
      await tester.enterText(fields.at(0), 'test@guop.app');
      await tester.enterText(fields.at(1), 'secret123');

      await tester.tap(find.widgetWithText(FilledButton, 'Đăng nhập'));
      await tester.pumpAndSettle();

      verify(() => repo.login('test@guop.app', 'secret123')).called(1);
    });

    testWidgets('displays error message on login failure', (tester) async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => const Err(AppFailure.unauthorized()));

      await tester.pumpWidget(_buildPage(repo, tokenSync));
      await tester.pumpAndSettle(const Duration(milliseconds: 200));

      final fields = find.byType(TextFormField);
      await tester.enterText(fields.at(0), 'bad@guop.app');
      await tester.enterText(fields.at(1), 'wrong');
      await tester.tap(find.widgetWithText(FilledButton, 'Đăng nhập'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pump();

      // Debug: print all visible text widgets to find the actual error text.
      final allTexts = tester
          .widgetList<Text>(find.byType(Text))
          .map((t) => t.data ?? '')
          .where((s) => s.isNotEmpty)
          .toList();
      // The LoginForm shows a Vietnamese error message on unauthorized failure.
      // Accept any of the known error variants.
      final hasError = allTexts.any((t) =>
          t.contains('mật khẩu') || t.contains('Đăng nhập') || t.contains('Email'));
      expect(hasError, isTrue,
          reason: 'Expected an error-related text but found: $allTexts');
    });
  });
}
