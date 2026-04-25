import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../manager_providers.dart';

/// "Tổng kết" tab — per-employee monthly totals for the selected channel.
class MonthlySummaryTab extends ConsumerStatefulWidget {
  const MonthlySummaryTab({super.key, required this.channel});
  final String? channel;

  @override
  ConsumerState<MonthlySummaryTab> createState() =>
      _MonthlySummaryTabState();
}

class _MonthlySummaryTabState
    extends ConsumerState<MonthlySummaryTab> {
  late String _month;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _month = '${now.year}-${now.month.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(
      liveShiftsMonthlySummaryProvider(
        month: _month,
        channel: widget.channel,
      ),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => setState(() => _month = _shift(_month, -1)),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Tháng $_month',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () => setState(() => _month = _shift(_month, 1)),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: async.when(
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Lỗi: $e')),
            data: (rows) {
              if (rows.isEmpty) {
                return const Center(child: Text('Chưa có dữ liệu.'));
              }
              return RefreshIndicator(
                onRefresh: () async =>
                    ref.invalidate(liveShiftsMonthlySummaryProvider),
                child: ListView.separated(
                  itemCount: rows.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final r = rows[i];
                    final approved = r['approved_shifts'] ?? 0;
                    final total = r['total_shifts'] ?? 0;
                    final pending = r['pending_shifts'] ?? 0;
                    final mins = r['total_approved_minutes'] ?? 0;
                    final hours = (mins is num ? mins / 60 : 0).toStringAsFixed(1);
                    return ListTile(
                      title: Text(r['full_name']?.toString() ?? '—'),
                      subtitle: Text(
                        'Duyệt $approved/$total · Chờ $pending · ${hours}h',
                      ),
                      trailing: Text(r['emp_code']?.toString() ?? ''),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Shifts YYYY-MM by [delta] months.
  String _shift(String ym, int delta) {
    final p = ym.split('-');
    var y = int.parse(p[0]);
    var m = int.parse(p[1]) + delta;
    while (m > 12) {
      m -= 12;
      y += 1;
    }
    while (m < 1) {
      m += 12;
      y -= 1;
    }
    return '$y-${m.toString().padLeft(2, '0')}';
  }
}
