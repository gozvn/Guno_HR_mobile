import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../data/dto/live_shift_dto.dart';
import '../../manager_providers.dart';

// ---------------------------------------------------------------------------
// Shift status chip

class ShiftStatusChip extends StatelessWidget {
  const ShiftStatusChip({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      'planned' => ('Kế hoạch', Colors.blue.shade600),
      'active' => ('Đang live', Colors.green.shade600),
      'completed' => ('Hoàn thành', Colors.teal.shade600),
      'approved' => ('Đã duyệt', Colors.green.shade700),
      'rejected' => ('Từ chối', Theme.of(context).colorScheme.error),
      'cancelled' => ('Đã huỷ', Colors.grey.shade500),
      _ => (status, Colors.grey.shade500),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Reject reason bottom sheet

class RejectShiftSheet extends ConsumerStatefulWidget {
  const RejectShiftSheet({
    super.key,
    required this.shiftId,
    required this.onRejected,
  });
  final int shiftId;
  final VoidCallback onRejected;

  @override
  ConsumerState<RejectShiftSheet> createState() => _RejectShiftSheetState();
}

class _RejectShiftSheetState extends ConsumerState<RejectShiftSheet> {
  final _ctrl = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _reject() async {
    if (_ctrl.text.trim().isEmpty) return;
    setState(() => _saving = true);
    try {
      await ref.read(liveShiftsApiProvider).reject(widget.shiftId, _ctrl.text.trim());
      widget.onRejected();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e')),
        );
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _ctrl.text.trim().isNotEmpty;
    final cs = Theme.of(context).colorScheme;
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
          Text(
            'Lý do từ chối',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: GuHrSpacing.stackLg),
          TextField(
            controller: _ctrl,
            maxLines: 3,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              labelText: 'Nhập lý do (bắt buộc)',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: GuHrSpacing.stackLg),
          FilledButton(
            onPressed: (hasText && !_saving) ? _reject : null,
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
            ),
            child: _saving
                ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Từ chối ca live'),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Dismissible shift card tile

class ShiftListTile extends ConsumerWidget {
  const ShiftListTile({super.key, required this.shift});

  final LiveShiftDto shift;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final canApprove = shift.status == 'completed';

    return Dismissible(
      key: ValueKey('shift-${shift.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: cs.errorContainer,
          borderRadius: BorderRadius.circular(GuHrRadii.lg),
        ),
        child: Icon(Icons.delete_outline, color: cs.onErrorContainer),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Xoá ca live?'),
            content: const Text('Sẽ xoá check-in đã ghi nhận. Tiếp tục?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Huỷ'),
              ),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: cs.error, foregroundColor: cs.onError),
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Xoá'),
              ),
            ],
          ),
        ) ?? false;
      },
      onDismissed: (_) async {
        try {
          await ref.read(liveShiftsApiProvider).delete(shift.id);
          ref.invalidate(liveShiftsProvider);
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Xoá thất bại: $e')),
            );
            ref.invalidate(liveShiftsProvider);
          }
        }
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(GuHrSpacing.stackLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      shift.employeeName ?? 'Nhân viên #${shift.employeeId}',
                      style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  ShiftStatusChip(status: shift.status),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${shift.startAt} – ${shift.endAt} · ${shift.channel.toUpperCase()}',
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              if (shift.gpsDistanceM != null) ...[
                const SizedBox(height: 2),
                Text(
                  'GPS: ${shift.gpsDistanceM!.toStringAsFixed(0)} m',
                  style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
              if (canApprove) ...[
                const SizedBox(height: GuHrSpacing.stackMd),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () => _showRejectSheet(context, ref),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: cs.error,
                        side: BorderSide(color: cs.error),
                      ),
                      child: const Text('Từ chối'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton(
                      onPressed: () => _approve(context, ref),
                      child: const Text('Duyệt'),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _approve(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(liveShiftsApiProvider).approve(shift.id);
      ref.invalidate(liveShiftsProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã duyệt ca live')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e')),
        );
      }
    }
  }

  void _showRejectSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => RejectShiftSheet(
        shiftId: shift.id,
        onRejected: () {
          ref.invalidate(liveShiftsProvider);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
