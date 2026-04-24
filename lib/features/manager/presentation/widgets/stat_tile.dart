import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';

/// 2×2 grid tile for manager dashboard stats.
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.label,
    required this.count,
    required this.bgColor,
    required this.fgColor,
    this.icon,
  });

  final String label;
  final int count;
  final Color bgColor;
  final Color fgColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(GuHrSpacing.stackLg),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
        border: Border.all(color: bgColor.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: fgColor),
            const SizedBox(height: GuHrSpacing.stackSm),
          ],
          Text(
            count.toString(),
            style: tt.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: fgColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: tt.labelSmall?.copyWith(color: fgColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
