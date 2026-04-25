import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../manager_providers.dart';

/// "Lịch tuần" tab — Monday-starting week view. MVP groups shifts per day
/// with slot-name + actors. Full grid/hour layout deferred.
class WeeklyShiftsTab extends ConsumerStatefulWidget {
  const WeeklyShiftsTab({super.key, required this.channel});
  final String? channel;

  @override
  ConsumerState<WeeklyShiftsTab> createState() => _WeeklyShiftsTabState();
}

class _WeeklyShiftsTabState extends ConsumerState<WeeklyShiftsTab> {
  late DateTime _monday;

  @override
  void initState() {
    super.initState();
    _monday = _mondayOf(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final weekStart = _fmt(_monday);
    final async = ref.watch(
      liveShiftsWeeklyProvider(
        weekStart: weekStart,
        channel: widget.channel,
      ),
    );
    return Column(
      children: [
        _WeekSwitcher(
          monday: _monday,
          onPrev: () => setState(
              () => _monday = _monday.subtract(const Duration(days: 7))),
          onNext: () => setState(
              () => _monday = _monday.add(const Duration(days: 7))),
        ),
        const Divider(height: 1),
        Expanded(
          child: async.when(
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Lỗi: $e')),
            data: (data) => _WeekBody(data: data),
          ),
        ),
      ],
    );
  }

  static DateTime _mondayOf(DateTime d) =>
      DateTime(d.year, d.month, d.day).subtract(Duration(days: d.weekday - 1));

  static String _fmt(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

class _WeekSwitcher extends StatelessWidget {
  const _WeekSwitcher({
    required this.monday,
    required this.onPrev,
    required this.onNext,
  });

  final DateTime monday;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final end = monday.add(const Duration(days: 6));
    final label = 'Tuần ${_short(monday)} → ${_short(end)}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.chevron_left), onPressed: onPrev),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext),
        ],
      ),
    );
  }

  String _short(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}';
}

class _WeekBody extends StatelessWidget {
  const _WeekBody({required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final shifts = (data['shifts'] as List<dynamic>? ?? [])
        .cast<Map<String, dynamic>>();
    if (shifts.isEmpty) {
      return const Center(child: Text('Tuần này chưa có ca live'));
    }
    final byDate = <String, List<Map<String, dynamic>>>{};
    for (final s in shifts) {
      final d = s['date']?.toString() ?? '';
      byDate.putIfAbsent(d, () => []).add(s);
    }
    final days = byDate.keys.toList()..sort();
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: days.length,
      itemBuilder: (_, i) {
        final day = days[i];
        final rows = byDate[day]!;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 4),
              for (final s in rows)
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    '${s['slot_name'] ?? '—'} · ${s['full_name'] ?? ''}',
                  ),
                  subtitle: Text(
                    '${s['planned_start'] ?? ''}–${s['planned_end'] ?? ''} · '
                    '${s['channel'] ?? ''}',
                  ),
                  trailing: Text(s['status']?.toString() ?? ''),
                ),
            ],
          ),
        );
      },
    );
  }
}
