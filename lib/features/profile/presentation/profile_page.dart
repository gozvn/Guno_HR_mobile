import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/tokens.dart';
import '../../../features/auth/domain/auth_state.dart';
import '../../../features/auth/presentation/auth_notifier.dart';
import '../../../features/notifications/presentation/notifications_settings_tile.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info_widgets.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final user = switch (authState) {
      AuthAuthenticated(:final user) => user,
      _ => null,
    };

    if (user == null) return const SizedBox.shrink();

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hồ sơ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Chỉnh sửa',
            onPressed: () => context.push('/profile/edit'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: GuHrSpacing.gutter,
          vertical: GuHrSpacing.gutter,
        ),
        children: [
          ProfileHeader(user: user),
          const SizedBox(height: GuHrSpacing.gutter),
          ProfileSectionCard(
            title: 'Thông tin liên hệ',
            children: [
              ProfileInfoRow(
                icon: Icons.email_outlined,
                label: 'Email',
                value: user.email,
              ),
              ProfileInfoRow(
                icon: Icons.phone_outlined,
                label: 'Số điện thoại',
                value: user.phone ?? '—',
              ),
            ],
          ),
          const SizedBox(height: GuHrSpacing.stackLg),
          ProfileSectionCard(
            title: 'Thông tin công việc',
            children: [
              ProfileInfoRow(
                icon: Icons.badge_outlined,
                label: 'Mã nhân viên',
                value: user.empCode,
              ),
              if (user.position != null)
                ProfileInfoRow(
                  icon: Icons.work_outline,
                  label: 'Chức vụ',
                  value: user.position!,
                ),
              ProfileInfoRow(
                icon: Icons.description_outlined,
                label: 'Loại hợp đồng',
                value: _contractTypeLabel(user.contractType),
              ),
              if (user.startDate != null)
                ProfileInfoRow(
                  icon: Icons.calendar_today_outlined,
                  label: 'Ngày vào làm',
                  value: user.startDate!,
                ),
            ],
          ),
          const SizedBox(height: GuHrSpacing.stackLg),
          ProfileSectionCard(
            title: 'Thông tin cá nhân',
            children: [
              if (user.dateOfBirth != null)
                ProfileInfoRow(
                  icon: Icons.cake_outlined,
                  label: 'Ngày sinh',
                  value: user.dateOfBirth!,
                ),
              if (user.gender != null)
                ProfileInfoRow(
                  icon: Icons.person_outline,
                  label: 'Giới tính',
                  value: _genderLabel(user.gender!),
                ),
            ],
          ),
          const SizedBox(height: GuHrSpacing.stackLg),
          // Push notification settings tile (phase-07)
          const Card(
            margin: EdgeInsets.zero,
            child: NotificationsSettingsTile(),
          ),
          const SizedBox(height: GuHrSpacing.gutter),
          OutlinedButton.icon(
            onPressed: () => context.push('/change-password'),
            icon: const Icon(Icons.lock_outline),
            label: const Text('Đổi mật khẩu'),
          ),
          const SizedBox(height: GuHrSpacing.stackLg),
          FilledButton.icon(
            onPressed: () => _confirmLogout(context, ref),
            style: FilledButton.styleFrom(
              backgroundColor: cs.errorContainer,
              foregroundColor: cs.onErrorContainer,
            ),
            icon: const Icon(Icons.logout),
            label: const Text('Đăng xuất'),
          ),
          const SizedBox(height: GuHrSpacing.gutter),
        ],
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Đăng xuất'),
        content: const Text('Bạn có chắc muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Huỷ'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(authNotifierProvider.notifier).logout();
    }
  }

  String _contractTypeLabel(String? type) => switch (type) {
        'full_time' => 'Toàn thời gian',
        'part_time' => 'Bán thời gian',
        'intern' => 'Thực tập sinh',
        _ => type ?? '—',
      };

  String _genderLabel(String gender) => switch (gender) {
        'male' => 'Nam',
        'female' => 'Nữ',
        _ => gender,
      };
}
