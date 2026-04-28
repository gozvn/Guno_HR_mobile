# Android Release Configuration — GU HR Mobile

Companion to `xcode-release-config.md`. Android build setup, signing, and Play Store preparation.

**Last Updated:** 2026-04-28  
**Status:** R1 + R2 code-complete; APK release-ready; Play Store submission deferred to Phase R3

---

## Build Configuration

**File:** `android/app/build.gradle.kts`

```kotlin
android {
  namespace = "app.guop.guHrMobile"       // Must match iOS Bundle ID for cross-platform consistency
  compileSdk = 36                         // API 35+ required by camera, core 1.18+ plugins
  
  defaultConfig {
    applicationId = "app.guop.guHrMobile"
    minSdk = 24                           // Android 7+ (covers 95%+ VN market)
    targetSdk = 34                        // Android 14 stable
    versionCode = 1                       // Increment per release
    versionName = "1.0.0"                 // Sync with pubspec.yaml
    multiDexEnabled = true
  }
}

compileOptions {
  isCoreLibraryDesugaringEnabled = true  // Java 8+ time API on API <26
}

dependencies {
  coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
```

---

## Network Security Configuration

**File:** `android/app/src/main/res/xml/network_security_config.xml`

Whitelist cleartext HTTP for dev hosts only; production always uses HTTPS.

```xml
<network-security-config>
  <domain-config cleartextTrafficPermitted="true">
    <domain includeSubdomains="true">10.0.3.2</domain>    <!-- Genymotion alias -->
    <domain includeSubdomains="true">10.0.2.2</domain>    <!-- Android Studio AVD alias -->
    <domain includeSubdomains="true">localhost</domain>
    <domain includeSubdomains="true">127.0.0.1</domain>
  </domain-config>
</network-security-config>
```

**Verification:** Prod builds must NOT override this; cleartext block prevents accidental http in production.

---

## Permissions & Capabilities

**File:** `android/app/src/main/AndroidManifest.xml`

| Feature | Permissions | Purpose |
|---------|-----------|---------|
| Check-in GPS | `ACCESS_FINE_LOCATION`, `ACCESS_COARSE_LOCATION` | GPS coordinates for radius check |
| Selfie capture | `CAMERA` | On-device image capture |
| Attachments | `READ_MEDIA_IMAGES`, `READ_EXTERNAL_STORAGE` (API ≤32) | Photo picker for leave request evidence |
| Push notifications | (handled by Firebase) | FCM token + message handling |
| Biometric quick-unlock | `USE_BIOMETRIC`, `USE_FINGERPRINT` | Fingerprint/face unlock (phase R3 planned) |

**Requesting Permissions at Runtime:**
- `geolocator` plugin: requests `ACCESS_FINE_LOCATION` + `ACCESS_COARSE_LOCATION` on first check-in
- `camera` plugin: requests `CAMERA` on check-in flow init
- `image_picker` plugin: requests `READ_MEDIA_IMAGES` + `READ_EXTERNAL_STORAGE` on attachment tap

---

## Signing & Release Builds

### Development / Debug

**Default signing:**
```bash
# Auto-signed with debug keystore (generated on first build)
flutter run -d emulator

# Or explicit debug build:
flutter build apk --debug
```

**Debug keystore location:** `~/.android/debug.keystore` (default)

### Release (Internal Distribution)

**Split-per-ABI (3 APKs, optimized size):**
```bash
flutter build apk --release --split-per-abi
# Output:
#   app-armeabi-v7a-release.apk   (~23.9 MB)
#   app-arm64-v8a-release.apk     (~25.8 MB)
#   app-x86_64-release.apk        (~27.2 MB)
```

**Universal APK (single binary, larger):**
```bash
flutter build apk --release
# Output: app-release.apk (~30 MB)
```

**Sign with debug keystore (internal only):**
```bash
# Dart/Flutter auto-signs release APK with debug keystore
# For production, create release keystore (see below)
```

**Installing on device:**
```bash
adb install app-release.apk
adb shell am start -n app.guop.guHrMobile/app.guop.guHrMobile.MainActivity
```

### Production (Play Store)

**Step 1: Create release keystore (one-time)**

```bash
keytool -genkey -v -keystore ~/gu_hr_release.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias gu_hr_prod \
  -storepass <PASSWORD> -keypass <PASSWORD>
# Prompts for:
#   CN=GU Online (your organization)
#   OU=Engineering
#   O=GU Online Co.
#   L=Hanoi
#   ST=Hanoi
#   C=VN
```

**Step 2: Configure signing in `android/app/build.gradle.kts`**

```kotlin
android {
  signingConfigs {
    create("release") {
      keyAlias = "gu_hr_prod"
      keyPassword = System.getenv("ANDROID_KEY_PASSWORD")
      storeFile = file(System.getenv("ANDROID_KEYSTORE_PATH") ?: "~/gu_hr_release.jks")
      storePassword = System.getenv("ANDROID_KEYSTORE_PASSWORD")
    }
  }
  
  buildTypes {
    release {
      signingConfig = signingConfigs.getByName("release")
    }
  }
}
```

**Step 3: Build signed AAB for Play Store**

```bash
export ANDROID_KEYSTORE_PATH=~/gu_hr_release.jks
export ANDROID_KEYSTORE_PASSWORD=<PASSWORD>
export ANDROID_KEY_PASSWORD=<PASSWORD>

flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

**Step 4: Upload to Play Console**

1. Create app record in [Google Play Console](https://play.google.com/console/)
2. Internal testing track → Upload AAB
3. Add Play App Signing (Play Console manages production key)
4. Proceed to closed beta after 3-day testing window

---

## Development Build Variants

### Genymotion Emulator (Recommended for dev)

**Download:** https://www.genymotion.com/download/

**Setup:**
```bash
# Launch Genymotion UI → select Pixel 4 API 30 (arm64-v8a)
# Or CLI:
genymotion_shell.exe devices start "Pixel 4 - 11.0"
```

**Network from Genymotion to dev backend:**
- Host Mac IP: `10.0.3.2` (Genymotion magic alias)
- Default Flutter env: `API_BASE=http://10.0.3.2:3000`

**Run:**
```bash
flutter devices  # Should list Genymotion device
flutter run -d <genymotion-device-name>
```

### Android Studio AVD (Free alternative)

**Setup:**
```bash
# Android Studio → Tools → Device Manager → Create Device
# Select Pixel 4, API 30, arm64-v8a
```

**Network to dev backend:**
- Host Mac IP alias: `10.0.2.2`
- Override Flutter env: `--dart-define=API_BASE=http://10.0.2.2:3000`

**Run:**
```bash
flutter run -d emulator --dart-define=API_BASE=http://10.0.2.2:3000
```

### Production Backend Access

```bash
# Prod domain is public HTTPS (no emulator workarounds needed)
flutter run --release --dart-define=API_BASE=https://api.guop.app
```

---

## Asset Generation

### App Icon

**Source:** `assets/icon/app_icon_1024.png` (1024×1024 PNG, no alpha)

**Generate via `flutter_launcher_icons`:**

```bash
# pubspec.yaml:
flutter_launcher_icons:
  android: true
  image_path: assets/icon/app_icon_1024.png

# Run:
dart run flutter_launcher_icons:main
# Generates 5 densities in android/app/src/main/res/:
#   mipmap-ldpi/, mipmap-mdpi/, mipmap-hdpi/, mipmap-xhdpi/, mipmap-xxhdpi/
```

### Splash Screen

**Generate via `flutter_native_splash`:**

```bash
# pubspec.yaml:
flutter_native_splash:
  background_image: assets/splash.png
  android: true

# Run:
dart run flutter_native_splash:create
```

---

## Testing on Physical Device

### Prerequisites

1. **Enable Developer Mode:** Settings → About phone → Build number (tap 7x) → Developer Options
2. **Enable USB Debugging:** Developer Options → USB Debugging ✓
3. **Trust USB Certificate:** Plug into Mac → Tap "Allow" on phone
4. **ADB Recognition:**
   ```bash
   adb devices  # Should list phone serial number
   ```

### Install & Run

```bash
# Debug build:
flutter run -d <device-serial>

# Release build:
flutter build apk --release --split-per-abi
adb install build/app/outputs/flutter-apk/app-arm64-v8a-release.apk

# Start app:
adb shell am start -n app.guop.guHrMobile/app.guop.guHrMobile.MainActivity
```

### GPS Testing on Physical Device

- Check-in uses real GPS (not mocked)
- If indoors, location may take 30s+ to acquire
- Test in open-air environment (parking lot, outdoor walkway)
- Once acquired, Haversine distance calculated correctly

---

## Deferred (Phase R3)

- **Google Maps integration** — current Android fallback is text display only (Haversine distance card)
  - Option A: `google_maps_flutter` (requires API key + billing)
  - Option B: `flutter_map` (OSM, open-source)
- **Biometric quick-unlock** — auth flow currently password-only
- **Play Billing Library** — defer until in-app purchases needed (R3+)
- **WorkManager** — periodic sync of pending check-ins (currently manual retry on resume)

---

## Troubleshooting

| Issue | Cause | Fix |
|-------|-------|-----|
| `java.lang.UnsupportedOperationException: Unknown element: <vector-drawable>` | Gradle < 4.0 | Update `gradle.properties`: `android.useAndroidX=true` |
| `INSTALL_FAILED_NO_MATCHING_ABIS` | APK arch mismatch (e.g. x86_64 device, armeabi-v7a APK) | Use `--split-per-abi` or match arch |
| GPS never acquires | `ACCESS_FINE_LOCATION` not granted at runtime | Tap location prompt when check-in flow opens; allow |
| Network times out (dev) | Wrong dev host alias | iOS: `localhost:3000`, Android: `10.0.3.2:3000` |
| Selfie upload fails | `CAMERA` not granted | Grant at runtime; re-open check-in flow |
| Firebase not initialized | `firebase_options.dart` is placeholder | Run `flutterfire configure` (deferred to R3) |

---

## Release Checklist (Android-specific)

See `release-checklist.md` → "Android Build" section for full pre-release verification.

**Quick summary:**
- [ ] Bundle ID = `app.guop.guHrMobile` ✓
- [ ] Permissions declared + requested at runtime ✓
- [ ] Network security config (dev hosts only) ✓
- [ ] Icons generated, 5 densities present ✓
- [ ] Build modes tested (debug, release APK, release AAB)
- [ ] Emulator test (Genymotion Pixel API 30 arm64-v8a) ✓
- [ ] Smoke test on physical device (or skip if unavailable)
- [ ] No hardcoded secrets in source or resources ✓
- [ ] Ready for Play Console upload (AAB format) ✓
