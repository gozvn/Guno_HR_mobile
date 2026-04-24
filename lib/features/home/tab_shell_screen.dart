import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../manager/manager_providers.dart';

// Tab shell — 4 tabs for employees, 5 for managers.
// Uses ConsumerWidget so it can read isManagerProvider + pendingCountProvider.

class TabShellScreen extends ConsumerWidget {
  const TabShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isManager = ref.watch(isManagerProvider);
    final pendingCount = ref.watch(pendingCountProvider);
    final badgeCount = pendingCount.valueOrNull ?? 0;

    // Tab indices depend on whether manager tab is present.
    // Branch order in router: 0=home, 1=attendance, 2=requests, 3=manager(opt), 4=profile
    // When not manager: branches 0,1,2,4(profile at idx 3 in nav)
    // GoRouter StatefulShellRoute branch index is fixed — we always have 5 branches
    // in the router; the manager branch simply renders an empty redirect for non-managers.
    // We show/hide the destination but keep the branch active.

    final destinations = <NavigationDestination>[
      const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      const NavigationDestination(
        icon: Icon(Icons.fingerprint_outlined),
        selectedIcon: Icon(Icons.fingerprint),
        label: 'Chấm công',
      ),
      const NavigationDestination(
        icon: Icon(Icons.inbox_outlined),
        selectedIcon: Icon(Icons.inbox),
        label: 'Đơn từ',
      ),
      if (isManager)
        NavigationDestination(
          icon: badgeCount > 0
              ? Badge.count(
                  count: badgeCount > 99 ? 99 : badgeCount,
                  child: const Icon(Icons.manage_accounts_outlined),
                )
              : const Icon(Icons.manage_accounts_outlined),
          selectedIcon: badgeCount > 0
              ? Badge.count(
                  count: badgeCount > 99 ? 99 : badgeCount,
                  child: const Icon(Icons.manage_accounts),
                )
              : const Icon(Icons.manage_accounts),
          label: 'Quản lý',
        ),
      const NavigationDestination(
        icon: Icon(Icons.person_outlined),
        selectedIcon: Icon(Icons.person),
        label: 'Hồ sơ',
      ),
    ];

    // Map visible index → branch index (account for hidden manager branch).
    // Router branches: 0=home,1=attendance,2=requests,3=manager,4=profile.
    int toBranchIndex(int visibleIdx) {
      if (!isManager) {
        // no manager tab: 0→0,1→1,2→2,3→4(profile)
        return visibleIdx < 3 ? visibleIdx : visibleIdx + 1;
      }
      return visibleIdx; // 1:1 when manager tab present
    }

    int toVisibleIndex(int branchIdx) {
      if (!isManager) {
        return branchIdx < 3 ? branchIdx : branchIdx - 1;
      }
      return branchIdx;
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: toVisibleIndex(navigationShell.currentIndex),
        onDestinationSelected: (visibleIdx) {
          final branchIdx = toBranchIndex(visibleIdx);
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
