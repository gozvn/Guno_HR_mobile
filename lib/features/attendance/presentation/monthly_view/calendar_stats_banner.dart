import 'package:flutter/material.dart';

import '../../data/dto/monthly_attendance_dto.dart';

/// Header banner above the monthly calendar grid. Prefers server-side
/// `summary` (avoids client recompute drift); falls back to scanning [rows]
/// if the field is missing in some legacy response.
class CalendarStatsBanner extends StatelessWidget {
  const CalendarStatsBanner({
    super.key,
    required this.rows,
    this.summary,
  });

  final List<MonthlyDayDto> rows;
  final MonthlySummaryDto? summary;

  @override
  Widget build(BuildContext context) {
    final s = summary ?? _summariseLocal(rows);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final hours = (s.totalWorkMinutes / 60).toStringAsFixed(1);

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: cs.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _Stat(
                label: 'Công',
                value: '${s.present}',
                color: cs.onPrimaryContainer,
              ),
              _Stat(
                label: 'Trễ',
                value: '${s.late}',
                color: Colors.orange.shade700,
              ),
              _Stat(
                label: 'Vắng',
                value: '${s.absent}',
                color: Colors.red.shade700,
              ),
              _Stat(
                label: 'Phép',
                value: '${s.leave}',
                color: Colors.blue.shade700,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Tổng ${hours}h · Trễ ${s.totalLateMinutes} phút',
            style: tt.bodySmall?.copyWith(color: cs.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: tt.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: color)),
          Text(label,
              style: tt.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer)),
        ],
      ),
    );
  }
}

MonthlySummaryDto _summariseLocal(List<MonthlyDayDto> rows) {
  var present = 0, late = 0, absent = 0, leave = 0;
  var workMin = 0, otMin = 0, lateMin = 0;
  for (final d in rows) {
    if (d.status == 'present' || d.status == 'late') present++;
    if (d.status == 'late' || d.lateMinutes > 0) late++;
    if (d.status == 'absent') absent++;
    if (d.status == 'leave') leave++;
    workMin += d.workMinutes;
    otMin += d.otMinutes;
    lateMin += d.lateMinutes;
  }
  return MonthlySummaryDto(
    totalDays: rows.length,
    present: present,
    late: late,
    absent: absent,
    leave: leave,
    totalWorkMinutes: workMin,
    totalOtMinutes: otMin,
    totalLateMinutes: lateMin,
  );
}
