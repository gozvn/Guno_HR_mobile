import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/tokens.dart';
import '../../requests_providers.dart';
import 'attachment_picker_row.dart';

/// Step 2 of create-request flow: date range + reason + attachments.
class DetailsFormStep extends ConsumerStatefulWidget {
  const DetailsFormStep({
    super.key,
    required this.typeCode,
    required this.onSubmit,
  });

  final String typeCode;
  final VoidCallback onSubmit;

  @override
  ConsumerState<DetailsFormStep> createState() => _DetailsFormStepState();
}

class _DetailsFormStepState extends ConsumerState<DetailsFormStep> {
  DateTime? _startDate;
  DateTime? _endDate;
  final _reasonCtrl = TextEditingController();

  @override
  void dispose() {
    _reasonCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(createRequestNotifierProvider.notifier);
    final state = ref.watch(createRequestNotifierProvider);
    final pendingFiles = state.maybeMap(
      step2: (s) => s.pendingFiles,
      orElse: () => const <File>[],
    );
    final uploading = state.maybeMap(
      step2: (s) => s.uploading,
      submitting: (_) => true,
      orElse: () => false,
    );
    final errorMsg =
        state.maybeMap(error: (e) => e.message, orElse: () => null);

    return ListView(
      padding: const EdgeInsets.all(GuHrSpacing.gutter),
      children: [
        // Date range picker
        OutlinedButton.icon(
          onPressed: uploading ? null : () => _pickDateRange(context),
          icon: const Icon(Icons.date_range_outlined),
          label: Text(
            _startDate == null
                ? 'Chọn ngày bắt đầu và kết thúc'
                : '${_fmt(_startDate!)} → ${_fmt(_endDate ?? _startDate!)}',
          ),
        ),
        if (_startDate == null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              'Vui lòng chọn ngày',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.error, fontSize: 12),
            ),
          ),
        const SizedBox(height: GuHrSpacing.stackLg),

        // Reason textarea
        TextFormField(
          controller: _reasonCtrl,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Lý do (không bắt buộc)',
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
          onChanged: notifier.updateReason,
        ),
        const SizedBox(height: GuHrSpacing.stackLg),

        // Attachment picker
        AttachmentPickerRow(pendingFiles: pendingFiles),
        const SizedBox(height: GuHrSpacing.gutter),

        if (errorMsg != null)
          Padding(
            padding: const EdgeInsets.only(bottom: GuHrSpacing.stackMd),
            child: Text(
              errorMsg,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),

        FilledButton(
          onPressed: uploading ? null : _submit,
          child: uploading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.white),
                )
              : const Text('Gửi đơn'),
        ),
      ],
    );
  }

  Future<void> _pickDateRange(BuildContext context) async {
    final now = DateTime.now();
    final range = await showDateRangePicker(
      context: context,
      firstDate: now.subtract(const Duration(days: 7)),
      lastDate: now.add(const Duration(days: 365)),
      currentDate: now,
      locale: const Locale('vi', 'VN'),
      helpText: 'Chọn khoảng thời gian nghỉ',
      saveText: 'Xác nhận',
    );
    if (range == null) return;
    setState(() {
      _startDate = range.start;
      _endDate = range.end;
    });
    ref
        .read(createRequestNotifierProvider.notifier)
        .updateDates(_fmt(range.start), _fmt(range.end));
  }

  void _submit() {
    if (_startDate == null) return;
    ref.read(createRequestNotifierProvider.notifier).uploadAndSubmit();
    widget.onSubmit();
  }

  String _fmt(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}
