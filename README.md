# GU HR Mobile

Native iOS mobile app cho hệ thống HR của GU — Flutter 3.41.x / Dart 3.11.x.
Phục vụ nhân viên (self-service) và quản lý (approvals/team oversight).

**Status:** Code complete (R1 employee + R2 manager). Pending: Firebase config + Apple Developer signing trước TestFlight.

## Quick start

```bash
# 1. Fetch dependencies
flutter pub get

# 2. Generate code (freezed / riverpod / drift)
dart run build_runner build --delete-conflicting-outputs

# 3. Install iOS pods
cd ios && pod install && cd ..

# 4. Run on simulator
flutter run -d "iPhone 17 Pro" --dart-define=API_BASE=http://localhost:3000

# 5. Verify code
flutter analyze   # must return 0 issues
flutter test      # 164 tests
```

## Running locally

### Prerequisites
- **Xcode 26.3+** with iOS 14.0 SDK
- **CocoaPods 1.16.2+** (`pod --version`)
- **iOS Simulator:** iPhone 17 Pro, iOS 26.3.1 (or later) installed via Xcode
- **API backend:** `http://localhost:3000` running (dev only)

### Simulator setup

**Start simulator:**
```bash
# List available simulators
xcrun simctl list devices available

# Boot iPhone 17 Pro
xcrun simctl boot "iPhone 17 Pro"

# Or use Xcode → Device & Simulators → select simulator → Boot
```

**Set custom location (for GPS testing):**
1. Open iOS Simulator
2. Menu: **Features → Location → Custom Location**
3. Enter lat/lng (e.g., Hà Nội HQ: 21.0285, 105.8542)
4. Leave blank to disable GPS (tests offline flow)

### Run with localhost API

```bash
# Dev environment (http://localhost:3000)
flutter run -d "iPhone 17 Pro" --dart-define=API_BASE=http://localhost:3000

# Staging (requires VPN/firewall access)
flutter run -d "iPhone 17 Pro" --dart-define=API_BASE=https://stg.api.guop.app
```

### Important: HTTP localhost exception (dev only)

ATS (App Transport Security) blocks HTTP in production. Dev environment allows `http://localhost:3000` via Info.plist:

```xml
<!-- ios/Runner/Info.plist -->
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsLocalNetworking</key>
  <true/>
  <key>NSExceptionDomains</key>
  <dict>
    <key>localhost</key>
    <dict>
      <key>NSExceptionAllowsInsecureHTTPLoads</key>
      <true/>
    </dict>
  </dict>
</dict>
```

**⚠️ CRITICAL:** Remove this exception before production build. ATS must be enforced for App Store submission.

## Environment matrix

| Env | API_BASE |
|-----|----------|
| Dev (local) | `http://localhost:3000` |
| Staging | `https://stg.api.guop.app` |
| Prod | `https://api.guop.app` |

Injected via `--dart-define=API_BASE=...`. Never hardcoded. Default: `https://api.guop.app`.

HTTP URL (localhost dev) cần ATS exception — đã config trong `ios/Runner/Info.plist` (`NSExceptionDomains.localhost`).

## Tech stack

| Layer | Choice |
|---|---|
| Framework | Flutter 3.41 / Dart 3.11 |
| State | Riverpod 2.x (code-gen `@riverpod`) |
| HTTP | Dio 5.7 + 4-interceptor chain (auth/refresh/cache/error-mapper) |
| Models | freezed + json_serializable (snake_case via `build.yaml`) |
| Router | go_router 14 (`StatefulShellRoute`) |
| Secure storage | flutter_secure_storage (iOS Keychain) |
| Local DB | drift 2.18 — 2 DBs (attendance, requests) |
| Push | firebase_messaging (gated — placeholder Firebase until `flutterfire configure`) |
| Geolocation | geolocator 12 |
| Camera | camera 0.11 + image 4.2 (compressor) |
| i18n | flutter_localizations (vi/en) |

## Folder structure (feature-first)

```
lib/
├── main.dart                       # Firebase init + runApp
├── firebase_options.dart           # PLACEHOLDER (flutterfire configure replaces)
├── app/                            # Router, theme, root providers
├── core/                           # Dio, errors, storage, utils
├── features/                       # auth / dashboard / profile / company / attendance / leave / requests / manager / notifications
├── instrumentation/                # Crashlytics + Analytics wrappers
└── shared/widgets/                 # skeleton_shimmer, loading_indicator
```

Mỗi feature có `data/` (api, dto, local), `domain/` (models, sealed classes), `presentation/` (pages, widgets), `{feature}_providers.dart`.

## Documentation

Full docs tại [`docs/`](./docs/):

| Doc | Purpose |
|---|---|
| [project-overview-pdr.md](./docs/project-overview-pdr.md) | Product requirements + stakeholders + success metrics |
| [codebase-summary.md](./docs/codebase-summary.md) | Architecture overview + inter-feature dependencies |
| [code-standards.md](./docs/code-standards.md) | Dart conventions, Riverpod patterns, PII redaction rules |
| [system-architecture.md](./docs/system-architecture.md) | Interceptor chain, drift schemas, data flow diagrams |
| [design-guidelines.md](./docs/design-guidelines.md) | Material 3 tokens từ DESIGN.md, Inter typography, spacing |
| [project-roadmap.md](./docs/project-roadmap.md) | Phase status + upcoming milestones |
| [testing-guide.md](./docs/testing-guide.md) | Test matrix + CI setup |
| [backend-deliverables.md](./docs/backend-deliverables.md) | **Backend team TODO list (production blockers)** |
| [push-notifications-setup.md](./docs/push-notifications-setup.md) | Firebase / APNs infrastructure setup |
| [xcode-release-config.md](./docs/xcode-release-config.md) | Xcode signing + capabilities |
| [release-checklist.md](./docs/release-checklist.md) | Pre-release verification gates |
| [app-store-metadata.md](./docs/app-store-metadata.md) | App Store submission assets |

## Scripts

```bash
./scripts/preflight_check.sh       # analyze + test + Info.plist verify
./release/scripts/bump_version.sh  # semver bump
./release/scripts/build_ipa.sh     # obfuscated release build
./release/scripts/upload_testflight.sh
```

## Bundle ID & signing

Placeholder: `app.guop.guHrMobile`. **Action needed trước TestFlight** (xem [xcode-release-config.md](./docs/xcode-release-config.md)):
1. Confirm final Bundle ID với Apple Developer team
2. Register iOS app trong Firebase Console → download `GoogleService-Info.plist`
3. Run `flutterfire configure` để replace placeholder `firebase_options.dart`
4. Upload APNs .p8 key to Firebase Cloud Messaging
5. Configure Xcode signing + capabilities (Push Notifications, Background Modes, Keychain)

## iOS requirements

- Minimum OS: **iOS 14.0** (`camera` + `geolocator` stable)
- Permissions (Info.plist): Location when-in-use, Camera, Photo Library, Remote notifications
- HTTP localhost exception (dev only) — remove trước prod

## Metrics

- **12,934 LOC** hand-authored Dart
- **180+** Dart files
- **164** unit/widget tests pass, **0** analyzer issues
- **11** feature modules
- File size target: **<200 LOC** per file (feature-first modularization)

## Known limitations

- **Refresh token chưa có** — JWT 8h, user re-login sau expiry (backend deliverable)
- **Push notifications chưa wired thật** — chờ Firebase project + backend register-device endpoint
- **R3 Admin/Reports không có** trên mobile — admin tasks dùng hr-web desktop
- **Dark mode defer post-R2**
- **Biometric unlock defer post-R2**

Xem [backend-deliverables.md](./docs/backend-deliverables.md) cho full danh sách backend blockers.
