import 'package:camera/camera.dart';

/// Wraps the camera package for selfie capture.
/// Front camera preferred; falls back to first available.
/// Photo is written to the system temp dir — NOT saved to the Photos library.
class CameraService {
  CameraController? _controller;

  CameraController? get controller => _controller;

  bool get isInitialized => _controller?.value.isInitialized == true;

  /// Initializes the front (selfie) camera.
  /// Throws [CameraException] if no camera is available.
  Future<CameraController> initialize() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      throw CameraException('noCameraAvailable', 'No cameras found on device');
    }

    // Prefer front camera for selfie; fall back to first available.
    final camera = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    final controller = CameraController(
      camera,
      ResolutionPreset.medium, // medium keeps file size manageable pre-compress
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await controller.initialize();
    _controller = controller;
    return controller;
  }

  /// Capture a photo. Returns the XFile in the system temp directory.
  /// Caller passes this to PhotoCompressor before encoding base64.
  Future<XFile> takePicture() async {
    final ctrl = _controller;
    if (ctrl == null || !ctrl.value.isInitialized) {
      throw StateError('CameraService: call initialize() before takePicture()');
    }
    return ctrl.takePicture();
  }

  /// Release camera resources. Call from widget dispose or when leaving flow.
  Future<void> dispose() async {
    await _controller?.dispose();
    _controller = null;
  }
}
