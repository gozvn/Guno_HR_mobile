import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../attendance_providers.dart';

/// Shows today's check-in / check-out status at the top of the Attendance tab.
/// Colors: amber = not yet checked in, green = checked in, grey = fully done.
class TodayStatusBanner extends ConsumerWidget {
  const TodayStatusBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(todayAttendanceProvider);

    return async.when(
      loading: () => const _BannerShell(
        color: Colors.grey,
        icon: Icons.hourglass_empty,
        label: 'Đang tải...',
        sub: '',
      ),
      error: (_, __) => const _BannerShell(
        color: Colors.grey,
        icon: Icons.error_outline,
        label: 'Không tải được dữ liệu',
        sub: '',
      ),
      data: (record) {
        if (record == null) {
          return const _BannerShell(
            color: Colors.amber,
            icon: Icons.fingerprint,
            label: 'Chưa chấm công hôm nay',
            sub: 'Nhấn [Chấm công] để bắt đầu',
          );
        }

        final checkIn = record.checkIn;
        final checkOut = record.checkOut;

        if (checkIn != null && checkOut != null) {
          return _BannerShell(
            color: Colors.grey.shade600,
            icon: Icons.check_circle,
            label: 'Đã hoàn thành hôm nay',
            sub: 'Vào: ${_fmt(checkIn)}  •  Ra: ${_fmt(checkOut)}',
          );
        }

        if (checkIn != null) {
          return _BannerShell(
            color: Colors.green,
            icon: Icons.login,
            label: 'Đã check-in lúc ${_fmt(checkIn)}',
            sub: 'Nhớ check-out khi rời văn phòng',
          );
        }

        return const _BannerShell(
          color: Colors.amber,
          icon: Icons.fingerprint,
          label: 'Chưa chấm công hôm nay',
          sub: 'Nhấn [Chấm công] để bắt đầu',
        );
      },
    );
  }

  /// Trims HH:MM:SS → HH:MM for display.
  String _fmt(String time) =>
      time.length >= 5 ? time.substring(0, 5) : time;
}

class _BannerShell extends StatelessWidget {
  const _BannerShell({
    required this.color,
    required this.icon,
    required this.label,
    required this.sub,
  });

  final Color color;
  final IconData icon;
  final String label;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 36),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: color, fontWeight: FontWeight.w600)),
                if (sub.isNotEmpty)
                  Text(sub,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: color.withValues(alpha: 0.8))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
