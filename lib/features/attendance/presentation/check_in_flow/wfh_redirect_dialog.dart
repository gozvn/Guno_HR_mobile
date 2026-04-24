import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shown when GPS radius check fails — lets user choose WFH flow or cancel.
/// If no approved WFH request exists, server returns 403 and caller must
/// redirect to create-request screen (phase-05).
class WfhRedirectDialog extends StatelessWidget {
  const WfhRedirectDialog({super.key, this.serverMessage});

  /// Optional server-provided detail about why outside-radius was triggered.
  final String? serverMessage;

  /// Show dialog and return true = proceed with WFH, false = cancel.
  static Future<bool> show(BuildContext context,
      {String? serverMessage}) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => WfhRedirectDialog(serverMessage: serverMessage),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.home_work_outlined, size: 40,
          color: Colors.orange),
      title: const Text('Ngoài phạm vi văn phòng'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (serverMessage != null) ...[
            Text(serverMessage!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey.shade600)),
            const SizedBox(height: 12),
          ],
          const Text(
            'Bạn có muốn chuyển sang chấm công WFH (làm việc từ xa) không?\n\n'
            'Lưu ý: Cần có đơn WFH được duyệt cho hôm nay.',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Huỷ'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: FilledButton.styleFrom(backgroundColor: Colors.orange.shade700),
          child: const Text('Chấm công WFH'),
        ),
        TextButton(
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
