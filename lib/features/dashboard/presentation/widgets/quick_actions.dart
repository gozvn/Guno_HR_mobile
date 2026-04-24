import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';

// Row of shortcut action buttons at the bottom of the dashboard.
class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
    required this.onCheckin,
    required this.onCreateRequest,
    required this.onCalendar,
  });

  final VoidCallback onCheckin;
  final VoidCallback onCreateRequest;
  final VoidCallback onCalendar;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thao tác nhanh',
          style: tt.labelLarge?.copyWith(color: cs.onSurfaceVariant),
        ),
        const SizedBox(height: GuHrSpacing.stackLg),
        Row(
          children: [
            _ActionButton(
              icon: Icons.fingerprint,
              label: 'Chấm công',
              onTap: onCheckin,
            ),
            const SizedBox(width: GuHrSpacing.stackLg),
            _ActionButton(
              icon: Icons.edit_document,
              label: 'Tạo đơn',
              onTap: onCreateRequest,
            ),
            const SizedBox(width: GuHrSpacing.stackLg),
            _ActionButton(
              icon: Icons.calendar_month_outlined,
              label: 'Lịch công ty',
              onTap: onCalendar,
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: GuHrSpacing.stackLg),
          decoration: BoxDecoration(
            color: cs.secondaryContainer,
            borderRadius: BorderRadius.circular(GuHrRadii.xl),
          ),
          child: Column(
            children: [
              Icon(icon, color: cs.onSecondaryContainer, size: 28),
              const SizedBox(height: GuHrSpacing.stackSm),
              Text(
                label,
                style: tt.labelSmall?.copyWith(color: cs.onSecondaryContainer),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
