#!/usr/bin/env bash
# upload_testflight.sh — upload IPA to TestFlight via App Store Connect API.
#
# Usage:
#   ./release/scripts/upload_testflight.sh [path/to/app.ipa]
#
# Required environment variables:
#   APP_STORE_API_KEY_ID      — Key ID from App Store Connect → Users & Access → Keys
#   APP_STORE_API_ISSUER_ID   — Issuer ID from the same page
#   APP_STORE_API_KEY_PATH    — Path to downloaded .p8 private key file
#
# Optional:
#   IPA_PATH — override IPA file path (default: auto-detect build/ios/ipa/*.ipa)
#
# Alternative (recommended): use Fastlane pilot for richer retry/changelog support.
#   fastlane pilot upload --ipa build/ios/ipa/*.ipa
#   See: https://docs.fastlane.tools/actions/pilot/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Resolve IPA path.
IPA_PATH="${1:-}"
if [[ -z "$IPA_PATH" ]]; then
  IPA_PATH="$(find "$PROJECT_ROOT/build/ios/ipa" -name '*.ipa' | head -1)"
fi

if [[ -z "$IPA_PATH" || ! -f "$IPA_PATH" ]]; then
  echo "ERROR: IPA not found. Run build_ipa.sh first, or pass path as argument." >&2
  exit 1
fi

# Validate required env vars.
: "${APP_STORE_API_KEY_ID:?Set APP_STORE_API_KEY_ID}"
: "${APP_STORE_API_ISSUER_ID:?Set APP_STORE_API_ISSUER_ID}"
: "${APP_STORE_API_KEY_PATH:?Set APP_STORE_API_KEY_PATH}"

echo "Uploading: $IPA_PATH"
echo "Key ID:    $APP_STORE_API_KEY_ID"
echo "Issuer:    $APP_STORE_API_ISSUER_ID"

xcrun altool \
  --upload-app \
  --type ios \
  --file "$IPA_PATH" \
  --apiKey "$APP_STORE_API_KEY_ID" \
  --apiIssuer "$APP_STORE_API_ISSUER_ID" \
  --verbose

echo ""
echo "Upload complete. Check TestFlight in App Store Connect (~10 min processing)."
echo "https://appstoreconnect.apple.com/apps"
