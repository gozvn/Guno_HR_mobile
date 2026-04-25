import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../manager/manager_providers.dart';

// Modal bottom sheet listing overflow nav destinations. Role-aware:
// employees see core shortcuts, live-team members add "Ca Live", managers
// additionally see their own Hồ sơ here (since bottom slot 4 shows Reports).
class MoreSheet extends ConsumerWidget {
  const MoreSheet({super.key});

  /// Opens the sheet. Prefer this over calling showModalBottomSheet directly so
  /// all call sites share the same styling + routing behaviour.
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      builder: (_) => const MoreSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isManager = ref.watch(isManagerProvider);
    final isLiveMember = ref.watch(isLiveMemberProvider);
    final items = _buildItems(isManager: isManager, isLiveMember: isLiveMember);

    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              'Thêm',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ...items.map(
            (i) => ListTile(
              leading: Icon(i.icon),
              title: Text(i.label),
              onTap: () {
                // Pop sheet first so the current GoRouter stays rooted at the
                // caller, then navigate. Without popping first, go_router
                // sometimes loses the sheet's context on rebuild.
                final router = GoRouter.of(context);
                Navigator.of(context).pop();
                router.goNamed(i.routeName);
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  List<_MoreItem> _buildItems({
    required bool isManager,
    required bool isLiveMember,
  }) {
    const leave = _MoreItem(
        Icons.beach_access_outlined, 'Phép năm', Routes.leave);
    const live = _MoreItem(
        Icons.live_tv_outlined, 'Ca Live', Routes.liveShifts);
    const docs = _MoreItem(Icons.folder_outlined, 'Tài liệu', Routes.docs);
    const settings = _MoreItem(
        Icons.settings_outlined, 'Cài đặt', Routes.settings);
    const profile = _MoreItem(Icons.person_outlined, 'Hồ sơ', Routes.profile);

    // Hồ sơ now lives in the More sheet for both roles (slot 3 is Báo cáo).
    if (isManager) return [leave, live, docs, settings, profile];
    if (isLiveMember) return [leave, live, docs, settings, profile];
    return [leave, docs, settings, profile];
  }
}

class _MoreItem {
  const _MoreItem(this.icon, this.label, this.routeName);
  final IconData icon;
  final String label;
  final String routeName;
}
