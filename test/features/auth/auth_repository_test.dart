import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';

import 'package:gu_hr_mobile/core/errors/result.dart';
import 'package:gu_hr_mobile/core/storage/secure_storage.dart';
import 'package:gu_hr_mobile/features/auth/data/auth_api.dart';
import 'package:gu_hr_mobile/features/auth/data/auth_repository.dart';
import 'package:gu_hr_mobile/features/auth/data/dto/login_request.dart';
import 'package:gu_hr_mobile/features/auth/data/dto/login_response.dart';
import 'package:gu_hr_mobile/features/auth/data/dto/user_dto.dart';

// ---------------------------------------------------------------------------
// Mocks

class MockAuthApi extends Mock implements AuthApi {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

// Fake for mocktail fallback registration.
class _FakeLoginRequest extends Fake implements LoginRequest {}

// ---------------------------------------------------------------------------
// Helpers

UserDto _stubUser() => const UserDto(
      id: 1,
      empCode: 'EMP001',
      email: 'test@example.com',
      fullName: 'Test User',
      role: 'employee',
    );

LoginResponse _stubLoginResponse({bool mustChange = false}) => LoginResponse(
      token: 'test.jwt.token',
      mustChangePassword: mustChange,
      user: _stubUser(),
    );

// ---------------------------------------------------------------------------
// Tests

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeLoginRequest());
  });

  late MockAuthApi mockApi;
  late MockFlutterSecureStorage mockFss;
  late SecureStorage secureStorage;
  late AuthRepository repo;

  setUp(() {
    mockApi = MockAuthApi();
    mockFss = MockFlutterSecureStorage();
    secureStorage = SecureStorage(mockFss);
    repo = AuthRepository(mockApi, secureStorage);

    // Default: storage ops succeed silently.
    when(() => mockFss.write(key: any(named: 'key'), value: any(named: 'value')))
        .thenAnswer((_) async {});
    when(() => mockFss.delete(key: any(named: 'key')))
        .thenAnswer((_) async {});
    when(() => mockFss.read(key: any(named: 'key')))
        .thenAnswer((_) async => null);
  });

  group('AuthRepository.login', () {
    test('stores JWT in Keychain on success', () async {
      when(() => mockApi.login(any())).thenAnswer((_) async => _stubLoginResponse());

      final result = await repo.login('test@example.com', 'password');

      expect(result, isA<Ok<LoginResponse>>());
      verify(() => mockFss.write(key: 'jwt', value: 'test.jwt.token')).called(1);
    });

    test('stores user JSON cache on success', () async {
      when(() => mockApi.login(any())).thenAnswer((_) async => _stubLoginResponse());

      await repo.login('test@example.com', 'password');

      verify(() => mockFss.write(
            key: 'user_cached',
            value: any(named: 'value'),
          )).called(1);
    });

    test('returns Err and does not write to Keychain on API exception', () async {
      when(() => mockApi.login(any())).thenThrow(Exception('network error'));

      final result = await repo.login('test@example.com', 'password');

      expect(result, isA<Err<LoginResponse>>());
      verifyNever(() => mockFss.write(key: 'jwt', value: any(named: 'value')));
    });
  });

  group('AuthRepository.clearSession', () {
    test('deletes jwt and user_cached keys', () async {
      await repo.clearSession();

      verify(() => mockFss.delete(key: 'jwt')).called(1);
      verify(() => mockFss.delete(key: 'user_cached')).called(1);
    });
  });

  group('AuthRepository.readToken', () {
    test('returns stored token when present', () async {
      when(() => mockFss.read(key: 'jwt'))
          .thenAnswer((_) async => 'stored.token');

      final token = await repo.readToken();

      expect(token, equals('stored.token'));
    });

    test('returns null when no token stored', () async {
      when(() => mockFss.read(key: 'jwt')).thenAnswer((_) async => null);

      final token = await repo.readToken();

      expect(token, isNull);
    });
  });
}
