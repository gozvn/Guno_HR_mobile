import 'package:flutter/material.dart';

import '../../data/dto/approval_step_dto.dart';
import '../../domain/request_status.dart';

class ApprovalTimeline extends StatelessWidget {
  const ApprovalTimeline({super.key, required this.approvals});

  final List<ApprovalStepDto> approvals;

  @override
  Widget build(BuildContext context) {
    if (approvals.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Chưa có thông tin phê duyệt.'),
      );
    }
    final sorted = [...approvals]
      ..sort((a, b) => a.stepOrder.compareTo(b.stepOrder));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < sorted.length; i++)
          _TimelineStep(
            step: sorted[i],
            isLast: i == sorted.length - 1,
          ),
      ],
    );
  }
}

class _TimelineStep extends StatelessWidget {
  const _TimelineStep({required this.step, required this.isLast});

  final ApprovalStepDto step;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final status = RequestStatus.fromString(step.status);
    final color = status.color(context);

    final icon = switch (status) {
      RequestStatus.approved => Icons.check_circle,
      RequestStatus.rejected => Icons.cancel,
      _ => Icons.radio_button_unchecked,
    };

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line + icon column
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Icon(icon, color: color, size: 22),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: cs.outlineVariant,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.approverName,
                    style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    status.labelVi,
                    style: tt.bodySmall?.copyWith(color: color),
                  ),
                  if (step.comment != null && step.comment!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      step.comment!,
                      style: tt.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant),
                    ),
                  ],
                  if (step.approvedAt != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      _fmtDate(step.approvedAt!),
                      style: tt.labelSmall
                          ?.copyWith(color: cs.onSurfaceVariant),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _fmtDate(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return '${dt.day.toString().padLeft(2, '0')}/'
          '${dt.month.toString().padLeft(2, '0')}/'
          '${dt.year} '
          '${dt.hour.toString().padLeft(2, '0')}:'
          '${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
  }
}
