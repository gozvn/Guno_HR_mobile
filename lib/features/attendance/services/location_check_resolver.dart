import 'package:geolocator/geolocator.dart';

import '../data/dto/location_dto.dart';
import '../domain/location_check.dart';
import 'geolocation_service.dart';

/// Resolves client-side GPS-to-office proximity check from cached locations.
/// Server is authoritative — this is for pre-flight UX indication only.
LocationCheck resolveLocationCheck(
  GeolocationService geo,
  Position pos,
  List<LocationDto> locations,
) {
  if (locations.isEmpty) return const LocationCheck.unknown();

  // Find nearest active location with valid GPS coordinates.
  LocationDto? nearest;
  double nearestDist = double.infinity;
  for (final loc in locations) {
    if (loc.gpsLat == null || loc.gpsLng == null) continue;
    final d = geo.distanceBetween(
      pos.latitude,
      pos.longitude,
      loc.gpsLat!,
      loc.gpsLng!,
    );
    if (d < nearestDist) {
      nearestDist = d;
      nearest = loc;
    }
  }

  if (nearest == null) return const LocationCheck.unknown();

  if (nearestDist <= nearest.gpsRadiusM) {
    return LocationCheck.inRadius(
      locationCode: nearest.code,
      locationName: nearest.name,
      distanceM: nearestDist,
      radiusM: nearest.gpsRadiusM,
    );
  }
  return LocationCheck.outsideRadius(
    locationCode: nearest.code,
    locationName: nearest.name,
    distanceM: nearestDist,
    radiusM: nearest.gpsRadiusM,
  );
}
