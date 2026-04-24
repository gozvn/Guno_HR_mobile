import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../attendance_providers.dart';
import '../../services/geolocation_service.dart';

/// Step 0 — requests location + camera permissions before advancing.
class PermissionGateStep extends ConsumerStatefulWidget {
  const PermissionGateStep({super.key, required this.onGranted});

  final VoidCallback onGranted;

  @override
  ConsumerState<PermissionGateStep> createState() => _State();
}

class _State extends ConsumerState<PermissionGateStep> {
  GeoPermissionStatus? _status;
  bool _checking = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    setState(() => _checking = true);
    final svc = ref.read(geolocationServiceProvider);
    final status = await svc.requestPermission();
    if (!mounted) return;
    setState(() {
      _status = status;
      _checking = false;
    });
    if (status == GeoPermissionStatus.granted) widget.onGranted();
  }

  @override
  Widget build(BuildContext context) {
    if (_checking) {
      return const Center(child: CircularProgressIndicator());
    }

    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on, size: 72,
              color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 24),
          Text('Quyền truy cập vị trí', style: tt.headlineSmall,
              textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(
            _status == GeoPermissionStatus.deniedForever
                ? 'Quyền đã bị từ chối vĩnh viễn. Vui lòng mở cài đặt để cấp quyền.'
                : 'Ứng dụng cần quyền truy cập vị trí để xác minh chấm công.',
            style: tt.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          if (_status == GeoPermissionStatus.deniedForever)
            FilledButton.icon(
              onPressed: () =>
                  ref.read(geolocationServiceProvider).openSettings(),
              icon: const Icon(Icons.settings),
              label: const Text('Mở cài đặt'),
            )
          else
            FilledButton.icon(
              onPressed: _checkPermission,
              icon: const Icon(Icons.refresh),
              label: const Text('Cấp quyền'),
            ),
        ],
      ),
    );
  }
}
