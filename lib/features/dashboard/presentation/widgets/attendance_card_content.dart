import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/today_attendance_dto.dart';

// Internal widgets for TodayStatusCard when attendance data is present.
// Split out to keep today_status_card.dart under 200 LOC.

class AttendanceCardContent extends StatelessWidget {
  const AttendanceCardContent({
    super.key,
    required this.attendance,
    required this.cs,
    required this.tt,
  });

  final TodayAttendanceDto attendance;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    final labelStyle = tt.labelSmall
        ?.copyWith(color: cs.onPrimaryContainer.withValues(alpha: 0.7));
    final valueStyle = tt.titleSmall?.copyWith(
      color: cs.onPrimaryContainer,
      fontWeight: FontWeight.w600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.access_time_rounded,
                size: 16, color: cs.onPrimaryContainer),
            const SizedBox(width: 6),
            Text(
              attendance.shiftName ?? 'Ca làm việc',
              style: tt.labelMedium?.copyWith(color: cs.onPrimaryContainer),
            ),
            const Spacer(),
            AttendanceStatusChip(status: attendance.status, cs: cs),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            AttendanceTimeColumn(
              label: 'Vào',
              value: _formatTime(attendance.checkIn),
              labelStyle: labelStyle,
              valueStyle: valueStyle,
            ),
            const SizedBox(width: 32),
            AttendanceTimeColumn(
              label: 'Ra',
              value: _formatTime(attendance.checkOut),
              labelStyle: labelStyle,
              valueStyle: valueStyle,
            ),
            const Spacer(),
            if (attendance.workingPoint != null)
              WorkingPointBadge(
                point: attendance.workingPoint!,
                cs: cs,
                tt: tt,
              ),
          ],
        ),
      ],
    );
  }

  String _formatTime(String? raw) {
    if (raw == null) return '--:--';
    return raw.length >= 5 ? raw.substring(0, 5) : raw;
  }
}

class AttendanceTimeColumn extends StatelessWidget {
  const AttendanceTimeColumn({
    super.key,
    required this.label,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
  });

  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(height: 2),
        Text(value, style: valueStyle),
      ],
    );
  }
}

class AttendanceStatusChip extends StatelessWidget {
  const AttendanceStatusChip(
      {super.key, required this.status, required this.cs});

  final String status;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final label = switch (status) {
      'present' => 'Đúng giờ',
      'late' => 'Muộn',
      'leave' => 'Nghỉ phép',
      'wfh' => 'WFH',
      'holiday' => 'Nghỉ lễ',
      'absent' => 'Vắng',
      _ => status,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: cs.onPrimaryContainer.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(GuHrRadii.full),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: cs.onPrimaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class WorkingPointBadge extends StatelessWidget {
  const WorkingPointBadge(
      {super.key, required this.point, required this.cs, required this.tt});

  final double point;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Công',
            style: tt.labelSmall?.copyWith(
                color: cs.onPrimaryContainer.withValues(alpha: 0.7))),
        const SizedBox(height: 2),
        Text(
          point.toStringAsFixed(1),
          style: tt.titleMedium?.copyWith(
            color: cs.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
