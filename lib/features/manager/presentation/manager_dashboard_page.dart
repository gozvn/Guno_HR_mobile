import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/tokens.dart';
import '../../requests/presentation/widgets/status_chip.dart';
import '../data/dto/manager_dashboard_dto.dart';
import '../manager_providers.dart';
import 'widgets/attendance_status_dot.dart';
import 'widgets/empty_state.dart';
import 'widgets/stat_tile.dart';

class ManagerDashboardPage extends ConsumerWidget {
  const ManagerDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashAsync = ref.watch(managerDashboardProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(managerDashboardProvider),
            tooltip: 'Làm mới',
          ),
        ],
      ),
      body: dashAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Lỗi tải dữ liệu', style: TextStyle(color: cs.error)),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: () => ref.invalidate(managerDashboardProvider),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(managerDashboardProvider),
          child: ListView(
            padding: const EdgeInsets.all(GuHrSpacing.gutter),
            children: [
              _StatsGrid(stats: data.stats),
              const SizedBox(height: GuHrSpacing.stackLg),
              _TeamRoster(members: data.team),
              const SizedBox(height: GuHrSpacing.stackLg),
              _PendingApprovalsCard(requests: data.pendingRequests),
              const SizedBox(height: GuHrSpacing.stackLg),
              _TodayAttendanceList(rows: data.todayAttendance),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Stats 2×2 grid

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.stats});

  final ManagerStatsDto stats;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    // tertiaryContainer = emerald for "present"
    const emerald = Color(0xFF005035); // _tertiaryContainer from colors.dart

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: GuHrSpacing.stackMd,
      mainAxisSpacing: GuHrSpacing.stackMd,
      childAspectRatio: 1.6,
      children: [
        StatTile(
          label: 'Có mặt',
          count: stats.present,
          bgColor: emerald,
          fgColor: const Color(0xFF33CA91),
          icon: Icons.check_circle_outline,
        ),
        StatTile(
          label: 'Đi trễ',
          count: stats.late,
          bgColor: Colors.amber.shade700,
          fgColor: Colors.amber.shade800,
          icon: Icons.schedule_outlined,
        ),
        StatTile(
          label: 'Vắng mặt',
          count: stats.absent,
          bgColor: cs.errorContainer,
          fgColor: cs.onErrorContainer,
          icon: Icons.cancel_outlined,
        ),
        StatTile(
          label: 'Chờ duyệt',
          count: stats.pendingCount,
          bgColor: const Color(0xFF0F4C5C), // primaryContainer
          fgColor: const Color(0xFF87BBCE), // onPrimaryContainer
          icon: Icons.inbox_outlined,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Horizontal team avatar row

class _TeamRoster extends StatelessWidget {
  const _TeamRoster({required this.members});

  final List<TeamMemberDto> members;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nhóm (${members.length})', style: tt.labelLarge),
        const SizedBox(height: GuHrSpacing.stackMd),
        if (members.isEmpty)
          Text('Chưa có thành viên', style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant))
        else
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: members.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final m = members[i];
                return Column(
                  children: [
                    _MemberAvatar(name: m.fullName, avatarUrl: m.avatarUrl),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 52,
                      child: Text(
                        m.fullName.split(' ').last,
                        style: tt.labelSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}

class _MemberAvatar extends StatelessWidget {
  const _MemberAvatar({required this.name, this.avatarUrl});

  final String name;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final initials = name.trim().split(' ').map((w) => w.isNotEmpty ? w[0] : '').take(2).join().toUpperCase();
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage(avatarUrl!),
        child: null,
      );
    }
    return CircleAvatar(
      radius: 22,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Text(initials, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
    );
  }
}

// ---------------------------------------------------------------------------
// Pending approvals card — top 3 + "Xem tất cả"

class _PendingApprovalsCard extends StatelessWidget {
  const _PendingApprovalsCard({required this.requests});

  final List<PendingRequestSummaryDto> requests;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text('Đơn chờ duyệt', style: tt.labelLarge)),
            TextButton(
              onPressed: () => context.push('/manager/approvals'),
              child: const Text('Xem tất cả'),
            ),
          ],
        ),
        if (requests.isEmpty)
          const EmptyState(
            icon: Icons.inbox_outlined,
            message: 'Không có đơn chờ duyệt',
          )
        else
          ...requests.take(3).map(
                (r) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: _MemberAvatar(
                    name: r.fullName ?? '?',
                    avatarUrl: r.avatarUrl,
                  ),
                  title: Text(r.fullName ?? 'Nhân viên', style: tt.bodyMedium),
                  subtitle: Text(
                    '${r.typeName ?? r.type} · ${_fmtDate(r.startDate)}',
                    style: tt.bodySmall,
                  ),
                  trailing: StatusChip(status: r.status),
                  onTap: () => context.push('/requests/${r.id}'),
                ),
              ),
      ],
    );
  }

  String _fmtDate(String d) {
    try {
      final dt = DateTime.parse(d);
      return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}';
    } catch (_) {
      return d;
    }
  }
}

// ---------------------------------------------------------------------------
// Today attendance list

class _TodayAttendanceList extends StatelessWidget {
  const _TodayAttendanceList({required this.rows});

  final List<TodayAttendanceRowDto> rows;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Chấm công hôm nay', style: tt.labelLarge),
        const SizedBox(height: GuHrSpacing.stackMd),
        if (rows.isEmpty)
          const EmptyState(
            icon: Icons.people_outline,
            message: 'Chưa có dữ liệu chấm công hôm nay',
          )
        else
          ...rows.map(
            (r) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: AttendanceStatusDot(status: r.status),
              title: Text(r.fullName, style: tt.bodyMedium),
              subtitle: r.checkInAt != null
                  ? Text(_fmtTime(r.checkInAt!), style: tt.bodySmall)
                  : Text('Chưa chấm', style: tt.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ),
          ),
      ],
    );
  }

  String _fmtTime(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
  }
}
