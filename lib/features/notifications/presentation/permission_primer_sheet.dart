import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifications_providers.dart';

/// Bottom sheet shown post-login when iOS notification permission has not yet
/// been determined. Improves acceptance rate by explaining value before
/// triggering the system prompt.
///
/// Usage:
/// ```dart
/// await PermissionPrimerSheet.showIfNeeded(context, ref);
/// ```
class PermissionPrimerSheet extends ConsumerWidget {
  const PermissionPrimerSheet({super.key});

  /// Shows the sheet only when permission status is [notDetermined].
  /// No-op if already granted or denied (user handles via settings).
  static Future<void> showIfNeeded(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final status =
        await ref.read(fcmServiceProvider).getCurrentStatus();
    if (status != AuthorizationStatus.notDetermined) return;
    if (!context.mounted) return;
    // The modal inherits the parent ProviderScope — no override needed.
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const PermissionPrimerSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: cs.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Icon(Icons.notifications_outlined, size: 48, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Bật thông báo',
              style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Nhận thông báo khi đơn của bạn được duyệt hoặc từ chối, '
              'nhắc nhở chấm công, và cập nhật số ngày phép.',
              style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            FilledButton(
              onPressed: () => _onAgree(context, ref),
              child: const Text('Đồng ý'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Để sau',
                style: TextStyle(color: cs.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onAgree(BuildContext context, WidgetRef ref) async {
    Navigator.of(context).pop();
    final settings =
        await ref.read(fcmServiceProvider).requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      await ref.read(tokenSyncServiceProvider).registerIfNeeded();
    }
  }
}
