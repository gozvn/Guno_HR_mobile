import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../manager/manager_providers.dart';

/// Báo cáo & bảng công landing. Role-aware:
///   • Employees: Bảng công của tôi + Phép năm của tôi.
///   • Managers : same + cross-employee reports + pending-approvals banner.
class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isManager = ref.watch(isManagerProvider);
    final pending = isManager
        ? (ref.watch(pendingCountProvider).valueOrNull ?? 0)
        : 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Báo cáo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (pending > 0) _ApprovalsBanner(count: pending),

          // Personal — visible for everyone.
          const _SectionHeader('Cá nhân'),
          _ReportCard(
            icon: Icons.calendar_month,
            label: 'Bảng công của tôi',
            subtitle: 'Lịch chấm công + thống kê tháng',
            onTap: () =>
                GoRouter.of(context).goNamed(Routes.attendanceMonthly),
          ),
          const SizedBox(height: 12),
          _ReportCard(
            icon: Icons.beach_access,
            label: 'Phép năm của tôi',
            subtitle: 'Số ngày phép còn lại',
            onTap: () => GoRouter.of(context).goNamed(Routes.leave),
          ),

          if (isManager) ...[
            const SizedBox(height: 24),
            const _SectionHeader('Quản lý'),
            _ReportCard(
              icon: Icons.bar_chart_outlined,
              label: 'Chấm công tháng (toàn phòng)',
              subtitle: 'Bảng công cross-employee',
              onTap: () => GoRouter.of(context)
                  .goNamed(Routes.reportsAttendance),
            ),
            const SizedBox(height: 12),
            _ReportCard(
              icon: Icons.event_available,
              label: 'Phép năm (toàn phòng)',
              subtitle: 'Số ngày còn lại theo nhân viên',
              onTap: () => GoRouter.of(context)
                  .goNamed(Routes.reportsLeaveBalance),
            ),
            const SizedBox(height: 12),
            _ReportCard(
              icon: Icons.assignment_outlined,
              label: 'Đơn từ (tổng hợp)',
              subtitle: 'Theo loại + trạng thái',
              onTap: () =>
                  GoRouter.of(context).goNamed(Routes.reportsRequests),
            ),
          ],
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 8),
      child: Text(
        label,
        style: tt.labelLarge?.copyWith(color: cs.onSurfaceVariant),
      ),
    );
  }
}

class _ApprovalsBanner extends StatelessWidget {
  const _ApprovalsBanner({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      color: cs.tertiaryContainer,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const Icon(Icons.pending_actions),
        title: Text('$count đơn chờ duyệt'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () =>
            GoRouter.of(context).goNamed(Routes.reportsApprovals),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(label),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
