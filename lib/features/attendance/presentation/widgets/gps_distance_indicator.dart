import 'package:flutter/material.dart';

import '../../domain/location_check.dart';

/// Shows distance to nearest office with green (in radius) / amber (outside) styling.
class GpsDistanceIndicator extends StatelessWidget {
  const GpsDistanceIndicator({super.key, required this.check});

  final LocationCheck check;

  @override
  Widget build(BuildContext context) {
    return switch (check) {
      LocationInRadius(:final locationName, :final distanceM, :final radiusM) =>
        _Pill(
          color: Colors.green,
          icon: Icons.location_on,
          text: '$locationName — ${distanceM.toInt()}m '
              '(bán kính ${radiusM}m)',
        ),
      LocationOutsideRadius(
        :final locationName,
        :final distanceM,
        :final radiusM,
      ) =>
        _Pill(
          color: Colors.amber.shade800,
          icon: Icons.location_off,
          text: '${locationName ?? 'Văn phòng gần nhất'} — '
              '${distanceM.toInt()}m (ngoài bán kính ${radiusM}m)',
        ),
      LocationUnknown() => const _Pill(
          color: Colors.grey,
          icon: Icons.gps_not_fixed,
          text: 'Không xác định được vị trí',
        ),
    };
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.color,
    required this.icon,
    required this.text,
  });

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: color, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
