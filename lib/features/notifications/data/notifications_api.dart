// Backend blocker: POST /api/hr/notifications/register-device is NOT present
// in the API audit as of 2026-04-24. Both register and unregister calls
// degrade gracefully on 404 so the app works while the backend is pending.
// See phase-07 § Security: token must be sent with authenticated Bearer JWT
// (Dio AuthInterceptor handles this automatically).

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'dto/register_device_request.dart';

class NotificationsApi {
  const NotificationsApi(this._dio);

  final Dio _dio;

  /// Registers an FCM token with the backend so it can target this device.
  ///
  /// 404 → endpoint not yet implemented; log and continue (best-effort).
  /// Other [DioException] → rethrow so [TokenSyncService] can retry.
  Future<void> registerDevice(RegisterDeviceRequest req) async {
    try {
      await _dio.post(
        '/api/hr/notifications/register-device',
        data: req.toJson(),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        debugPrint('[PUSH] register-device endpoint missing — backend TODO');
        return;
      }
      rethrow;
    }
  }

  /// Unregisters the FCM token on logout so backend stops sending to this
  /// device. Called best-effort — logout must never fail because of this.
  ///
  /// 404 → endpoint not yet implemented; silently swallowed.
  Future<void> unregisterDevice(String fcmToken) async {
    try {
      await _dio.delete(
        '/api/hr/notifications/register-device',
        data: {'fcm_token': fcmToken},
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return;
      // Swallow all errors — logout flow must not block on push cleanup.
      debugPrint('[PUSH] unregisterDevice failed: ${e.message}');
    }
  }
}
