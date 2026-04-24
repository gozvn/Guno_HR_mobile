import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../attendance_providers.dart';
import '../../data/local/attendance_database.dart';

/// App-bar badge showing queued offline check-ins.
/// Tap → bottom sheet with list + [Thử lại] per row.
class PendingSyncChip extends ConsumerWidget {
  const PendingSyncChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countAsync = ref.watch(pendingCheckinCountProvider);
    final count = countAsync.valueOrNull ?? 0;
    if (count == 0) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => _showSheet(context, ref),
      child: Chip(
        avatar: const Icon(Icons.cloud_upload_outlined, size: 16),
        label: Text('$count chờ sync'),
        backgroundColor: Colors.orange.shade100,
        side: BorderSide(color: Colors.orange.shade400),
        padding: const EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }

  void _showSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      // No ProviderScope wrapping needed — modal routes inherit the
      // ambient ProviderScope from the root widget tree.
      builder: (_) => const _PendingListSheet(),
    );
  }
}

class _PendingListSheet extends ConsumerWidget {
  const _PendingListSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(pendingCheckinsListProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      expand: false,
      builder: (_, ctrl) => Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text('Đơn chờ đồng bộ',
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                TextButton(
                  onPressed: () =>
                      ref.read(offlineRetryWorkerProvider).runOnce(),
                  child: const Text('Thử lại tất cả'),
                ),
              ],
            ),
          ),
          Expanded(
            child: listAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (rows) => rows.isEmpty
                  ? const Center(child: Text('Không có đơn chờ'))
                  : ListView.builder(
                      controller: ctrl,
                      itemCount: rows.length,
                      itemBuilder: (_, i) =>
                          _PendingRow(row: rows[i], ref: ref),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PendingRow extends StatelessWidget {
  const _PendingRow({required this.row, required this.ref});

  final PendingCheckin row;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final label = switch (row.type) {
      'checkout' => 'Check-out',
      'wfh_checkin' => 'WFH Check-in',
      'wfh_checkout' => 'WFH Check-out',
      _ => 'Check-in',
    };
    final time = _fmtDateTime(row.occurredAt);

    return ListTile(
      leading: const Icon(Icons.cloud_off_outlined),
      title: Text(label),
      subtitle: Text('$time • Thử ${row.retryCount} lần'
          '${row.lastError != null ? '\n${row.lastError}' : ''}'),
      trailing: TextButton(
        onPressed: () => ref.read(offlineRetryWorkerProvider).runOnce(),
        child: const Text('Thử lại'),
      ),
    );
  }

  String _fmtDateTime(DateTime dt) {
    final local = dt.toLocal();
    return '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')} '
        '${local.day}/${local.month}';
  }
}
