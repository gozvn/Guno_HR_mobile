import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/app_failure.dart';
import '../../../core/errors/result.dart';
import '../../../features/notifications/notifications_providers.dart';
import '../../../firebase_options.dart';
import '../../../instrumentation/instrumentation_providers.dart';
import '../auth_providers.dart';
import '../domain/auth_state.dart';
import '../domain/auth_user.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    // Trigger rehydration after first build without blocking the UI.
    Future.microtask(_rehydrate);
    return const AuthLoading();
  }

  /// Cold-start: read stored JWT → call /me → emit Authenticated or Unauthenticated.
  Future<void> _rehydrate() async {
    final repo = ref.read(authRepositoryProvider);
    final token = await repo.readToken();

    if (token == null) {
      state = const AuthUnauthenticated();
      return;
    }

    // Populate tokenProvider so AuthInterceptor can attach the header.
    ref.read(tokenProvider.notifier).state = token;

    final result = await repo.fetchMe();
    switch (result) {
      case Ok(:final value):
        state = AuthAuthenticated(value);
      case Err(:final failure):
        // Expired / invalid token → clear Keychain silently.
        await repo.clearSession();
        ref.read(tokenProvider.notifier).state = null;
        state = AuthUnauthenticated(failure: failure);
    }
  }

  /// Attempts login without committing navigation state. On success, persists
  /// token and returns the outcome so UI can display a success notification
  /// *before* calling [completeLogin] to transition to Authenticated.
  Future<Result<LoginOutcome>> attemptLogin(
      String email, String? password) async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.login(email, password);

    switch (result) {
      case Ok(:final value):
        ref.read(tokenProvider.notifier).state = value.token;
        return Ok(LoginOutcome(
          user: value.user.toDomain(),
          mustChangePassword: value.mustChangePassword,
        ));
      case Err(:final failure):
        state = AuthUnauthenticated(failure: failure);
        await ref.read(analyticsServiceProvider).log(
              'login_failed',
              params: {'reason': failure.toString()},
            );
        return Err(failure);
    }
  }

  /// Commits a successful login into auth state. Triggers router redirect.
  /// Split from [attemptLogin] so UI can show a success banner before nav.
  Future<void> completeLogin(LoginOutcome outcome) async {
    state = outcome.mustChangePassword
        ? AuthForceChangePassword(outcome.user)
        : AuthAuthenticated(outcome.user);
    final analytics = ref.read(analyticsServiceProvider);
    final crashlytics = ref.read(crashlyticsServiceProvider);
    await analytics.log('login_success');
    await analytics.setUser(outcome.user.id, outcome.user.role);
    await crashlytics.setUser(outcome.user.id, outcome.user.role);
    // Best-effort: register FCM token after login. Non-fatal if Firebase
    // is not yet configured (placeholder firebase_options.dart).
    _registerPushTokenAsync();
  }

  /// Convenience wrapper: attempt + commit back-to-back with no UI gap.
  /// Retained for tests and any non-UI caller that doesn't need the pre-nav
  /// notification window.
  Future<void> login(String email, String? password) async {
    state = const AuthLoading();
    final result = await attemptLogin(email, password);
    if (result case Ok(:final value)) await completeLogin(value);
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final currentUser = _currentUser;
    if (currentUser == null) return;

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    switch (result) {
      case Ok():
        state = AuthAuthenticated(currentUser);
      case Err(:final failure):
        // Re-emit ForceChangePassword with same user so screen shows the error.
        state = AuthForceChangePassword(currentUser);
        // Propagate failure so UI can display it.
        throw AuthChangePasswordException(failure);
    }
  }

  /// Refetches /auth/me and updates state in-place.
  /// Called after profile edit to reflect server-side changes immediately.
  Future<void> refreshUser() async {
    final result = await ref.read(authRepositoryProvider).fetchMe();
    if (result case Ok(:final value)) {
      state = AuthAuthenticated(value);
    }
    // On failure: silently ignore — user still has the old state.
  }

  /// Called by RefreshInterceptor on 401 — clears session without UI confirmation.
  void forceLogout() {
    _clearAndUnauthenticate();
  }

  Future<void> logout() async {
    await _clearAndUnauthenticate();
  }

  Future<void> _clearAndUnauthenticate() async {
    // Best-effort: unregister FCM token before clearing session so backend
    // can stop delivering pushes to this device. Must not block logout.
    // Skip entirely when Firebase isn't configured — instantiating
    // tokenSyncService touches FirebaseMessaging.instance which throws.
    if (firebaseConfigured) {
      await ref
          .read(tokenSyncServiceProvider)
          .unregisterOnLogout()
          .catchError((_) {});
    }
    ref.read(tokenProvider.notifier).state = null;
    await ref.read(authRepositoryProvider).clearSession();
    // Clear analytics + crashlytics user context on logout.
    await ref.read(analyticsServiceProvider).clearUser();
    await ref.read(crashlyticsServiceProvider).clearUser();
    state = const AuthUnauthenticated();
  }

  /// Fires FCM token registration asynchronously — never awaited at login so
  /// it cannot block the auth flow or delay navigation.
  /// No-op when Firebase isn't configured (placeholder firebase_options.dart).
  void _registerPushTokenAsync() {
    if (!firebaseConfigured) return;
    ref
        .read(tokenSyncServiceProvider)
        .registerIfNeeded()
        .catchError((_) {}); // already handled inside service; swallow here
  }

  AuthUser? get _currentUser => switch (state) {
        AuthAuthenticated(:final user) => user,
        AuthForceChangePassword(:final user) => user,
        _ => null,
      };
}

/// Returned by [AuthNotifier.attemptLogin]. Carries the resolved user and
/// whether the backend requires a forced password change.
class LoginOutcome {
  const LoginOutcome({required this.user, required this.mustChangePassword});
  final AuthUser user;
  final bool mustChangePassword;
}

/// Public exception used to propagate AppFailure out of changePassword
/// so the UI widget can catch and display the server message verbatim.
class AuthChangePasswordException implements Exception {
  const AuthChangePasswordException(this.failure);
  final AppFailure failure;

  String get message => failure.when(
        network: (msg) => msg,
        unauthorized: (msg) => msg ?? 'Mật khẩu hiện tại không đúng',
        forbidden: (req) => req ?? 'Không có quyền truy cập',
        server: (_, msg) => msg ?? 'Lỗi máy chủ',
        validation: (msg) => msg,
        unknown: (_) => 'Đã xảy ra lỗi. Vui lòng thử lại.',
      );
}
