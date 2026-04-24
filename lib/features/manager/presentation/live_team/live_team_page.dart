import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/live_team_dto.dart';
import '../../manager_providers.dart';
import '../widgets/empty_state.dart';
import 'add_member_sheet.dart';

class LiveTeamPage extends ConsumerWidget {
  const LiveTeamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersAsync = ref.watch(liveTeamMembersProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhóm Live'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_outlined),
            tooltip: 'Thêm thành viên',
            onPressed: () => _showAddSheet(context, ref),
          ),
        ],
      ),
      body: membersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Lỗi tải danh sách', style: TextStyle(color: cs.error)),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: () => ref.invalidate(liveTeamMembersProvider),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (members) {
          if (members.isEmpty) {
            return const EmptyState(
              icon: Icons.groups_outlined,
              message: 'Nhóm live chưa có thành viên',
              subtitle: 'Nhấn + để thêm',
            );
          }

          // Group by role
          final hosts = members.where((m) => m.role == 'host').toList();
          final editors = members.where((m) => m.role != 'host').toList();

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(liveTeamMembersProvider),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: GuHrSpacing.gutter, vertical: GuHrSpacing.stackMd),
              children: [
                if (hosts.isNotEmpty) ...[
                  _SectionHeader(title: 'Host (${hosts.length})'),
                  ...hosts.map((m) => _MemberTile(member: m)),
                ],
                if (editors.isNotEmpty) ...[
                  if (hosts.isNotEmpty)
                    const SizedBox(height: GuHrSpacing.stackMd),
                  _SectionHeader(title: 'Editor (${editors.length})'),
                  ...editors.map((m) => _MemberTile(member: m)),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  void _showAddSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => AddMemberSheet(
        onAdded: () => Navigator.of(context).pop(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Section header

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: GuHrSpacing.stackSm),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Swipe-to-delete + tap-to-change-role tile

class _MemberTile extends ConsumerWidget {
  const _MemberTile({required this.member});

  final LiveTeamMemberDto member;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(member.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(GuHrRadii.lg),
        ),
        child: Icon(Icons.delete_outline,
            color: Theme.of(context).colorScheme.onErrorContainer),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Xoá khỏi nhóm?'),
            content: Text('Xoá ${member.fullName} khỏi nhóm live?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Huỷ'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Xoá'),
              ),
            ],
          ),
        ) ??
            false;
      },
      onDismissed: (_) async {
        try {
          await ref.read(liveTeamApiProvider).removeMember(member.id);
          ref.invalidate(liveTeamMembersProvider);
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Xoá thất bại: $e')),
            );
            ref.invalidate(liveTeamMembersProvider);
          }
        }
      },
      child: ListTile(
        leading: _Avatar(name: member.fullName, avatarUrl: member.avatarUrl),
        title: Text(member.fullName),
        subtitle: member.position != null ? Text(member.position!) : null,
        trailing: _RoleBadge(role: member.role),
        onTap: () => _showRoleSheet(context, ref),
      ),
    );
  }

  void _showRoleSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => _RoleChangeSheet(member: member),
    );
  }
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge({required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    final isHost = role == 'host';
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isHost
            ? cs.primaryContainer.withValues(alpha: 0.3)
            : cs.secondaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(GuHrRadii.full),
      ),
      child: Text(
        isHost ? 'Host' : 'Editor',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isHost ? cs.primary : cs.secondary,
        ),
      ),
    );
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
      return CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatarUrl!));
    }
    return CircleAvatar(
      radius: 20,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Text(initials, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}

// ---------------------------------------------------------------------------
// Quick role change sheet

class _RoleChangeSheet extends ConsumerStatefulWidget {
  const _RoleChangeSheet({required this.member});
  final LiveTeamMemberDto member;

  @override
  ConsumerState<_RoleChangeSheet> createState() => _RoleChangeSheetState();
}

class _RoleChangeSheetState extends ConsumerState<_RoleChangeSheet> {
  late String _role;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _role = widget.member.role;
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await ref.read(liveTeamApiProvider).updateMember(widget.member.id, _role);
      ref.invalidate(liveTeamMembersProvider);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cập nhật thất bại. Thử lại.')),
        );
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: GuHrSpacing.gutter,
        right: GuHrSpacing.gutter,
        top: GuHrSpacing.gutter,
        bottom: MediaQuery.viewInsetsOf(context).bottom + GuHrSpacing.gutter,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Thay đổi vai trò — ${widget.member.fullName}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: GuHrSpacing.stackLg),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'editor', label: Text('Editor')),
              ButtonSegment(value: 'host', label: Text('Host')),
            ],
            selected: {_role},
            onSelectionChanged: (s) => setState(() => _role = s.first),
          ),
          const SizedBox(height: GuHrSpacing.stackLg),
          FilledButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Lưu'),
          ),
        ],
      ),
    );
  }
}
