import '../../../core/errors/app_failure.dart';
import 'auth_user.dart';

// Sealed auth state — exhaustively matched in router redirect + UI.
sealed class AuthState {
  const AuthState();
}

/// Token check / me call in progress on cold start.
final class AuthLoading extends AuthState {
  const AuthLoading();
}

/// No valid session. [failure] carries server error message when set after
/// a failed login attempt; null on clean logout or first launch.
final class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({this.failure});
  final AppFailure? failure;
}

/// Valid session, user can access protected routes.
final class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.user);
  final AuthUser user;
}

/// Login succeeded but server requires a password change before proceeding.
/// Router blocks all navigation until password is changed.
final class AuthForceChangePassword extends AuthState {
  const AuthForceChangePassword(this.user);
  final AuthUser user;
}
