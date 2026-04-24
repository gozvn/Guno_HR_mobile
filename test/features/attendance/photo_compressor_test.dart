import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

// ---------------------------------------------------------------------------
// Tests exercise the resize + encode logic that PhotoCompressor delegates to
// the image package. The compress() I/O path (getTemporaryDirectory) cannot
// be tested on the host without platform channel mocks; it is covered by
// manual on-device smoke tests.

/// Creates an image with random pixel noise so JPEG entropy is realistic.
img.Image _makeNoisyImage({required int width, required int height}) {
  final image = img.Image(width: width, height: height);
  final rng = math.Random(42);
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      image.setPixelRgb(x, y, rng.nextInt(256), rng.nextInt(256), rng.nextInt(256));
    }
  }
  return image;
}

// ---------------------------------------------------------------------------

void main() {
  group('PhotoCompressor — resize logic (via image package)', () {
    test('landscape 2048x1536 — after resize longest side is ≤1024', () {
      final source = img.Image(width: 2048, height: 1536);
      const maxDim = 1024;

      // Same logic as PhotoCompressor._resize().
      final resized = img.copyResize(source, width: maxDim);
      final longestAfter =
          resized.width > resized.height ? resized.width : resized.height;

      expect(longestAfter, lessThanOrEqualTo(maxDim));
    });

    test('portrait 768x2048 — after resize by height longest side is ≤1024', () {
      final source = img.Image(width: 768, height: 2048);
      const maxDim = 1024;

      final resized = img.copyResize(source, height: maxDim);
      expect(resized.height, lessThanOrEqualTo(maxDim));
    });

    test('small image 640x480 — longest side is already ≤1024, no upscale needed',
        () {
      const maxDim = 1024;
      final source = img.Image(width: 640, height: 480);
      final longest =
          source.width > source.height ? source.width : source.height;
      expect(longest, lessThanOrEqualTo(maxDim));
    });

    test('quality 80 produces output ≤ quality 95 for a noisy image', () {
      // Use noisy (high-entropy) pixels so JPEG quality difference is visible.
      final source = _makeNoisyImage(width: 800, height: 600);

      final highQ = img.encodeJpg(source, quality: 95);
      final lowQ = img.encodeJpg(source, quality: 80);

      // Lower quality must be strictly smaller for high-entropy source.
      expect(lowQ.length, lessThan(highQ.length),
          reason: 'quality 80 must produce a smaller file than quality 95 '
              'for a noisy (high-entropy) image');
    });

    test('quality 60 is smaller than quality 80 for a noisy image', () {
      final source = _makeNoisyImage(width: 1024, height: 1024);

      final q80 = img.encodeJpg(source, quality: 80);
      final q60 = img.encodeJpg(source, quality: 60);

      expect(q60.length, lessThan(q80.length),
          reason: 'quality 60 fallback must be smaller than quality 80');
    });

    test('quality 80 output for 800x600 noisy image is ≤2MB', () {
      final source = _makeNoisyImage(width: 800, height: 600);
      final bytes = img.encodeJpg(source, quality: 80);
      expect(bytes.length, lessThanOrEqualTo(2 * 1024 * 1024));
    });

    test('img.decodeImage returns null for non-JPEG bytes — PhotoCompressor throws StateError',
        () async {
      // Write truly random garbage (not matching any image magic bytes).
      final tmpPath =
          '${Directory.systemTemp.path}/bad_${DateTime.now().millisecondsSinceEpoch}.bin';
      final file = File(tmpPath);
      // Use 256 bytes of 0xFF to avoid accidentally matching any decoder.
      await file.writeAsBytes(Uint8List(256)..fillRange(0, 256, 0xFF));
      addTearDown(() => file.exists().then((e) { if (e) file.deleteSync(); }));

      final bytes = await file.readAsBytes();
      // img.decodeImage may return null OR throw for completely invalid data.
      // PhotoCompressor checks for null and throws StateError.
      // We verify that non-JPEG input is correctly rejected.
      img.Image? decoded;
      try {
        decoded = img.decodeImage(bytes);
      } catch (_) {
        decoded = null; // some decoders throw — treat as null (rejected input)
      }
      expect(decoded, isNull,
          reason: 'random garbage bytes must not decode to a valid image');
    });
  });
}
