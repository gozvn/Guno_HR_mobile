#!/usr/bin/env bash
# bump_version.sh — increment pubspec.yaml version: X.Y.Z+N
#
# Usage:
#   ./release/scripts/bump_version.sh [patch|minor|major]
#
# Default: patch
# Examples:
#   ./release/scripts/bump_version.sh          → 1.0.0+1 → 1.0.1+2
#   ./release/scripts/bump_version.sh minor    → 1.0.1+2 → 1.1.0+3
#   ./release/scripts/bump_version.sh major    → 1.1.0+3 → 2.0.0+4

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
PUBSPEC="$PROJECT_ROOT/pubspec.yaml"

BUMP="${1:-patch}"

# Read current version line: "version: X.Y.Z+N"
CURRENT=$(grep '^version:' "$PUBSPEC" | awk '{print $2}')
if [[ -z "$CURRENT" ]]; then
  echo "ERROR: Could not parse version from $PUBSPEC" >&2
  exit 1
fi

SEMVER="${CURRENT%%+*}"   # X.Y.Z
BUILD="${CURRENT##*+}"    # N

IFS='.' read -r MAJOR MINOR PATCH <<< "$SEMVER"

case "$BUMP" in
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
    ;;
  patch)
    PATCH=$((PATCH + 1))
    ;;
  *)
    echo "ERROR: Unknown bump type '$BUMP'. Use patch|minor|major." >&2
    exit 1
    ;;
esac

NEW_BUILD=$((BUILD + 1))
NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}+${NEW_BUILD}"

# Replace version line in pubspec.yaml (BSD sed + GNU sed compatible).
if sed --version 2>/dev/null | grep -q GNU; then
  sed -i "s/^version: .*/version: ${NEW_VERSION}/" "$PUBSPEC"
else
  # macOS BSD sed requires backup extension.
  sed -i '' "s/^version: .*/version: ${NEW_VERSION}/" "$PUBSPEC"
fi

echo "Version bumped: $CURRENT → $NEW_VERSION"
echo "Remember to commit: git add pubspec.yaml && git commit -m \"chore: bump version to $NEW_VERSION\""
