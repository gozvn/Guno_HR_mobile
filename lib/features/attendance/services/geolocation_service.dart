import 'dart:async';

import 'package:geolocator/geolocator.dart';

/// Sealed permission result — callers switch on this to decide UX.
enum GeoPermissionStatus { granted, denied, deniedForever }

/// Wraps geolocator with permission gating and a 10s timeout fallback.
class GeolocationService {
  /// Request location permission; returns current status.
  Future<GeoPermissionStatus> requestPermission() async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return switch (permission) {
      LocationPermission.always || LocationPermission.whileInUse =>
        GeoPermissionStatus.granted,
      LocationPermission.deniedForever => GeoPermissionStatus.deniedForever,
      _ => GeoPermissionStatus.denied,
    };
  }

  /// Open iOS/Android app settings so user can grant permission manually.
  Future<void> openSettings() => Geolocator.openAppSettings();

  /// Best-accuracy fix with 10s timeout.
  /// Falls back to last-known position on timeout (may be null).
  /// Caller should warn user about low accuracy if fallback used.
  Future<Position?> getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: const Duration(seconds: 10),
      );
    } on TimeoutException {
      // GPS fix took too long — last-known is better than nothing.
      return Geolocator.getLastKnownPosition();
    } catch (_) {
      return null;
    }
  }

  /// Haversine distance between two GPS coordinates in metres.
  double distanceBetween(
    double lat1,
    double lng1,
    double lat2,
    double lng2,
  ) =>
      Geolocator.distanceBetween(lat1, lng1, lat2, lng2);
}
