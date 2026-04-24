import 'package:flutter_test/flutter_test.dart';
import 'package:gu_hr_mobile/features/manager/domain/manager_role.dart';
import 'package:gu_hr_mobile/features/auth/domain/auth_state.dart';
import 'package:gu_hr_mobile/features/auth/domain/auth_user.dart';

AuthUser _user(String role) => AuthUser(
      id: 1,
      empCode: 'EMP001',
      email: 'test@test.com',
      fullName: 'Test User',
      role: role,
    );

void main() {
  group('isManagerRole', () {
    test('manager role returns true', () {
      expect(isManagerRole('manager'), isTrue);
    });

    test('hr_admin role returns true', () {
      expect(isManagerRole('hr_admin'), isTrue);
    });

    test('super_admin role returns true', () {
      expect(isManagerRole('super_admin'), isTrue);
    });

    test('employee role returns false', () {
      expect(isManagerRole('employee'), isFalse);
    });

    test('live_crew role returns false', () {
      expect(isManagerRole('live_crew'), isFalse);
    });

    test('null returns false', () {
      expect(isManagerRole(null), isFalse);
    });

    test('empty string returns false', () {
      expect(isManagerRole(''), isFalse);
    });
  });

  group('roleFromAuthState', () {
    test('extracts role from AuthAuthenticated', () {
      final state = AuthAuthenticated(_user('manager'));
      expect(roleFromAuthState(state), 'manager');
    });

    test('returns null for AuthLoading', () {
      expect(roleFromAuthState(const AuthLoading()), isNull);
    });

    test('returns null for AuthUnauthenticated', () {
      expect(roleFromAuthState(const AuthUnauthenticated()), isNull);
    });
  });

  group('AuthUser.isManager', () {
    test('manager is true', () => expect(_user('manager').isManager, isTrue));
    test('hr_admin is true', () => expect(_user('hr_admin').isManager, isTrue));
    test('super_admin is true', () => expect(_user('super_admin').isManager, isTrue));
    test('employee is false', () => expect(_user('employee').isManager, isFalse));
    test('live_crew is false', () => expect(_user('live_crew').isManager, isFalse));
    test('accountant is false', () => expect(_user('accountant').isManager, isFalse));
  });
}
