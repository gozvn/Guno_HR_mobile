import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../attendance_providers.dart';
import '../../data/dto/checkin_response_dto.dart';
import '../../domain/check_in_result.dart';
import '../widgets/gps_distance_indicator.dart';

/// Step 3 — summary of GPS + photo + note before final submission.
class ConfirmStep extends ConsumerWidget {
  const ConfirmStep({
    super.key,
    required this.onSuccess,
    required this.onQueued,
    required this.onOutsideRadius,
  });

  final void Function(CheckinResponseDto) onSuccess;
  final void Function(String pendingId) onQueued;
  final void Function(String message) onOutsideRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkInFlowControllerProvider);
    final ctrl = ref.read(checkInFlowControllerProvider.notifier);
    final tt = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Xác nhận chấm công', style: tt.titleLarge),
          const SizedBox(height: 20),

          // Photo thumbnail.
          if (state.photoFile != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                state.photoFile!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
          ] else
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt_outlined,
                        color: Colors.grey, size: 36),
                    SizedBox(height: 8),
                    Text('Không có ảnh selfie',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 12),

          // GPS coordinates.
          if (state.position != null) ...[
            Text('Vị trí GPS', style: tt.labelLarge),
            const SizedBox(height: 4),
            Text(
              '${state.position!.latitude.toStringAsFixed(6)}, '
              '${state.position!.longitude.toStringAsFixed(6)}',
              style: tt.bodySmall?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
          ],

          // Office distance pill.
          if (state.locationCheck != null)
            GpsDistanceIndicator(check: state.locationCheck!),

          const SizedBox(height: 20),

          // Optional note.
          TextField(
            decoration: const InputDecoration(
              labelText: 'Ghi chú (tuỳ chọn)',
              border: OutlineInputBorder(),
              hintText: 'Ví dụ: Đến muộn do kẹt xe',
            ),
            maxLines: 2,
            onChanged: ctrl.setNote,
          ),

          // Error display.
          if (state.errorMessage != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                state.errorMessage!,
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          ],

          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: state.isSubmitting ? null : () => _submit(ref),
              child: state.isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Chấm công'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submit(WidgetRef ref) async {
    final notifier = ref.read(checkInFlowControllerProvider.notifier);
    final result = await notifier.submit();
    switch (result) {
      case CheckInSuccess(:final response):
        onSuccess(response);
      case CheckInQueuedOffline(:final pendingId):
        onQueued(pendingId);
      case CheckInOutsideRadius(:final serverMessage):
        onOutsideRadius(serverMessage);
      case CheckInFailed(:final failure):
        // Surface server message verbatim — e.g. "Không có đơn WFH được duyệt".
        notifier.setError(failure.when(
          network: (m) => m,
          unauthorized: (_) => 'Phiên đã hết hạn, đăng nhập lại',
          forbidden: (msg) => msg ?? 'Không có quyền thực hiện',
          validation: (m) => m,
          server: (_, m) => m ?? 'Lỗi máy chủ',
          unknown: (_) => 'Lỗi không xác định',
        ));
    }
  }
}
