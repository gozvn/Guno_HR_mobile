import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/tokens.dart';
import '../../../shared/widgets/skeleton_shimmer.dart';
import '../company_providers.dart';
import 'widgets/calendar_list.dart';

class CompanyCalendarPage extends ConsumerStatefulWidget {
  const CompanyCalendarPage({super.key});

  @override
  ConsumerState<CompanyCalendarPage> createState() =>
      _CompanyCalendarPageState();
}

class _CompanyCalendarPageState extends ConsumerState<CompanyCalendarPage> {
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
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final calendarAsync =
        ref.watch(companyCalendarProvider(_year, _month));

    return Scaffold(
      appBar: AppBar(title: const Text('Lịch công ty')),
      body: Column(
        children: [
          // Month picker header.
          Container(
            color: cs.surfaceContainerLow,
            padding: const EdgeInsets.symmetric(
              horizontal: GuHrSpacing.gutter,
              vertical: GuHrSpacing.stackMd,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _prevMonth,
                  tooltip: 'Tháng trước',
                ),
                Text(
                  'Tháng ${_month.toString().padLeft(2, '0')} / $_year',
                  style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _nextMonth,
                  tooltip: 'Tháng sau',
                ),
              ],
            ),
          ),
          // Calendar list fills remaining space with pull-to-refresh.
          Expanded(
            child: calendarAsync.when(
              loading: () => const _CalendarSkeleton(),
              error: (e, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline, color: cs.error, size: 40),
                    const SizedBox(height: 8),
                    Text('Không tải được lịch', style: tt.bodyMedium),
                    TextButton(
                      onPressed: () => ref.invalidate(
                        companyCalendarProvider(_year, _month),
                      ),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
              data: (entries) => RefreshIndicator(
                onRefresh: () async => ref.invalidate(
                  companyCalendarProvider(_year, _month),
                ),
                child: CalendarList(entries: entries),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarSkeleton extends StatelessWidget {
  const _CalendarSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(GuHrSpacing.gutter),
      children: [
        for (int i = 0; i < 5; i++) ...[
          const SkeletonCard(lineCount: 2, height: 72),
          const SizedBox(height: GuHrSpacing.stackMd),
        ],
      ],
    );
  }
}
