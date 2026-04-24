import 'package:flutter/material.dart';

import 'colors.dart';
import 'tokens.dart';
import 'typography.dart';

// Compose the full Material 3 ThemeData from design tokens.
// Dark theme deferred to R2.

ThemeData buildGuHrTheme() {
  const cs = guHrColorScheme;
  final textTheme = buildInterTextTheme();

  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    textTheme: textTheme,
    extensions: const [GuHrColors.light],

    // Cards — xl radius (12px), Level 1 shadow (tint-ink)
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
      ),
      color: Colors.white,
      shadowColor: const Color(0xFF0F4C5C).withValues(alpha: 0.08),
    ),

    // Elevated button — def radius (4px), Deep Teal fill
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GuHrRadii.def),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: GuHrSpacing.gutter,
          vertical: GuHrSpacing.stackMd,
        ),
        textStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),

    // Outlined button — def radius, slate border
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: cs.primary,
        side: BorderSide(color: cs.outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GuHrRadii.def),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: GuHrSpacing.gutter,
          vertical: GuHrSpacing.stackMd,
        ),
      ),
    ),

    // Input fields — 1px #E2E8F0 border, focus: primary 2px glow
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: GuHrSpacing.stackLg,
        vertical: GuHrSpacing.stackMd,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GuHrRadii.def),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GuHrRadii.def),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GuHrRadii.def),
        borderSide: BorderSide(color: cs.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GuHrRadii.def),
        borderSide: BorderSide(color: cs.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GuHrRadii.def),
        borderSide: BorderSide(color: cs.error, width: 2),
      ),
      labelStyle: textTheme.labelSmall?.copyWith(color: cs.onSurfaceVariant),
    ),

    // App bar — surface-container-lowest (white), no elevation line
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFFFFFFF),
      foregroundColor: cs.onSurface,
      elevation: 0,
      scrolledUnderElevation: 1,
      titleTextStyle: textTheme.titleSmall?.copyWith(color: cs.onSurface),
    ),

    // Bottom nav — primary indicator
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFFFFFFF),
      indicatorColor: cs.primaryContainer.withValues(alpha: 0.24),
      labelTextStyle: WidgetStateProperty.all(textTheme.labelSmall),
    ),

    scaffoldBackgroundColor: const Color(0xFFF7F9FB),
    dividerColor: const Color(0xFFE2E8F0),
  );
}
