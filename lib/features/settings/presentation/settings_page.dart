import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../app/router.dart';
import '../../auth/presentation/auth_notifier.dart';
import '../../notifications/presentation/notifications_settings_tile.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Cài đặt')),
      body: ListView(
        children: [
          const _SectionHeader(label: 'Tài khoản'),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Đổi mật khẩu'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.goNamed(Routes.changePassword),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: cs.error),
            title: Text('Đăng xuất', style: TextStyle(color: cs.error)),
            onTap: () => _confirmLogout(context, ref),
          ),
          const Divider(height: 32),
          const _SectionHeader(label: 'Thông báo'),
          const NotificationsSettingsTile(),
          const Divider(height: 32),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (_, snap) {
                final version = snap.data?.version ?? '—';
                final build = snap.data?.buildNumber ?? '';
                final label =
                    build.isEmpty ? 'Phiên bản $version' : 'Phiên bản $version ($build)';
                return Text(
                  label,
                  textAlign: TextAlign.center,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Đăng xuất'),
        content: const Text('Bạn có chắc muốn đăng xuất khỏi thiết bị này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Huỷ'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    // Router listenable picks up the AuthUnauthenticated transition and
    // redirects to /login automatically.
    await ref.read(authNotifierProvider.notifier).logout();
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        label,
        style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant),
      ),
    );
  }
}
