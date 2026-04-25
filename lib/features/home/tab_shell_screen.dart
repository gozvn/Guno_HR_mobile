import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../manager/manager_providers.dart';
import 'widgets/more_sheet.dart';

// Tab shell — always renders 5 slots. Chấm công sits in the centre slot to
// emphasise the daily primary action; the surrounding slots are grouped by
// frequency. Slot 3 is role-dependent (Hồ sơ for employees, Báo cáo for
// managers). Slot 4 "Thêm" opens MoreSheet and never switches branches.
//
// Visible slot → branch:
//   0 Trang chủ  → 0
//   1 Đơn từ     → 2
//   2 Chấm công  → 1   (centred, visually emphasised)
//   3 Hồ sơ/BC   → 4 / 3 (role)
//   4 Thêm       → none (modal sheet)

const int _attendanceSlot = 2;
const int _moreSlot = 4;

class TabShellScreen extends ConsumerWidget {
  const TabShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isManager = ref.watch(isManagerProvider);
    final pendingCount = ref.watch(pendingCountProvider);
    final badgeCount = pendingCount.valueOrNull ?? 0;
    final cs = Theme.of(context).colorScheme;

    final destinations = <NavigationDestination>[
      const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      const NavigationDestination(
        icon: Icon(Icons.inbox_outlined),
        selectedIcon: Icon(Icons.inbox),
        label: 'Đơn từ',
      ),
      // Centre — Chấm công emphasised with a filled circular badge.
      NavigationDestination(
        icon: _CenterIcon(
          color: cs.primaryContainer,
          iconColor: cs.onPrimaryContainer,
        ),
        selectedIcon: _CenterIcon(
          color: cs.primary,
          iconColor: cs.onPrimary,
        ),
        label: 'Chấm công',
      ),
      // Slot 3 = Báo cáo for ALL roles. Page itself is role-aware: employees
      // see personal reports (own monthly attendance, own leave balance);
      // managers additionally see cross-employee reports + approvals banner.
      // Hồ sơ moved into the More sheet for both roles.
      NavigationDestination(
        icon: _maybeBadge(
          count: isManager ? badgeCount : 0,
          child: const Icon(Icons.bar_chart_outlined),
        ),
        selectedIcon: _maybeBadge(
          count: isManager ? badgeCount : 0,
          child: const Icon(Icons.bar_chart),
        ),
        label: 'Báo cáo',
      ),
      const NavigationDestination(
        icon: Icon(Icons.menu),
        label: 'Thêm',
      ),
    ];

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _toVisibleIndex(navigationShell.currentIndex, isManager),
        onDestinationSelected: (visibleIdx) {
          if (visibleIdx == _moreSlot) {
            MoreSheet.show(context);
            return;
          }
          final branchIdx = _toBranchIndex(visibleIdx, isManager);
          navigationShell.goBranch(
            branchIdx,
            initialLocation: branchIdx == navigationShell.currentIndex,
          );
        },
        destinations: destinations,
      ),
    );
  }
}

/// Visible slot → underlying branch index.
/// Slot 3 always maps to branch 3 (reports). Profile is reached via More.
int _toBranchIndex(int visibleIdx, bool _) {
  switch (visibleIdx) {
    case 0:
      return 0; // home
    case 1:
      return 2; // requests
    case _attendanceSlot:
      return 1; // attendance (centre)
    case 3:
      return 3; // reports
    default:
      return 0; // safety; slot 4 (More) is handled before reaching here
  }
}

/// Branch index → highlighted slot on the bottom bar.
/// Hidden branches (4 profile, 5-8 leave/docs/live-shifts/settings) keep slot
/// 4 (Thêm) highlighted since the user arrived through the More sheet.
int _toVisibleIndex(int branchIdx, bool _) {
  switch (branchIdx) {
    case 0:
      return 0;
    case 1:
      return _attendanceSlot;
    case 2:
      return 1;
    case 3:
      return 3;
    default:
      return _moreSlot; // hidden branches incl. profile (4) + 5..8
  }
}

class _CenterIcon extends StatelessWidget {
  const _CenterIcon({required this.color, required this.iconColor});
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(Icons.fingerprint, size: 26, color: iconColor),
    );
  }
}

Widget _maybeBadge({required int count, required Widget child}) {
  if (count <= 0) return child;
  return Badge.count(count: count > 99 ? 99 : count, child: child);
}
