import 'package:flutter/material.dart';

/// Draws a semi-transparent scrim with an oval cutout to guide face framing.
/// Used as a CustomPainter overlay on the camera preview in SelfieCaptureStep.
class OvalOverlayPainter extends CustomPainter {
  const OvalOverlayPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height * 0.42;
    final rx = size.width * 0.38;
    final ry = size.height * 0.28;
    final oval = Rect.fromCenter(
      center: Offset(cx, cy),
      width: rx * 2,
      height: ry * 2,
    );

    // Punch oval hole in dark scrim using evenOdd fill rule.
    final scrimPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addOval(oval)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(
      scrimPath,
      Paint()..color = Colors.black.withValues(alpha: 0.45),
    );

    // Oval border guide.
    canvas.drawOval(
      oval,
      Paint()
        ..color = Colors.white70
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
