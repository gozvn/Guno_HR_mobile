import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/tokens.dart';
import '../../requests/data/dto/request_dto.dart';
import '../../requests/presentation/widgets/status_chip.dart';
import '../manager_providers.dart';
import 'widgets/empty_state.dart';

// Filter options for the chip bar
enum _ApprovalFilter { all, leave, wfh, other }

extension _ApprovalFilterExt on _ApprovalFilter {
  String get label => switch (this) {
        _ApprovalFilter.all => 'Tất cả',
        _ApprovalFilter.leave => 'Nghỉ',
        _ApprovalFilter.wfh => 'WFH',
        _ApprovalFilter.other => 'Khác',
      };

  String? get typeCode => switch (this) {
        _ApprovalFilter.all => null,
        _ApprovalFilter.leave => 'leave',
        _ApprovalFilter.wfh => 'wfh',
        _ApprovalFilter.other => 'other',
      };
}

class ApprovalsInboxPage extends ConsumerStatefulWidget {
  const ApprovalsInboxPage({super.key});

  @override
  ConsumerState<ApprovalsInboxPage> createState() => _ApprovalsInboxPageState();
}

class _ApprovalsInboxPageState extends ConsumerState<ApprovalsInboxPage> {
  _ApprovalFilter _filter = _ApprovalFilter.all;

  @override
  Widget build(BuildContext context) {
    final approvalsAsync =
        ref.watch(pendingApprovalsProvider(_filter.typeCode));
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn chờ duyệt'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(pendingApprovalsProvider),
            tooltip: 'Làm mới',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chip bar
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: GuHrSpacing.gutter,
              vertical: GuHrSpacing.stackMd,
            ),
            child: Row(
              children: _ApprovalFilter.values.map((f) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(f.label),
                    selected: _filter == f,
                    onSelected: (_) => setState(() => _filter = f),
                  ),
                );
              }).toList(),
            ),
          ),
          // List
          Expanded(
            child: approvalsAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Lỗi tải dữ liệu',
                        style: TextStyle(color: cs.error)),
                    const SizedBox(height: 8),
                    FilledButton(
                      onPressed: () =>
                          ref.invalidate(pendingApprovalsProvider),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const EmptyState(
                    icon: Icons.inbox_outlined,
                    message: 'Không có đơn chờ duyệt',
                    subtitle: 'Tất cả đơn đã được xử lý',
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(pendingApprovalsProvider),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: GuHrSpacing.gutter),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, i) =>
                        _ApprovalTile(request: items[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Single tile

class _ApprovalTile extends StatelessWidget {
  const _ApprovalTile({required this.request});

  final RequestDto request;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: _Avatar(
        name: request.employeeName ?? '?',
        avatarUrl: request.employeeAvatarUrl,
      ),
      title: Text(
        request.employeeName ?? 'Nhân viên',
        style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${request.typeName ?? request.type} · ${_fmtDate(request.startDate)} – ${_fmtDate(request.endDate)}',
            style: tt.bodySmall,
          ),
          if (request.reason != null && request.reason!.isNotEmpty)
            Text(
              request.reason!,
              style: tt.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
      trailing: StatusChip(status: request.status),
      onTap: () => context.push('/requests/${request.id}'),
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

class _Avatar extends StatelessWidget {
  const _Avatar({required this.name, this.avatarUrl});

  final String name;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final initials = name
        .trim()
        .split(' ')
        .map((w) => w.isNotEmpty ? w[0] : '')
        .take(2)
        .join()
        .toUpperCase();
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(avatarUrl!),
      );
    }
    return CircleAvatar(
      radius: 20,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Text(initials,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}
