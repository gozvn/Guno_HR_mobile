import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../attendance_providers.dart';
import 'calendar_grid_widget.dart';

/// Monthly attendance calendar page.
/// Navigation: push from AttendanceTabPage via Routes.attendanceMonthly.
class MonthlyCalendarPage extends ConsumerStatefulWidget {
  const MonthlyCalendarPage({super.key});

  @override
  ConsumerState<MonthlyCalendarPage> createState() =>
      _MonthlyCalendarPageState();
}

class _MonthlyCalendarPageState extends ConsumerState<MonthlyCalendarPage> {
  late int _year;
  late int _month;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _year = now.year;
    _month = now.month;
  }

  void _prevMonth() => setState(() {
        if (_month == 1) {
          _month = 12;
          _year--;
        } else {
          _month--;
        }
      });

  void _nextMonth() => setState(() {
        if (_month == 12) {
          _month = 1;
          _year++;
        } else {
          _month++;
        }
      });

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(monthlyAttendanceProvider(_year, _month));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bảng chấm công tháng'),
        actions: [
          IconButton(
              onPressed: _prevMonth,
              icon: const Icon(Icons.chevron_left)),
          Center(
            child: Text(
              '$_month/$_year',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton(
              onPressed: _nextMonth,
              icon: const Icon(Icons.chevron_right)),
          const SizedBox(width: 8),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              Text('Không tải được: $e', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref
                    .invalidate(monthlyAttendanceProvider(_year, _month)),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (data) => CalendarGridWidget(
          data: data,
          year: _year,
          month: _month,
        ),
      ),
    );
  }
}
