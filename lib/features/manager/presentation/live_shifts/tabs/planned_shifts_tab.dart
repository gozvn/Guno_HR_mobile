import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../manager_providers.dart';
import '../../widgets/empty_state.dart';
import '../shift_list_tile.dart';

/// "Kế hoạch" tab — upcoming planned shifts for the selected channel.
/// Status filter = `planned`. Covers today → 30 days ahead.
class PlannedShiftsTab extends ConsumerWidget {
  const PlannedShiftsTab({super.key, required this.channel});
  final String? channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final todayStr = _fmt(now);
    final endStr = _fmt(now.add(const Duration(days: 30)));
    final async = ref.watch(
      liveShiftsProvider(
        status: 'planned',
        channel: channel,
        rangeFrom: todayStr,
        rangeTo: endStr,
      ),
    );
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      data: (shifts) {
        if (shifts.isEmpty) {
          return const EmptyState(
            icon: Icons.event_available,
            message: 'Chưa có kế hoạch ca live',
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

  String _fmt(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
