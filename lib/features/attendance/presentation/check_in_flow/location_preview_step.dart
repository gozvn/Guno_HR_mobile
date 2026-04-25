import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../attendance_providers.dart';
import '../../data/dto/location_dto.dart';
import '../../domain/location_check.dart';
import '../../services/location_check_resolver.dart';
import '../widgets/gps_distance_indicator.dart';
import 'office_location_map.dart';

/// Step 1 — fetches GPS position + nearest office, shows distance pill.
class LocationPreviewStep extends ConsumerStatefulWidget {
  const LocationPreviewStep({
    super.key,
    required this.onNext,
    required this.onWfh,
  });

  final VoidCallback onNext;

  /// Called when user explicitly opts for WFH flow.
  final VoidCallback onWfh;

  @override
  ConsumerState<LocationPreviewStep> createState() => _State();
}

class _State extends ConsumerState<LocationPreviewStep> {
  bool _loading = true;
  String? _error;
  Position? _position;
  LocationCheck _check = const LocationCheck.unknown();
  LocationDto? _nearestOffice;
  bool _lowAccuracy = false;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final geo = ref.read(geolocationServiceProvider);
      final pos = await geo.getCurrentPosition();

      if (pos == null) {
        if (!mounted) return;
        setState(() {
          _error = 'Không lấy được vị trí. Thử lại hoặc chấm công WFH.';
          _loading = false;
        });
        return;
      }

      _lowAccuracy = pos.accuracy > 100;
      _position = pos;

      final locations = await ref.read(locationsProvider.future);
      // resolveLocationCheck is a pure function extracted to location_check_resolver.dart
      final check = resolveLocationCheck(geo, pos, locations);

      // Pick the same office the resolver chose (by code) so the map and
      // the distance pill agree on which radius to draw.
      LocationDto? nearest;
      final code = switch (check) {
        LocationInRadius(:final locationCode) => locationCode,
        LocationOutsideRadius(:final locationCode) => locationCode,
        _ => null,
      };
      if (code != null) {
        for (final loc in locations) {
          if (loc.code == code) {
            nearest = loc;
            break;
          }
        }
      }

      if (!mounted) return;
      setState(() {
        _check = check;
        _nearestOffice = nearest;
        _loading = false;
      });

      ref.read(checkInFlowControllerProvider.notifier)
        ..setPosition(pos)
        ..setLocationCheck(check);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Lỗi vị trí: $e';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    if (_loading) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Đang xác định vị trí...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.gps_off, size: 56, color: Colors.red),
            const SizedBox(height: 16),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            FilledButton(onPressed: _fetch, child: const Text('Thử lại')),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: widget.onWfh,
              child: const Text('Chấm công WFH'),
            ),
          ],
        ),
      );
    }

    final isOutside = _check is LocationOutsideRadius;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_position != null)
            OfficeLocationMap(
              userLat: _position!.latitude,
              userLng: _position!.longitude,
              office: _nearestOffice,
            )
          else
            const Icon(Icons.location_on, size: 56),
          const SizedBox(height: 16),
          if (_lowAccuracy)
            Card(
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber, color: Colors.orange),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Độ chính xác thấp (${_position?.accuracy.toInt()}m). '
                        'Vẫn có thể chấm công.',
                        style: tt.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 12),
          GpsDistanceIndicator(check: _check),
          const SizedBox(height: 32),
          if (isOutside) ...[
            FilledButton(
              onPressed: widget.onWfh,
              child: const Text('Làm việc từ xa (WFH)'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: widget.onNext,
              child: const Text('Vẫn chấm công GPS'),
            ),
          ] else
            FilledButton(
              onPressed: widget.onNext,
              child: const Text('Tiếp theo'),
            ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: _fetch,
            child: const Text('Cập nhật vị trí'),
          ),
        ],
      ),
    );
  }
}
