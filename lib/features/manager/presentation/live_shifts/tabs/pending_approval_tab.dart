import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../manager_providers.dart';
import '../../widgets/empty_state.dart';
import '../shift_list_tile.dart';

/// "Chờ duyệt" tab — worked-status shifts awaiting approval.
/// Approve/reject UI is embedded in ShiftListTile and already gates on role.
class PendingApprovalTab extends ConsumerWidget {
  const PendingApprovalTab({super.key, required this.channel});
  final String? channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(
      liveShiftsProvider(status: 'worked', channel: channel),
    );
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (shifts) {
        if (shifts.isEmpty) {
          return const EmptyState(
            icon: Icons.pending_actions_outlined,
            message: 'Không có ca chờ duyệt',
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(liveShiftsProvider),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: shifts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, i) => ShiftListTile(shift: shifts[i]),
          ),
        );
      },
    );
  }
}
