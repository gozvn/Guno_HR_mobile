import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

/// Compresses a JPEG selfie for transmission as base64.
/// Target: ≤1.5MB file (≤2MB after base64 33% inflation ≤ server's 5MB cap).
class PhotoCompressor {
  static const _maxDimension = 1024;
  static const _qualityHigh = 80;
  static const _qualityFallback = 60;
  static const _maxBytesBeforeEncoding = 2 * 1024 * 1024; // 2MB

  /// Decode → resize to max 1024px on longest side → encode JPEG quality 80.
  /// If result >2MB, retry at quality 60.
  /// Output written to app temp dir (not Photo library).
  Future<File> compress(File input) async {
    final bytes = await input.readAsBytes();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) throw StateError('Cannot decode image: ${input.path}');

    final resized = _resize(decoded);

    final outputBytes = img.encodeJpg(resized, quality: _qualityHigh);
    if (outputBytes.length <= _maxBytesBeforeEncoding) {
      return _write(outputBytes);
    }

    // First pass exceeded limit — retry at lower quality.
    final fallbackBytes = img.encodeJpg(resized, quality: _qualityFallback);
    return _write(fallbackBytes);
  }

  img.Image _resize(img.Image src) {
    final longest = src.width > src.height ? src.width : src.height;
    if (longest <= _maxDimension) return src;

    // Preserve aspect ratio.
    if (src.width >= src.height) {
      return img.copyResize(src, width: _maxDimension);
    } else {
      return img.copyResize(src, height: _maxDimension);
    }
  }

  /// Convenience alias used for attachment uploads (same pipeline as selfie).
  Future<File> compressForUpload(File input) => compress(input);

  Future<File> _write(List<int> bytes) async {
    final tmp = await getTemporaryDirectory();
    final path =
        '${tmp.path}/compressed-${DateTime.now().millisecondsSinceEpoch}.jpg';
    final file = File(path);
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
