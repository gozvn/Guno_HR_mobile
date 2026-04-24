import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';
import '../../../../features/dashboard/data/dto/today_attendance_dto.dart';
import '../../../../shared/widgets/skeleton_shimmer.dart';
import 'attendance_card_content.dart';

// Card showing today's check-in / check-out time and working_point score.
// Detail sub-widgets live in attendance_card_content.dart.
class TodayStatusCard extends StatelessWidget {
  const TodayStatusCard({super.key, required this.attendance});

  final TodayAttendanceDto? attendance;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(GuHrSpacing.cardPadding),
      decoration: BoxDecoration(
        color: cs.primaryContainer,
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
      ),
      child: attendance == null
          ? _NoAttendance(cs: cs, tt: tt)
          : AttendanceCardContent(attendance: attendance!, cs: cs, tt: tt),
    );
  }
}

class _NoAttendance extends StatelessWidget {
  const _NoAttendance({required this.cs, required this.tt});

  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hôm nay',
            style: tt.labelSmall?.copyWith(color: cs.onPrimaryContainer)),
        const SizedBox(height: 4),
        Text(
          'Chưa chấm công',
          style: tt.titleMedium?.copyWith(
            color: cs.onPrimaryContainer,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// Loading skeleton for TodayStatusCard.
class TodayStatusCardSkeleton extends StatelessWidget {
  const TodayStatusCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.all(GuHrSpacing.cardPadding),
      decoration: BoxDecoration(
        color: cs.primaryContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SkeletonShimmer(width: 120, height: 12),
          SkeletonShimmer(width: double.infinity, height: 16),
          SkeletonShimmer(width: 180, height: 12),
        ],
      ),
    );
  }
}
