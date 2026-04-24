import 'package:flutter/material.dart';

// Full M3 color scheme + extension for design tokens not in stock ColorScheme.
// Tokens sourced 1:1 from DESIGN.md YAML.

const _primary = Color(0xFF003441);
const _onPrimary = Color(0xFFFFFFFF);
const _primaryContainer = Color(0xFF0F4C5C);
const _onPrimaryContainer = Color(0xFF87BBCE);
const _inversePrimary = Color(0xFF9ACEE1);

const _secondary = Color(0xFF505F76);
const _onSecondary = Color(0xFFFFFFFF);
const _secondaryContainer = Color(0xFFD0E1FB);
const _onSecondaryContainer = Color(0xFF54647A);

const _tertiary = Color(0xFF003723);
const _onTertiary = Color(0xFFFFFFFF);
const _tertiaryContainer = Color(0xFF005035);
const _onTertiaryContainer = Color(0xFF33CA91);

const _error = Color(0xFFBA1A1A);
const _onError = Color(0xFFFFFFFF);
const _errorContainer = Color(0xFFFFDAD6);
const _onErrorContainer = Color(0xFF93000A);

const _surface = Color(0xFFF7F9FB);
const _onSurface = Color(0xFF191C1E);
const _onSurfaceVariant = Color(0xFF40484B);
const _inverseSurface = Color(0xFF2D3133);
const _outline = Color(0xFF70787C);
const _outlineVariant = Color(0xFFC0C8CB);
const _surfaceTint = Color(0xFF306576);

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
  surfaceContainerLow: Color(0xFFF2F4F6),
  surfaceContainer: Color(0xFFECEEF0),
  surfaceContainerHigh: Color(0xFFE6E8EA),
  surfaceContainerHighest: Color(0xFFE0E3E5),
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
    surfaceDim: Color(0xFFD8DADC),
    surfaceBright: Color(0xFFF7F9FB),
    primaryFixed: Color(0xFFB6EBFE),
    primaryFixedDim: Color(0xFF9ACEE1),
    onPrimaryFixed: Color(0xFF001F28),
    onPrimaryFixedVariant: Color(0xFF114D5D),
    secondaryFixed: Color(0xFFD3E4FE),
    secondaryFixedDim: Color(0xFFB7C8E1),
    onSecondaryFixed: Color(0xFF0B1C30),
    onSecondaryFixedVariant: Color(0xFF38485D),
    tertiaryFixed: Color(0xFF6FFBBE),
    tertiaryFixedDim: Color(0xFF4EDEA3),
    onTertiaryFixed: Color(0xFF002113),
    onTertiaryFixedVariant: Color(0xFF005236),
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
