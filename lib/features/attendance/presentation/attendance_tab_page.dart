import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../attendance_providers.dart';
import 'widgets/pending_sync_chip.dart';
import 'widgets/today_status_banner.dart';

/// Attendance tab — today status + check-in CTA + week strip + monthly link.
class AttendanceTabPage extends ConsumerWidget {
  const AttendanceTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chấm công'),
        actions: const [
          PendingSyncChip(),
          SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(todayAttendanceProvider),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Today status.
            const TodayStatusBanner(),
            const SizedBox(height: 24),

            // Primary action button.
            _CheckInButton(),
            const SizedBox(height: 8),
            _CheckOutButton(),
            const SizedBox(height: 24),

            // This-week mini strip.
            const _WeekStrip(),
            const SizedBox(height: 16),

            // Link to monthly view.
            OutlinedButton.icon(
              onPressed: () =>
                  context.pushNamed(Routes.attendanceMonthly),
              icon: const Icon(Icons.calendar_month_outlined),
              label: const Text('Xem bảng công tháng'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckInButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(todayAttendanceProvider);
    final record = async.valueOrNull;
    // Disable if already checked in (checkIn present) and not yet checked out.
    final alreadyIn =
        record != null && record.checkIn != null && record.checkOut == null;
    if (alreadyIn) return const SizedBox.shrink();

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: () => context.pushNamed(Routes.attendanceCheckIn),
        icon: const Icon(Icons.fingerprint, size: 28),
        label: const Text('Chấm công vào', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

class _CheckOutButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(todayAttendanceProvider);
    final record = async.valueOrNull;
    // Show checkout button only when checked in but not yet out.
    final canCheckOut =
        record != null && record.checkIn != null && record.checkOut == null;
    if (!canCheckOut) return const SizedBox.shrink();

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: () =>
            context.pushNamed(Routes.attendanceCheckIn, queryParameters: {
          'type': 'checkout',
        }),
        icon: const Icon(Icons.logout, size: 24),
        label: const Text('Chấm công ra', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

/// Displays the 7-day strip for the current ISO week.
class _WeekStrip extends ConsumerWidget {
  const _WeekStrip();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();

    // Build week days: Mon → Sun of the current week.
    final monday = today.subtract(Duration(days: today.weekday - 1));
    final weekDays = List.generate(7, (i) => monday.add(Duration(days: i)));

    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tuần này', style: tt.titleSmall),
        const SizedBox(height: 8),
        Row(
          children: weekDays.map((day) {
            final isToday = DateUtils.isSameDay(day, today);
            final label = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN']
                [day.weekday - 1];

            return Expanded(
              child: Column(
                children: [
                  Text(label,
                      style: tt.labelSmall
                          ?.copyWith(color: Colors.grey.shade500)),
                  const SizedBox(height: 4),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isToday
                          ? cs.primary
                          : Colors.grey.shade100,
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: tt.bodySmall?.copyWith(
                          color: isToday ? Colors.white : null,
                          fontWeight: isToday
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
