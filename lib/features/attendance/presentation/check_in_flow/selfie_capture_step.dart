import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../attendance_providers.dart';
import 'oval_overlay_painter.dart';

/// Step 2 — live camera preview with oval face-frame overlay.
/// On capture: compress → pass File to flow controller → advance.
class SelfieCaptureStep extends ConsumerStatefulWidget {
  const SelfieCaptureStep({super.key, required this.onCaptured});

  final VoidCallback onCaptured;

  @override
  ConsumerState<SelfieCaptureStep> createState() => _State();
}

class _State extends ConsumerState<SelfieCaptureStep> {
  CameraController? _ctrl;
  bool _initializing = true;
  bool _capturing = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final svc = ref.read(cameraServiceProvider);
      final ctrl = await svc.initialize();
      if (!mounted) return;
      setState(() {
        _ctrl = ctrl;
        _initializing = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Không thể mở camera: $e';
        _initializing = false;
      });
    }
  }

  Future<void> _capture() async {
    if (_capturing || _ctrl == null) return;
    setState(() => _capturing = true);
    try {
      final svc = ref.read(cameraServiceProvider);
      final xfile = await svc.takePicture();
      final compressor = ref.read(photoCompressorProvider);
      final compressed =
          await compressor.compress(File(xfile.path));

      ref.read(checkInFlowControllerProvider.notifier).setPhotoFile(compressed);
      widget.onCaptured();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi chụp ảnh: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _capturing = false);
    }
  }

  @override
  void dispose() {
    // Camera disposal handled by cameraServiceProvider.onDispose.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initializing) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt_outlined, size: 56, color: Colors.grey),
            const SizedBox(height: 16),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                setState(() {
                  _error = null;
                  _initializing = true;
                });
                _initCamera();
              },
              child: const Text('Thử lại'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              // Allow skipping selfie — photo_base64 will be null.
              onPressed: widget.onCaptured,
              child: const Text('Bỏ qua ảnh selfie'),
            ),
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        // Camera preview filling the step area.
        CameraPreview(_ctrl!),

        // Oval face-frame overlay guide (no ML Kit — R1 scope).
        const CustomPaint(
          painter: OvalOverlayPainter(),
          child: SizedBox.expand(),
        ),

        // Capture button at bottom.
        Positioned(
          bottom: 48,
          child: GestureDetector(
            onTap: _capturing ? null : _capture,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                    color: Colors.white60, width: 4),
              ),
              child: _capturing
                  ? const Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(
                          color: Colors.black54, strokeWidth: 3),
                    )
                  : const Icon(Icons.camera_alt,
                      color: Colors.black87, size: 32),
            ),
          ),
        ),

        // Skip button top-right.
        Positioned(
          top: 16,
          right: 16,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.black38,
              foregroundColor: Colors.white,
            ),
            onPressed: widget.onCaptured,
            child: const Text('Bỏ qua'),
          ),
        ),
      ],
    );
  }
}

// OvalOverlayPainter extracted to oval_overlay_painter.dart
