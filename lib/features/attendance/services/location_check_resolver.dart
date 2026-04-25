import 'package:geolocator/geolocator.dart';

import '../data/dto/location_dto.dart';
import '../domain/location_check.dart';
import 'geolocation_service.dart';

/// Resolves client-side GPS-to-office proximity check from cached locations.
/// User only needs to be inside ANY single office radius — multi-site teams
/// can have several valid check-in points. We therefore prefer "matched"
/// over "nearest": if the user falls inside any office's radius, return that
/// match (closest one if multiple). Only when none match do we fall back to
/// the geographically nearest office as the "outside" reference for the WFH
/// prompt.
/// Server remains authoritative — this drives pre-flight UX only.
LocationCheck resolveLocationCheck(
  GeolocationService geo,
  Position pos,
  List<LocationDto> locations,
) {
  if (locations.isEmpty) return const LocationCheck.unknown();

  LocationDto? nearest;
  double nearestDist = double.infinity;
  LocationDto? bestMatch;
  double bestMatchDist = double.infinity;

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
    // "match" = inside this office's allowed radius, regardless of whether
    // another office is geographically closer.
    if (d <= loc.gpsRadiusM && d < bestMatchDist) {
      bestMatchDist = d;
      bestMatch = loc;
    }
  }

  if (bestMatch != null) {
    return LocationCheck.inRadius(
      locationCode: bestMatch.code,
      locationName: bestMatch.name,
      distanceM: bestMatchDist,
      radiusM: bestMatch.gpsRadiusM,
    );
  }
  if (nearest == null) return const LocationCheck.unknown();
  return LocationCheck.outsideRadius(
    locationCode: nearest.code,
    locationName: nearest.name,
    distanceM: nearestDist,
    radiusM: nearest.gpsRadiusM,
  );
}
