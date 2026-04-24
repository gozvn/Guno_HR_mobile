import 'package:flutter/material.dart';

import '../../data/dto/monthly_attendance_dto.dart';

/// Bottom sheet showing full details for a tapped calendar day.
class DayDetailSheet extends StatelessWidget {
  const DayDetailSheet({super.key, required this.day});

  final MonthlyDayDto day;

  static void show(BuildContext context, MonthlyDayDto day) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => DayDetailSheet(day: day),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final statusColor = _statusColor(day.status);
    final statusLabel = _statusLabel(day.status);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle.
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: statusColor.withValues(alpha: 0.5)),
                ),
                child: Text(statusLabel,
                    style: tt.labelMedium?.copyWith(color: statusColor)),
              ),
              const Spacer(),
              Text(day.date, style: tt.bodySmall),
            ],
          ),

          const SizedBox(height: 20),

          _Row(
            icon: Icons.login,
            label: 'Check-in',
            value: _fmtTime(day.checkIn),
          ),
          _Row(
            icon: Icons.logout,
            label: 'Check-out',
            value: _fmtTime(day.checkOut),
          ),
          _Row(
            icon: Icons.access_time,
            label: 'Giờ làm',
            value: '${day.workingHours.toStringAsFixed(1)}h',
          ),
          if (day.lateMinutes > 0)
            _Row(
              icon: Icons.timer_off_outlined,
              label: 'Đi trễ',
              value: '${day.lateMinutes} phút',
              valueColor: Colors.orange,
            ),
        ],
      ),
    );
  }

  String _fmtTime(String? t) {
    if (t == null || t.isEmpty) return '—';
    return t.length >= 5 ? t.substring(0, 5) : t;
  }

  Color _statusColor(String status) => switch (status) {
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

  String _statusLabel(String status) => switch (status) {
        'present' => 'Có mặt',
        'late' => 'Đi trễ',
        'absent' => 'Vắng mặt',
        'leave' => 'Nghỉ phép',
        'holiday' => 'Ngày lễ',
        'wfh' => 'Làm từ xa',
        'business_trip' => 'Công tác',
        'early_leave' => 'Về sớm',
        'off' => 'Ngày nghỉ',
        _ => status,
      };
}

class _Row extends StatelessWidget {
  const _Row({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Text(label, style: tt.bodyMedium),
          const Spacer(),
          Text(
            value,
            style: tt.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
