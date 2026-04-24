import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:gu_hr_mobile/core/storage/secure_storage.dart';
import 'package:gu_hr_mobile/features/notifications/data/dto/register_device_request.dart';
import 'package:gu_hr_mobile/features/notifications/data/fcm_service.dart';
import 'package:gu_hr_mobile/features/notifications/data/notifications_api.dart';
import 'package:gu_hr_mobile/features/notifications/services/token_sync_service.dart';

// ── Mocks ────────────────────────────────────────────────────────────────────

class MockFcmService extends Mock implements FcmService {}

class MockNotificationsApi extends Mock implements NotificationsApi {}

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late MockFcmService fcm;
  late MockNotificationsApi api;
  late MockSecureStorage storage;
  late TokenSyncService svc;

  const token = 'fcm_token_abcdef1234';

  setUpAll(() {
    registerFallbackValue(
      const RegisterDeviceRequest(
        fcmToken: '',
        platform: 'ios',
        deviceId: '',
        appVersion: '',
      ),
    );
  });

  setUp(() {
    fcm = MockFcmService();
    api = MockNotificationsApi();
    storage = MockSecureStorage();
    svc = TokenSyncService(
      fcmService: fcm,
      api: api,
      storage: storage,
    );

    // Default: onTokenRefresh never emits (no rotation in most tests).
    when(() => fcm.onTokenRefresh).thenAnswer((_) => const Stream.empty());
  });

  group('TokenSyncService.registerIfNeeded', () {
    test('skips registration when cached token matches current token', () async {
      when(() => fcm.getToken()).thenAnswer((_) async => token);
      when(() => storage.read('fcm_token')).thenAnswer((_) async => token);

      await svc.registerIfNeeded();

      verifyNever(() => api.registerDevice(any()));
    });

    test('registers when no cached token exists', () async {
      when(() => fcm.getToken()).thenAnswer((_) async => token);
      when(() => storage.read('fcm_token')).thenAnswer((_) async => null);
      when(() => api.registerDevice(any())).thenAnswer((_) async {});
      when(() => storage.write('fcm_token', token)).thenAnswer((_) async {});

      await svc.registerIfNeeded();

      verify(() => api.registerDevice(any())).called(1);
      verify(() => storage.write('fcm_token', token)).called(1);
    });

    test('registers when cached token differs from current token', () async {
      const oldToken = 'old_token_xyz';
      when(() => fcm.getToken()).thenAnswer((_) async => token);
      when(() => storage.read('fcm_token')).thenAnswer((_) async => oldToken);
      when(() => api.registerDevice(any())).thenAnswer((_) async {});
      when(() => storage.write('fcm_token', token)).thenAnswer((_) async {});

      await svc.registerIfNeeded();

      verify(() => api.registerDevice(any())).called(1);
    });

    test('skips and does not throw when FCM token is null (APNs not ready)',
        () async {
      when(() => fcm.getToken()).thenAnswer((_) async => null);

      await expectLater(svc.registerIfNeeded(), completes);
      verifyNever(() => api.registerDevice(any()));
    });

    test('does not cache token when api throws (500 scenario)', () async {
      when(() => fcm.getToken()).thenAnswer((_) async => token);
      when(() => storage.read('fcm_token')).thenAnswer((_) async => null);
      when(() => api.registerDevice(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
        ),
      );

      // Should not rethrow — error is swallowed by outer catch.
      await expectLater(svc.registerIfNeeded(), completes);
      // Token must NOT be written on failure.
      verifyNever(() => storage.write(any(), any()));
    });
  });

  group('TokenSyncService.unregisterOnLogout', () {
    test('calls unregisterDevice with cached token and clears cache', () async {
      when(() => storage.read('fcm_token')).thenAnswer((_) async => token);
      when(() => api.unregisterDevice(token)).thenAnswer((_) async {});
      when(() => storage.delete('fcm_token')).thenAnswer((_) async {});

      await svc.unregisterOnLogout();

      verify(() => api.unregisterDevice(token)).called(1);
      verify(() => storage.delete('fcm_token')).called(1);
    });

    test('no-ops silently when no cached token', () async {
      when(() => storage.read('fcm_token')).thenAnswer((_) async => null);

      await expectLater(svc.unregisterOnLogout(), completes);
      verifyNever(() => api.unregisterDevice(any()));
    });

    test('completes without throw even if unregisterDevice fails', () async {
      when(() => storage.read('fcm_token')).thenAnswer((_) async => token);
      when(() => api.unregisterDevice(token))
          .thenThrow(Exception('network error'));

      // Logout must never fail because of push cleanup.
      await expectLater(svc.unregisterOnLogout(), completes);
    });
  });
}
