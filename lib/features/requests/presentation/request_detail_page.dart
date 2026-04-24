import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/tokens.dart';
import '../../auth/domain/auth_state.dart';
import '../../auth/presentation/auth_notifier.dart';
import '../../dashboard/dashboard_providers.dart';
import '../../manager/manager_providers.dart';
import '../../manager/presentation/approval_action_sheet.dart';
import '../domain/request_status.dart';
import '../requests_providers.dart';
import 'widgets/approval_timeline.dart';
import 'widgets/request_detail_widgets.dart';

class RequestDetailPage extends ConsumerWidget {
  const RequestDetailPage({super.key, required this.requestId});

  final int requestId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(requestDetailProvider(requestId));
    final authState = ref.watch(authNotifierProvider);
    final isManager = ref.watch(isManagerProvider);

    final currentUserId = switch (authState) {
      AuthAuthenticated(:final user) => user.id,
      _ => null,
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết đơn')),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
        data: (detail) {
          final status = RequestStatus.fromString(detail.status);
          final canCancel =
              status.canCancel && detail.employeeId == currentUserId;
          final attachmentUrls =
              detail.attachments.map((a) => a.url).toList();

          // Manager can approve/reject subordinate requests that are actionable.
          final isSubordinateRequest =
              isManager && detail.employeeId != currentUserId;
          final canManagerAct =
              isSubordinateRequest && status.canCancel; // pending | processing

          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(GuHrSpacing.gutter),
                children: [
                  RequestDetailHeader(detail: detail),
                  const SizedBox(height: GuHrSpacing.stackLg),
                  if (detail.reason != null && detail.reason!.isNotEmpty) ...[
                    Text('Lý do',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: GuHrSpacing.stackSm),
                    Text(detail.reason!),
                    const SizedBox(height: GuHrSpacing.stackLg),
                  ],
                  if (attachmentUrls.isNotEmpty) ...[
                    Text('Tài liệu đính kèm',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: GuHrSpacing.stackMd),
                    AttachmentThumbnailRow(urls: attachmentUrls),
                    const SizedBox(height: GuHrSpacing.stackLg),
                  ],
                  Text('Quy trình phê duyệt',
                      style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: GuHrSpacing.stackMd),
                  ApprovalTimeline(approvals: detail.approvals),
                  const SizedBox(height: GuHrSpacing.gutter),
                  if (canCancel)
                    CancelRequestButton(
                      requestId: requestId,
                      onCancelled: () {
                        ref.invalidate(requestDetailProvider(requestId));
                        ref.invalidate(myRequestsProvider);
                        ref.invalidate(dashboardProvider);
                      },
                    ),
                  // Extra bottom padding when FAB is shown.
                  if (canManagerAct) const SizedBox(height: 80),
                ],
              ),
              if (canManagerAct)
                Positioned(
                  bottom: 24,
                  right: 24,
                  child: FloatingActionButton.extended(
                    onPressed: () => _showApprovalSheet(context, ref),
                    icon: const Icon(Icons.rule_outlined),
                    label: const Text('Hành động'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void _showApprovalSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ApprovalActionSheet(
        requestId: requestId,
        onDone: (message) {
          Navigator.of(context).pop(); // close sheet
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
          // Refresh detail so status updates immediately.
          ref.invalidate(requestDetailProvider(requestId));
          Navigator.of(context).pop(); // pop detail page back to inbox
        },
      ),
    );
  }
}
