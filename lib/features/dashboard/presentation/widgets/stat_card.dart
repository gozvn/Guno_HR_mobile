import 'package:flutter/material.dart';

import '../../../../app/theme/tokens.dart';
import '../../../../shared/widgets/skeleton_shimmer.dart';

// Small metric card used in the stats row on the dashboard.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.onTap,
    this.valueColor,
  });

  final String label;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: GuHrSpacing.stackLg,
            horizontal: GuHrSpacing.stackLg,
          ),
          decoration: BoxDecoration(
            color: cs.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(GuHrRadii.xl),
            border: Border.all(color: cs.outlineVariant, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 20, color: cs.primary),
              const SizedBox(height: 8),
              Text(
                value,
                style: tt.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? cs.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatCardSkeleton extends StatelessWidget {
  const StatCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(GuHrSpacing.stackLg),
        decoration: BoxDecoration(
          color: cs.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(GuHrRadii.xl),
          border: Border.all(color: cs.outlineVariant),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SkeletonShimmer(width: 24, height: 20),
            SkeletonShimmer(width: 40, height: 24),
            SkeletonShimmer(width: 80, height: 12),
          ],
        ),
      ),
    );
  }
}
