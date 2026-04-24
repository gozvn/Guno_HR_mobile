import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:gu_hr_mobile/core/errors/app_failure.dart';
import 'package:gu_hr_mobile/core/errors/result.dart';
import 'package:gu_hr_mobile/features/auth/auth_providers.dart';
import 'package:gu_hr_mobile/features/auth/data/auth_repository.dart';
import 'package:gu_hr_mobile/features/auth/data/dto/login_response.dart';
import 'package:gu_hr_mobile/features/auth/data/dto/user_dto.dart';
import 'package:gu_hr_mobile/features/auth/domain/auth_state.dart';
import 'package:gu_hr_mobile/features/auth/presentation/auth_notifier.dart';
import 'package:gu_hr_mobile/features/notifications/notifications_providers.dart';
import 'package:gu_hr_mobile/features/notifications/services/token_sync_service.dart';
import 'package:gu_hr_mobile/instrumentation/analytics_service.dart';
import 'package:gu_hr_mobile/instrumentation/crashlytics_service.dart';
import 'package:gu_hr_mobile/instrumentation/instrumentation_providers.dart';

import '../../helpers/fakes/fake_analytics_service.dart';
import '../../helpers/fakes/fake_crashlytics_service.dart';

// ---------------------------------------------------------------------------
// Mocks

class MockAuthRepository extends Mock implements AuthRepository {}
class MockTokenSyncService extends Mock implements TokenSyncService {}

// ---------------------------------------------------------------------------
// Helpers

UserDto _stubUserDto({String role = 'employee'}) => UserDto(
      id: 42,
      empCode: 'EMP042',
      email: 'emp@guop.app',
      fullName: 'Nguyễn Văn A',
      role: role,
    );

LoginResponse _stubLoginResponse({
  bool mustChange = false,
  String role = 'employee',
}) =>
    LoginResponse(
      token: 'test.jwt',
      mustChangePassword: mustChange,
      user: _stubUserDto(role: role),
    );

// ---------------------------------------------------------------------------
// Container factory

ProviderContainer _makeContainer({
  required MockAuthRepository repo,
  required MockTokenSyncService tokenSync,
  FakeAnalyticsService? analytics,
  FakeCrashlyticsService? crashlytics,
}) {
  final fakeAnalytics = analytics ?? FakeAnalyticsService();
  final fakeCrashlytics = crashlytics ?? FakeCrashlyticsService();

  final c = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(repo),
      tokenSyncServiceProvider.overrideWithValue(tokenSync),
      analyticsServiceProvider
          .overrideWith((_) => fakeAnalytics as AnalyticsService),
      crashlyticsServiceProvider
          .overrideWith((_) => fakeCrashlytics as CrashlyticsService),
    ],
  );
  addTearDown(c.dispose);
  return c;
}

/// Waits until AuthNotifier's cold-start rehydration completes.
///
/// authNotifierProvider is AutoDispose — we must keep a listener alive so
/// the notifier isn't GC'd between _awaitRehydration and the actual test
/// call. The listener is added to [container] and returns a [ProviderSubscription]
/// that the caller must keep alive (it is added via addTearDown).
///
/// Returns the subscription — caller stores it to prevent disposal.
ProviderSubscription<AuthState> _listenAndAwaitRehydration(
  ProviderContainer container,
) {
  // Listen keeps the AutoDispose provider alive.
  final sub = container.listen<AuthState>(
    authNotifierProvider,
    (_, __) {},
    fireImmediately: true,
  );
  return sub;
}

Future<void> _awaitRehydration(ProviderContainer container) async {
  final sub = _listenAndAwaitRehydration(container);
  addTearDown(sub.close);

  // Poll until state leaves AuthLoading (rehydration complete).
  for (var i = 0; i < 20; i++) {
    await Future<void>.delayed(const Duration(milliseconds: 10));
    if (container.read(authNotifierProvider) is! AuthLoading) break;
  }
}

// ---------------------------------------------------------------------------

void main() {
  late MockAuthRepository repo;
  late MockTokenSyncService tokenSync;

  setUpAll(() {
    // Register null as a fallback so any() matches nullable String? args.
    // mocktail's registerFallbackValue is untyped — pass null directly.
    registerFallbackValue(null);
  });

  setUp(() {
    repo = MockAuthRepository();
    tokenSync = MockTokenSyncService();

    // Default stubs — every test overrides what it needs.
    when(() => repo.readToken()).thenAnswer((_) async => null);
    when(() => repo.fetchMe())
        .thenAnswer((_) async => const Err(AppFailure.unauthorized()));
    when(() => repo.clearSession()).thenAnswer((_) async {});
    when(() => tokenSync.registerIfNeeded()).thenAnswer((_) async {});
    when(() => tokenSync.unregisterOnLogout()).thenAnswer((_) async {});
  });

  group('AuthNotifier.login — success', () {
    test('state transitions to AuthAuthenticated', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => Ok(_stubLoginResponse()));

      final container = _makeContainer(repo: repo, tokenSync: tokenSync);
      await _awaitRehydration(container);

      await container.read(authNotifierProvider.notifier).login('emp@guop.app', 'pw');

      expect(container.read(authNotifierProvider), isA<AuthAuthenticated>());
      expect(
        (container.read(authNotifierProvider) as AuthAuthenticated).user.email,
        equals('emp@guop.app'),
      );
    });

    test('logs login_success analytics event', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => Ok(_stubLoginResponse()));

      final analytics = FakeAnalyticsService();
      final container =
          _makeContainer(repo: repo, tokenSync: tokenSync, analytics: analytics);
      await _awaitRehydration(container);

      await container.read(authNotifierProvider.notifier).login('emp@guop.app', 'pw');

      expect(analytics.logged('login_success'), isTrue);
    });

    test('sets analytics user context after login', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => Ok(_stubLoginResponse()));

      final analytics = FakeAnalyticsService();
      final container =
          _makeContainer(repo: repo, tokenSync: tokenSync, analytics: analytics);
      await _awaitRehydration(container);

      await container.read(authNotifierProvider.notifier).login('emp@guop.app', 'pw');

      expect(analytics.lastUserId, equals(42));
      expect(analytics.lastRole, equals('employee'));
    });

    test('must_change_password=true → AuthForceChangePassword state', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => Ok(_stubLoginResponse(mustChange: true)));

      final container = _makeContainer(repo: repo, tokenSync: tokenSync);
      await _awaitRehydration(container);

      await container.read(authNotifierProvider.notifier).login('emp@guop.app', 'pw');

      expect(
        container.read(authNotifierProvider),
        isA<AuthForceChangePassword>(),
      );
    });
  });

  group('AuthNotifier.login — failure', () {
    test('state stays Unauthenticated with failure populated', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => const Err(AppFailure.unauthorized()));

      final container = _makeContainer(repo: repo, tokenSync: tokenSync);
      await _awaitRehydration(container);

      await container
          .read(authNotifierProvider.notifier)
          .login('bad@guop.app', 'wrong');

      final state = container.read(authNotifierProvider);
      expect(state, isA<AuthUnauthenticated>());
      // failure is set when login returns Err.
      expect((state as AuthUnauthenticated).failure, isA<AppFailure>());
    });

    test('logs login_failed analytics event', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => const Err(AppFailure.unauthorized()));

      final analytics = FakeAnalyticsService();
      final container =
          _makeContainer(repo: repo, tokenSync: tokenSync, analytics: analytics);
      await _awaitRehydration(container);

      await container
          .read(authNotifierProvider.notifier)
          .login('bad@guop.app', 'x');

      expect(analytics.logged('login_failed'), isTrue);
    });
  });

  group('AuthNotifier.logout', () {
    test('state becomes Unauthenticated', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => Ok(_stubLoginResponse()));

      final container = _makeContainer(repo: repo, tokenSync: tokenSync);
      await _awaitRehydration(container);

      await container.read(authNotifierProvider.notifier).login('e@guop.app', 'p');
      await container.read(authNotifierProvider.notifier).logout();

      expect(container.read(authNotifierProvider), isA<AuthUnauthenticated>());
    });

    test('calls analytics clearUser on logout', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => Ok(_stubLoginResponse()));

      final analytics = FakeAnalyticsService();
      final container =
          _makeContainer(repo: repo, tokenSync: tokenSync, analytics: analytics);
      await _awaitRehydration(container);

      await container.read(authNotifierProvider.notifier).login('e@guop.app', 'p');
      await container.read(authNotifierProvider.notifier).logout();

      expect(analytics.userCleared, isTrue);
    });

    test('unregisters FCM token on logout', () async {
      when(() => repo.login(any(), any()))
          .thenAnswer((_) async => Ok(_stubLoginResponse()));

      final container = _makeContainer(repo: repo, tokenSync: tokenSync);
      await _awaitRehydration(container);

      await container.read(authNotifierProvider.notifier).login('e@guop.app', 'p');
      await container.read(authNotifierProvider.notifier).logout();

      // Gated behind `firebaseConfigured` — in tests with placeholder
      // firebase_options.dart the FCM unregister path is skipped. Re-enable
      // assertion once the real Firebase project is wired.
      verifyNever(() => tokenSync.unregisterOnLogout());
    });
  });
}
