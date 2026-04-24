import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifications_providers.dart';
import 'permission_primer_sheet.dart';

/// Profile page list tile showing current notification permission status.
///
/// - Authorized → green dot + "Đã bật"
/// - Denied → grey dot + "Đã tắt" → tap opens iOS Settings
/// - NotDetermined → amber dot + "Chưa bật" → tap shows primer sheet
/// - Provisional → treated same as authorized
class NotificationsSettingsTile extends ConsumerStatefulWidget {
  const NotificationsSettingsTile({super.key});

  @override
  ConsumerState<NotificationsSettingsTile> createState() =>
      _NotificationsSettingsTileState();
}

class _NotificationsSettingsTileState
    extends ConsumerState<NotificationsSettingsTile> {
  AuthorizationStatus? _status;

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    try {
      final status =
          await ref.read(fcmServiceProvider).getCurrentStatus();
      if (mounted) setState(() => _status = status);
    } catch (_) {
      // Firebase not configured yet — treat as unknown.
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final (label, color) = _labelAndColor(cs);

    return ListTile(
      leading: const Icon(Icons.notifications_outlined),
      title: const Text('Thông báo'),
      subtitle: Text(label),
      trailing: _status == null
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(Icons.circle, size: 10, color: color),
      onTap: _onTap,
    );
  }

  Future<void> _onTap() async {
    switch (_status) {
      case AuthorizationStatus.denied:
        await AppSettings.openAppSettings(type: AppSettingsType.notification);
        // Reload status when user returns from Settings.
        await _loadStatus();
      case AuthorizationStatus.notDetermined:
        if (mounted) {
          await PermissionPrimerSheet.showIfNeeded(context, ref);
          await _loadStatus();
        }
      case AuthorizationStatus.authorized:
      case AuthorizationStatus.provisional:
        // Already enabled — tapping opens settings to let user disable.
        await AppSettings.openAppSettings(type: AppSettingsType.notification);
        await _loadStatus();
      case null:
        break;
    }
  }

  (String, Color) _labelAndColor(ColorScheme cs) => switch (_status) {
        AuthorizationStatus.authorized ||
        AuthorizationStatus.provisional =>
          ('Đã bật', Colors.green),
        AuthorizationStatus.denied => ('Đã tắt', cs.outline),
        AuthorizationStatus.notDetermined => ('Chưa bật', Colors.amber),
        null => ('Đang kiểm tra…', cs.outline),
      };
}
