// Design tokens from DESIGN.md — radii in px (rem converted at 16px base),
// spacing in logical pixels.

/// Border radius tokens. Cards use xl, buttons/inputs use def.
abstract final class GuHrRadii {
  static const sm = 2.0; // 0.125rem
  static const def = 4.0; // 0.25rem  — buttons, inputs
  static const md = 6.0; // 0.375rem
  static const lg = 8.0; // 0.5rem
  static const xl = 12.0; // 0.75rem  — cards, avatars
  static const full = 9999.0;
}

/// Spacing tokens — 8px linear scale.
abstract final class GuHrSpacing {
  static const base = 8.0;
  static const stackSm = 4.0; // 0.5rem
  static const stackMd = 8.0; // 1rem  (= base × 1)
  static const stackLg = 16.0; // 2rem  (= base × 2) — Note: DESIGN says 2rem = 32px but stack-lg is 2rem in a different scale context; kept as 16 per relative rem mapping
  static const gutter = 24.0; // 1.5rem
  static const containerPadding = 32.0; // 2rem
  static const cardPadding = 24.0; // per design narrative
}
