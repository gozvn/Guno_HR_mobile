#!/usr/bin/env bash
# preflight_check.sh — run all gates before submitting a release build.
#
# Usage:
#   ./scripts/preflight_check.sh
#
# Exit codes:
#   0 — all checks passed
#   1 — one or more checks failed

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"

PASS=0
FAIL=0

_ok()   { echo "  [PASS] $1"; PASS=$((PASS + 1)); }
_fail() { echo "  [FAIL] $1"; FAIL=$((FAIL + 1)); }
_step() { echo ""; echo "==> $1"; }

# ---------------------------------------------------------------------------
_step "flutter analyze"
if flutter analyze --no-pub 2>&1 | grep -q "No issues found"; then
  _ok "flutter analyze — 0 issues"
else
  _fail "flutter analyze — issues found (run: flutter analyze)"
fi

# ---------------------------------------------------------------------------
_step "flutter test"
if flutter test --no-pub 2>&1 | tail -5 | grep -q "All tests passed"; then
  _ok "flutter test — all tests pass"
else
  _fail "flutter test — some tests failed"
fi

# ---------------------------------------------------------------------------
_step "build_runner — no stale generated files"
if dart run build_runner build --delete-conflicting-outputs 2>&1 | grep -q "Succeeded"; then
  _ok "build_runner — generated files up to date"
else
  _fail "build_runner — generation failed or conflicts"
fi

# ---------------------------------------------------------------------------
_step "iOS Info.plist permission strings"
INFO_PLIST="$PROJECT_ROOT/ios/Runner/Info.plist"

if grep -q "NSLocationWhenInUseUsageDescription" "$INFO_PLIST"; then
  _ok "Info.plist — NSLocationWhenInUseUsageDescription present"
else
  _fail "Info.plist — missing NSLocationWhenInUseUsageDescription"
fi

if grep -q "NSCameraUsageDescription" "$INFO_PLIST"; then
  _ok "Info.plist — NSCameraUsageDescription present"
else
  _fail "Info.plist — missing NSCameraUsageDescription"
fi

if grep -q "UIBackgroundModes" "$INFO_PLIST"; then
  _ok "Info.plist — UIBackgroundModes present (push notifications)"
else
  _fail "Info.plist — missing UIBackgroundModes"
fi

# ---------------------------------------------------------------------------
_step "Firebase options — placeholder check"
FIREBASE_OPTS="$PROJECT_ROOT/lib/firebase_options.dart"
if grep -q "PLACEHOLDER" "$FIREBASE_OPTS"; then
  _fail "firebase_options.dart — still contains placeholder values. Run: flutterfire configure"
else
  _ok "firebase_options.dart — real values present"
fi

# ---------------------------------------------------------------------------
_step "ExportOptions.plist — configured"
EXPORT_PLIST="$PROJECT_ROOT/release/ExportOptions.plist"
if [[ ! -f "$EXPORT_PLIST" ]]; then
  _fail "release/ExportOptions.plist — not found (copy from .template)"
elif grep -q "YOUR_TEAM_ID_HERE" "$EXPORT_PLIST"; then
  _fail "release/ExportOptions.plist — Team ID not filled in"
else
  _ok "release/ExportOptions.plist — configured"
fi

# ---------------------------------------------------------------------------
echo ""
echo "================================================"
echo "  Preflight result: $PASS passed, $FAIL failed"
echo "================================================"

if [[ "$FAIL" -gt 0 ]]; then
  exit 1
fi

echo ""
echo "All preflight checks passed. Ready to run build_ipa.sh."
