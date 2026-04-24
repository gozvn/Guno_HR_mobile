import '../../auth/domain/auth_state.dart';

/// Pure helper — no Flutter/Riverpod dependency so it's easy to unit-test.
const _managerRoles = {'manager', 'hr_admin', 'super_admin'};

bool isManagerRole(String? role) =>
    role != null && _managerRoles.contains(role);

/// Extracts current user role from sealed AuthState.
String? roleFromAuthState(AuthState state) => switch (state) {
      AuthAuthenticated(:final user) => user.role,
      _ => null,
    };
