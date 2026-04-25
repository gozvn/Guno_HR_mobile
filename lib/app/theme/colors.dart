import 'package:flutter/material.dart';

// Full M3 color scheme + extension for design tokens not in stock ColorScheme.
// Primary tone shared with hr-web brand (`#e8642c` orange, light `#f0845a`,
// dark `#c94d1a`) so the mobile app reads as the same product. Secondary +
// tertiary kept as neutral / positive accents.

const _primary = Color(0xFFE8642C); // hr-web brand DEFAULT
const _onPrimary = Color(0xFFFFFFFF);
const _primaryContainer = Color(0xFFFFDBCB);
const _onPrimaryContainer = Color(0xFF381000);
const _inversePrimary = Color(0xFFFFB59A);

const _secondary = Color(0xFF77564A);
const _onSecondary = Color(0xFFFFFFFF);
const _secondaryContainer = Color(0xFFFFDBCB);
const _onSecondaryContainer = Color(0xFF2C150B);

const _tertiary = Color(0xFF006D44);
const _onTertiary = Color(0xFFFFFFFF);
const _tertiaryContainer = Color(0xFF8FF7BD);
const _onTertiaryContainer = Color(0xFF002112);

const _error = Color(0xFFBA1A1A);
const _onError = Color(0xFFFFFFFF);
const _errorContainer = Color(0xFFFFDAD6);
const _onErrorContainer = Color(0xFF93000A);

const _surface = Color(0xFFFFFBFA);
const _onSurface = Color(0xFF1F1B19);
const _onSurfaceVariant = Color(0xFF5A4439);
const _inverseSurface = Color(0xFF35302D);
const _outline = Color(0xFF8C7367);
const _outlineVariant = Color(0xFFDFC2B5);
const _surfaceTint = Color(0xFFE8642C);

/// M3 ColorScheme from DESIGN.md tokens.
const guHrColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _primary,
  onPrimary: _onPrimary,
  primaryContainer: _primaryContainer,
  onPrimaryContainer: _onPrimaryContainer,
  inversePrimary: _inversePrimary,
  secondary: _secondary,
  onSecondary: _onSecondary,
  secondaryContainer: _secondaryContainer,
  onSecondaryContainer: _onSecondaryContainer,
  tertiary: _tertiary,
  onTertiary: _onTertiary,
  tertiaryContainer: _tertiaryContainer,
  onTertiaryContainer: _onTertiaryContainer,
  error: _error,
  onError: _onError,
  errorContainer: _errorContainer,
  onErrorContainer: _onErrorContainer,
  surface: _surface,
  onSurface: _onSurface,
  onSurfaceVariant: _onSurfaceVariant,
  inverseSurface: _inverseSurface,
  outline: _outline,
  outlineVariant: _outlineVariant,
  surfaceTint: _surfaceTint,
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFFAF3EF),
  surfaceContainer: Color(0xFFF4ECE7),
  surfaceContainerHigh: Color(0xFFEEE5DF),
  surfaceContainerHighest: Color(0xFFE7DDD5),
);

/// Extra design tokens not covered by stock M3 ColorScheme (fixed/dim roles,
/// surface-dim/bright).
class GuHrColors extends ThemeExtension<GuHrColors> {
  const GuHrColors({
    required this.surfaceDim,
    required this.surfaceBright,
    required this.primaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixed,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixed,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixed,
    required this.onTertiaryFixedVariant,
  });

  final Color surfaceDim;
  final Color surfaceBright;
  final Color primaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixed;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixed;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixed;
  final Color onTertiaryFixedVariant;

  static const light = GuHrColors(
    surfaceDim: Color(0xFFE7DDD5),
    surfaceBright: Color(0xFFFFFBFA),
    primaryFixed: Color(0xFFFFDBCB),
    primaryFixedDim: Color(0xFFF0845A), // hr-web brand.light
    onPrimaryFixed: Color(0xFF381000),
    onPrimaryFixedVariant: Color(0xFFC94D1A), // hr-web brand.dark
    secondaryFixed: Color(0xFFFFDBCB),
    secondaryFixedDim: Color(0xFFE6BBA9),
    onSecondaryFixed: Color(0xFF2C150B),
    onSecondaryFixedVariant: Color(0xFF5C4034),
    tertiaryFixed: Color(0xFF8FF7BD),
    tertiaryFixedDim: Color(0xFF73DAA2),
    onTertiaryFixed: Color(0xFF002112),
    onTertiaryFixedVariant: Color(0xFF005233),
  );

  @override
  GuHrColors copyWith({
    Color? surfaceDim,
    Color? surfaceBright,
    Color? primaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixed,
    Color? onPrimaryFixedVariant,
    Color? secondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixed,
    Color? onSecondaryFixedVariant,
    Color? tertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixed,
    Color? onTertiaryFixedVariant,
  }) {
    return GuHrColors(
      surfaceDim: surfaceDim ?? this.surfaceDim,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      primaryFixed: primaryFixed ?? this.primaryFixed,
      primaryFixedDim: primaryFixedDim ?? this.primaryFixedDim,
      onPrimaryFixed: onPrimaryFixed ?? this.onPrimaryFixed,
      onPrimaryFixedVariant:
          onPrimaryFixedVariant ?? this.onPrimaryFixedVariant,
      secondaryFixed: secondaryFixed ?? this.secondaryFixed,
      secondaryFixedDim: secondaryFixedDim ?? this.secondaryFixedDim,
      onSecondaryFixed: onSecondaryFixed ?? this.onSecondaryFixed,
      onSecondaryFixedVariant:
          onSecondaryFixedVariant ?? this.onSecondaryFixedVariant,
      tertiaryFixed: tertiaryFixed ?? this.tertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim ?? this.tertiaryFixedDim,
      onTertiaryFixed: onTertiaryFixed ?? this.onTertiaryFixed,
      onTertiaryFixedVariant:
          onTertiaryFixedVariant ?? this.onTertiaryFixedVariant,
    );
  }

  @override
  GuHrColors lerp(GuHrColors? other, double t) {
    if (other == null) return this;
    return GuHrColors(
      surfaceDim: Color.lerp(surfaceDim, other.surfaceDim, t)!,
      surfaceBright: Color.lerp(surfaceBright, other.surfaceBright, t)!,
      primaryFixed: Color.lerp(primaryFixed, other.primaryFixed, t)!,
      primaryFixedDim: Color.lerp(primaryFixedDim, other.primaryFixedDim, t)!,
      onPrimaryFixed: Color.lerp(onPrimaryFixed, other.onPrimaryFixed, t)!,
      onPrimaryFixedVariant:
          Color.lerp(onPrimaryFixedVariant, other.onPrimaryFixedVariant, t)!,
      secondaryFixed: Color.lerp(secondaryFixed, other.secondaryFixed, t)!,
      secondaryFixedDim:
          Color.lerp(secondaryFixedDim, other.secondaryFixedDim, t)!,
      onSecondaryFixed:
          Color.lerp(onSecondaryFixed, other.onSecondaryFixed, t)!,
      onSecondaryFixedVariant: Color.lerp(
          onSecondaryFixedVariant, other.onSecondaryFixedVariant, t)!,
      tertiaryFixed: Color.lerp(tertiaryFixed, other.tertiaryFixed, t)!,
      tertiaryFixedDim:
          Color.lerp(tertiaryFixedDim, other.tertiaryFixedDim, t)!,
      onTertiaryFixed: Color.lerp(onTertiaryFixed, other.onTertiaryFixed, t)!,
      onTertiaryFixedVariant: Color.lerp(
          onTertiaryFixedVariant, other.onTertiaryFixedVariant, t)!,
    );
  }
}
