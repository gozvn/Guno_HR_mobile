import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../attendance_providers.dart';

/// Shown when the GPS radius check fails. Branches on whether the user has
/// an approved WFH request covering today:
///   • Yes → offer "Chấm công WFH" + "Huỷ".
///   • No  → explain requirement, offer "Tạo đơn WFH" + "Huỷ" (no submit path).
/// Returning `true` means the caller should switch the wizard to the WFH path.
class WfhRedirectDialog extends ConsumerWidget {
  const WfhRedirectDialog({super.key, this.serverMessage});

  final String? serverMessage;

  static Future<bool> show(BuildContext context,
      {String? serverMessage}) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => WfhRedirectDialog(serverMessage: serverMessage),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approvedAsync = ref.watch(hasApprovedWfhTodayProvider);
    return approvedAsync.when(
      loading: () => const _LoadingDialog(),
      // On lookup error, default to the legacy permissive dialog — server
      // still gates submission, so a stale "yes" can't bypass enforcement.
      error: (_, __) => _RedirectChoice(
        serverMessage: serverMessage,
        approved: true,
      ),
      data: (approved) => _RedirectChoice(
        serverMessage: serverMessage,
        approved: approved,
      ),
    );
  }
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog();

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: SizedBox(
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _RedirectChoice extends StatelessWidget {
  const _RedirectChoice({
    required this.serverMessage,
    required this.approved,
  });

  final String? serverMessage;
  final bool approved;

  @override
  Widget build(BuildContext context) {
    final body = approved
        ? 'Bạn có muốn chuyển sang chấm công WFH (làm việc từ xa) không?'
        : 'Bạn chưa có đơn WFH được duyệt cho hôm nay nên không thể chấm công '
            'từ xa. Hãy tạo đơn WFH và chờ duyệt trước khi thực hiện.';
    return AlertDialog(
      icon: const Icon(Icons.home_work_outlined,
          size: 40, color: Colors.orange),
      title: const Text('Ngoài phạm vi văn phòng'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (serverMessage != null) ...[
            Text(
              serverMessage!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const SizedBox(height: 12),
          ],
          Text(body),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Huỷ'),
        ),
        if (approved)
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Chấm công WFH'),
          )
        else
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(false);
              context.push('/requests/create?type=wfh');
            },
            child: const Text('Tạo đơn WFH'),
          ),
      ],
    );
  }
}
