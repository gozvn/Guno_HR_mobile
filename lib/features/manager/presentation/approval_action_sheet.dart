import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/tokens.dart';
import '../../../instrumentation/instrumentation_providers.dart';
import '../../requests/requests_db_providers.dart';
import '../manager_providers.dart';

/// Bottom sheet with optional comment field + [Từ chối] / [Duyệt] buttons.
///
/// Mounted from RequestDetailPage when isManager == true and the request
/// belongs to a subordinate with status pending/processing.
class ApprovalActionSheet extends ConsumerStatefulWidget {
  const ApprovalActionSheet({
    super.key,
    required this.requestId,
    required this.onDone,
  });

  final int requestId;

  /// Called after a successful approve or reject so the parent can pop/refresh.
  final void Function(String message) onDone;

  @override
  ConsumerState<ApprovalActionSheet> createState() =>
      _ApprovalActionSheetState();
}

class _ApprovalActionSheetState extends ConsumerState<ApprovalActionSheet> {
  final _commentCtrl = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _commentCtrl.dispose();
    super.dispose();
  }

  bool get _canReject => _commentCtrl.text.trim().isNotEmpty;

  Future<void> _approve() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final api = ref.read(requestsApiProvider);
      final result = await api.approve(
        widget.requestId,
        comment: _commentCtrl.text.trim().isEmpty
            ? null
            : _commentCtrl.text.trim(),
      );
      _invalidateProviders();
      await ref.read(analyticsServiceProvider).log(
            'approval_done',
            params: {'action': 'approve'},
          );
      final msg = result.finalApproved
          ? 'Đã duyệt — hoàn tất'
          : 'Đã duyệt — chuyển tiếp bước tiếp theo';
      widget.onDone(msg);
    } on Exception catch (e) {
      setState(() {
        _error = _mapError(e.toString());
        _loading = false;
      });
    }
  }

  Future<void> _reject() async {
    if (!_canReject) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final api = ref.read(requestsApiProvider);
      await api.reject(widget.requestId, comment: _commentCtrl.text.trim());
      _invalidateProviders();
      await ref.read(analyticsServiceProvider).log(
            'approval_done',
            params: {'action': 'reject'},
          );
      widget.onDone('Đã từ chối đơn');
    } on Exception catch (e) {
      setState(() {
        _error = _mapError(e.toString());
        _loading = false;
      });
    }
  }

  void _invalidateProviders() {
    ref.invalidate(pendingApprovalsProvider);
    ref.invalidate(managerDashboardProvider);
    ref.invalidate(pendingCountProvider);
  }

  String _mapError(String raw) {
    if (raw.contains('403')) return 'Bạn không có quyền duyệt đơn này';
    if (raw.contains('400')) return 'Ghi chú bắt buộc khi từ chối';
    return 'Đã xảy ra lỗi. Vui lòng thử lại.';
  }

  @override
  Widget build(BuildContext context) {
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
            'Hành động phê duyệt',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: GuHrSpacing.stackLg),
          TextField(
            controller: _commentCtrl,
            maxLines: 3,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              labelText:
                  'Ghi chú (tuỳ chọn khi duyệt, bắt buộc khi từ chối)',
              alignLabelWithHint: true,
              border: OutlineInputBorder(),
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: GuHrSpacing.stackMd),
            Text(
              _error!,
              style: TextStyle(color: cs.error, fontSize: 13),
            ),
          ],
          const SizedBox(height: GuHrSpacing.stackLg),
          if (_loading)
            const Center(child: CircularProgressIndicator())
          else
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _canReject ? _reject : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: cs.error,
                      side: BorderSide(
                        color: _canReject
                            ? cs.error
                            : cs.outline.withValues(alpha: 0.4),
                      ),
                    ),
                    child: const Text('Từ chối'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: _approve,
                    child: const Text('Duyệt'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
