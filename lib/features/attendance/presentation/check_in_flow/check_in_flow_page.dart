import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../attendance_providers.dart';
import '../../data/dto/checkin_response_dto.dart';
import 'confirm_step.dart';
import 'location_preview_step.dart';
import 'permission_gate_step.dart';
import 'selfie_capture_step.dart';
import 'wfh_redirect_dialog.dart';

/// Full-screen wizard: Permission → Location → Selfie → Confirm.
/// Type defaults to 'checkin'; pass type='checkout' for checkout flow.
class CheckInFlowPage extends ConsumerStatefulWidget {
  const CheckInFlowPage({super.key, this.type = 'checkin'});

  final String type;

  @override
  ConsumerState<CheckInFlowPage> createState() => _CheckInFlowPageState();
}

class _CheckInFlowPageState extends ConsumerState<CheckInFlowPage> {
  final _pageCtrl = PageController();

  @override
  void initState() {
    super.initState();
    // Set type and reset state when wizard opens.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(checkInFlowControllerProvider.notifier)
        ..reset()
        ..setType(widget.type);
    });
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  void _goTo(int page) {
    _pageCtrl.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _next() {
    final current = ref.read(checkInFlowControllerProvider).step;
    ref.read(checkInFlowControllerProvider.notifier).nextStep();
    _goTo(current + 1);
  }

  void _back() {
    final current = ref.read(checkInFlowControllerProvider).step;
    if (current == 0) {
      Navigator.of(context).pop();
      return;
    }
    ref.read(checkInFlowControllerProvider.notifier).prevStep();
    _goTo(current - 1);
  }

  Future<void> _handleWfh() async {
    final proceed = await WfhRedirectDialog.show(context);
    if (!proceed || !mounted) return;
    // Switch type to WFH and jump directly to selfie (skip GPS steps).
    ref.read(checkInFlowControllerProvider.notifier)
        .setType(widget.type == 'checkout' ? 'wfh_checkout' : 'wfh_checkin');
    _goTo(2); // Jump to selfie step
  }

  void _handleSuccess(CheckinResponseDto resp) {
    // Invalidate today provider so tab banner refreshes.
    ref.invalidate(todayAttendanceProvider);
    if (!mounted) return;
    _showResultAndPop(
      icon: Icons.check_circle,
      color: Colors.green,
      title: 'Chấm công thành công!',
      subtitle: resp.gpsDistanceM != null
          ? 'GPS score: ${resp.gpsScore?.toStringAsFixed(0)} — '
              '${resp.gpsDistanceM?.toInt()}m từ văn phòng'
          : 'Đã ghi nhận thời gian chấm công',
    );
  }

  void _handleQueued(String pendingId) {
    if (!mounted) return;
    _showResultAndPop(
      icon: Icons.cloud_upload_outlined,
      color: Colors.orange,
      title: 'Đã lưu chờ đồng bộ',
      subtitle: 'Khi có kết nối mạng, dữ liệu sẽ tự động gửi lên.',
    );
  }

  void _handleOutsideRadius(String msg) {
    _handleWfh();
  }

  void _showResultAndPop({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        icon: Icon(icon, color: color, size: 48),
        title: Text(title),
        content: Text(subtitle),
        actions: [
          FilledButton(
            onPressed: () {
              // Close dialog via root navigator; return to attendance tab root.
              Navigator.of(context, rootNavigator: true).pop();
              context.go('/attendance');
            },
            child: const Text('Xong'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final step = ref.watch(
        checkInFlowControllerProvider.select((s) => s.step));
    final stepTitles = [
      'Quyền truy cập',
      'Xác định vị trí',
      'Chụp ảnh',
      'Xác nhận',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: _back),
        title: Text(stepTitles[step.clamp(0, 3)]),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: (step + 1) / 4,
            backgroundColor: Colors.grey.shade200,
          ),
        ),
      ),
      body: PageView(
        controller: _pageCtrl,
        physics: const NeverScrollableScrollPhysics(), // wizard controls nav
        children: [
          PermissionGateStep(onGranted: _next),
          LocationPreviewStep(onNext: _next, onWfh: _handleWfh),
          SelfieCaptureStep(onCaptured: _next),
          ConfirmStep(
            onSuccess: _handleSuccess,
            onQueued: _handleQueued,
            onOutsideRadius: _handleOutsideRadius,
          ),
        ],
      ),
    );
  }
}
