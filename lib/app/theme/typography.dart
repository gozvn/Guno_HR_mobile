import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Inter text theme mapped from DESIGN.md typography tokens.
// Weights used: 400 (regular), 600 (semiBold), 700 (bold).

// Emoji fallback fonts — Inter has no emoji glyphs, so without this
// emoji codepoints (icon, status chips, etc.) render as tofu placeholders
// on iOS. Listed in platform priority order.
const _emojiFallback = <String>[
  'Apple Color Emoji', // iOS / macOS
  'Noto Color Emoji', // Android / Linux
  'Segoe UI Emoji', // Windows
];

TextTheme buildInterTextTheme() {
  TextStyle withEmoji(TextStyle s) =>
      s.copyWith(fontFamilyFallback: _emojiFallback);

  return TextTheme(
    // display-lg: 36/700/-0.02em
    displayLarge: withEmoji(GoogleFonts.inter(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 44 / 36,
      letterSpacing: 36 * -0.02,
    )),
    // headline-md: 24/600/-0.01em
    headlineMedium: withEmoji(GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      letterSpacing: 24 * -0.01,
    )),
    // title-sm: 18/600
    titleSmall: withEmoji(GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 24 / 18,
    )),
    // body-md: 16/400
    bodyLarge: withEmoji(GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
    )),
    // body-sm: 14/400
    bodyMedium: withEmoji(GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
    )),
    // label-caps: 12/600/0.05em uppercase — applied via TextStyle directly at callsite
    labelSmall: withEmoji(GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 16 / 12,
      letterSpacing: 12 * 0.05,
    )),
  );
}
