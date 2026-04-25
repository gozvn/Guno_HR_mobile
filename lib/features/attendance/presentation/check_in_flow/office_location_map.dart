import 'dart:math' as math;

import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter/material.dart';

import '../../data/dto/location_dto.dart';

double _log2(double x) => math.log(x) / math.ln2;

/// Compact native iOS map showing the user's GPS pin together with the
/// nearest office (centre + radius circle). Read-only — the wizard's "Cập
/// nhật vị trí" button drives the underlying refresh.
class OfficeLocationMap extends StatelessWidget {
  const OfficeLocationMap({
    super.key,
    required this.userLat,
    required this.userLng,
    this.office,
    this.height = 200,
  });

  final double userLat;
  final double userLng;
  final LocationDto? office;
  final double height;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('[DBG OfficeMap] user=($userLat,$userLng) '
        'office=${office?.name}@(${office?.gpsLat},${office?.gpsLng})');
    final user = LatLng(userLat, userLng);
    final hasOffice = office?.gpsLat != null && office?.gpsLng != null;
    final officeLatLng = hasOffice
        ? LatLng(office!.gpsLat!, office!.gpsLng!)
        : null;
    // Camera fits both pins when both are present. zoom is derived from the
    // larger lat/lng delta so the bounding box just covers both with a
    // small margin. When delta is huge (e.g. simulator stuck in Cupertino
    // while offices live in VN), fall back to centring on the user.
    final double zoom;
    final LatLng centre;
    if (officeLatLng == null) {
      centre = user;
      zoom = 16;
    } else {
      final dLat = (userLat - officeLatLng.latitude).abs();
      final dLng = (userLng - officeLatLng.longitude).abs();
      final maxDelta = dLat > dLng ? dLat : dLng;
      if (maxDelta > 50) {
        // Pins on opposite sides of the globe — usually a simulator quirk.
        centre = user;
        zoom = 16;
      } else {
        centre = LatLng(
          (userLat + officeLatLng.latitude) / 2,
          (userLng + officeLatLng.longitude) / 2,
        );
        // log2(360 / maxDelta) lands the bounding box close to the viewport
        // edge; subtract 1 for breathing room.
        const minZoom = 4.0;
        const maxZoom = 17.0;
        final raw = (360 / (maxDelta == 0 ? 0.001 : maxDelta));
        zoom = (_log2(raw) - 1).clamp(minZoom, maxZoom);
      }
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: height,
        child: AppleMap(
          initialCameraPosition: CameraPosition(
            target: centre,
            zoom: zoom,
          ),
          // Apple's blue dot guarantees user position visibility even if our
          // custom annotation icon fails to render on this iOS version.
          myLocationEnabled: true,
          compassEnabled: false,
          rotateGesturesEnabled: false,
          pitchGesturesEnabled: false,
          annotations: {
            Annotation(
              annotationId: AnnotationId('user'),
              position: user,
              infoWindow: const InfoWindow(title: 'Vị trí của bạn'),
              icon: BitmapDescriptor.markerAnnotationWithHue(
                BitmapDescriptor.hueRed,
              ),
            ),
            if (officeLatLng != null)
              Annotation(
                annotationId: AnnotationId('office'),
                position: officeLatLng,
                infoWindow: InfoWindow(
                  title: office?.name ?? 'Văn phòng',
                  snippet: '${office?.gpsRadiusM ?? 0}m radius',
                ),
                icon: BitmapDescriptor.defaultAnnotation,
              ),
          },
          circles: {
            if (officeLatLng != null)
              Circle(
                circleId: CircleId('office-radius'),
                center: officeLatLng,
                radius: (office?.gpsRadiusM ?? 100).toDouble(),
                fillColor: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.18),
                strokeColor: Theme.of(context).colorScheme.primary,
                strokeWidth: 2,
              ),
          },
        ),
      ),
    );
  }
}
