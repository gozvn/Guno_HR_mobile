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

    // Cards — xl radius (12px), brand-tinted soft shadow.
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GuHrRadii.xl),
      ),
      color: Colors.white,
      shadowColor: cs.primary.withValues(alpha: 0.08),
    ),

    // Filled button (primary action) — brand orange fill.
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
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

    // Elevated button — same brand fill as Filled (def radius 4px).
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

    // Outlined button — brand-coloured text + neutral border.
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

    // Text button — brand-coloured label.
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: cs.primary),
    ),

    // FAB — brand fill.
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: cs.primary,
      foregroundColor: cs.onPrimary,
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

    scaffoldBackgroundColor: cs.surface,
    dividerColor: cs.outlineVariant,
  );
}
