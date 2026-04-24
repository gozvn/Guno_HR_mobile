#!/usr/bin/env bash
# build_ipa.sh — build a signed iOS IPA for the given environment.
#
# Usage:
#   ./release/scripts/build_ipa.sh [staging|production|dev]
#
# Prerequisites:
#   - Xcode installed with a valid Apple Developer team configured.
#   - Certificates + provisioning profiles in Keychain (or via Xcode auto-signing).
#   - release/ExportOptions.plist filled in (copy from ExportOptions.plist.template).
#   - run `flutterfire configure` first to replace lib/firebase_options.dart.
#
# Output:
#   build/ios/ipa/*.ipa — ready for upload to TestFlight.
#   build/symbols/     — dSYM files for Crashlytics symbolication.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
EXPORT_PLIST="$PROJECT_ROOT/release/ExportOptions.plist"

ENV="${1:-staging}"

case "$ENV" in
  production) API_BASE="https://api.guop.app" ;;
  staging)    API_BASE="https://stg.api.guop.app" ;;
  dev)        API_BASE="https://dev.api.guop.app" ;;
  *)
    echo "ERROR: Unknown env '$ENV'. Use: staging | production | dev" >&2
    exit 1
    ;;
esac

if [[ ! -f "$EXPORT_PLIST" ]]; then
  echo "ERROR: $EXPORT_PLIST not found." >&2
  echo "Copy release/ExportOptions.plist.template → release/ExportOptions.plist and fill in your Team ID." >&2
  exit 1
fi

echo "Building IPA for ENV=$ENV API_BASE=$API_BASE"
cd "$PROJECT_ROOT"

flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs

flutter build ipa \
  --release \
  --obfuscate \
  --split-debug-info=build/symbols \
  --dart-define=API_BASE="$API_BASE" \
  --dart-define=ENV="$ENV" \
  --export-options-plist="$EXPORT_PLIST"

echo ""
echo "IPA built successfully:"
ls -lh build/ios/ipa/*.ipa 2>/dev/null || echo "  (IPA path: build/ios/ipa/)"
echo ""
echo "dSYM symbols saved to: build/symbols/"
echo "Upload symbols to Firebase: firebase crashlytics:symbols:upload --app=<APP_ID> build/symbols/"
