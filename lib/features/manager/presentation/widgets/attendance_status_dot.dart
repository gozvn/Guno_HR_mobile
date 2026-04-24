import 'package:flutter/material.dart';

/// Colored dot indicator for attendance status in manager dashboard list.
class AttendanceStatusDot extends StatelessWidget {
  const AttendanceStatusDot({super.key, required this.status});

  final String status; // present | late | absent

  @override
  Widget build(BuildContext context) {
    final color = _color(context);
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Color _color(BuildContext context) => switch (status) {
        'present' => Colors.green.shade500,
        'late' => Colors.amber.shade700,
        'absent' => Theme.of(context).colorScheme.error,
        _ => Colors.grey.shade400,
      };
}
