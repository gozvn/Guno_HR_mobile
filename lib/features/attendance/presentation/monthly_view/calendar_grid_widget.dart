import 'package:flutter/material.dart';

import '../../data/dto/monthly_attendance_dto.dart';
import 'day_detail_sheet.dart';

/// Internal calendar grid + legend used by MonthlyCalendarPage.
/// Extracted to keep page file under 200 LOC.
class CalendarGridWidget extends StatelessWidget {
  const CalendarGridWidget({
    super.key,
    required this.data,
    required this.year,
    required this.month,
  });

  final MonthlyAttendanceDto data;
  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    final dayMap = {for (final d in data.days) d.date: d};
    final firstDay = DateTime(year, month, 1);
    final startOffset = (firstDay.weekday - 1) % 7;
    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final totalCells = startOffset + daysInMonth;
    final rows = (totalCells / 7).ceil();
    const headers = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: headers
                .map(
                  (h) => Expanded(
                    child: Center(
                      child: Text(
                        h,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: rows * 7,
            itemBuilder: (context, index) {
              final dayNum = index - startOffset + 1;
              if (dayNum < 1 || dayNum > daysInMonth) {
                return const SizedBox.shrink();
              }
              final dateStr = '$year-${month.toString().padLeft(2, '0')}-'
                  '${dayNum.toString().padLeft(2, '0')}';
              final record = dayMap[dateStr];
              return _DayCell(
                day: dayNum,
                record: record,
                onTap: record != null
                    ? () => DayDetailSheet.show(context, record)
                    : null,
              );
            },
          ),
        ),
        const _Legend(),
      ],
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({required this.day, this.record, this.onTap});

  final int day;
  final MonthlyDayDto? record;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = attendanceStatusColor(record?.status);
    final isToday = DateTime.now().day == day;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isToday
                ? Theme.of(context).colorScheme.primary
                : color.withValues(alpha: 0.3),
            width: isToday ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$day',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight:
                        isToday ? FontWeight.bold : FontWeight.normal,
                  ),
            ),
            if (record != null)
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color),
              ),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend();

  @override
  Widget build(BuildContext context) {
    const items = [
      ('Có mặt', Colors.green),
      ('Đi trễ', Colors.orange),
      ('Vắng', Colors.red),
      ('Nghỉ phép', Colors.blue),
      ('WFH', Colors.teal),
      ('Lễ', Colors.purple),
    ];
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        spacing: 12,
        runSpacing: 4,
        children: items
            .map(
              (item) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: item.$2),
                  ),
                  const SizedBox(width: 4),
                  Text(item.$1,
                      style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

/// Shared status → color mapping (used by grid + day detail sheet).
Color attendanceStatusColor(String? status) => switch (status) {
      'present' => Colors.green,
      'late' => Colors.orange,
      'absent' => Colors.red,
      'leave' => Colors.blue,
      'holiday' => Colors.purple,
      'wfh' => Colors.teal,
      'business_trip' => Colors.indigo,
      'early_leave' => Colors.deepOrange,
      'off' => Colors.grey,
      _ => Colors.grey,
    };
