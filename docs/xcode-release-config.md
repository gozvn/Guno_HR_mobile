# Xcode Release Configuration Checklist

Steps to configure Xcode for App Store / TestFlight distribution.
**Requires:** Apple Developer Program membership + Xcode installed.

## 1. Bundle Identifier

- Open `ios/Runner.xcodeproj` in Xcode
- Select **Runner** target → **General** tab
- Set **Bundle Identifier:** `app.guop.guHrMobile`
- Verify same bundle ID in:
  - Firebase Console → iOS app registration
  - App Store Connect → App record
  - Provisioning profile

## 2. Team & Signing

- **Signing & Capabilities** tab → **Team:** select your Apple Developer team
- **Automatically manage signing:** ON (recommended for first build)
- Xcode will generate provisioning profiles automatically
- For CI/CD: use **manual signing** with downloaded certificates + profiles

## 3. Capabilities

Add the following capabilities (click **+ Capability**):

| Capability | Required For |
|------------|-------------|
| **Push Notifications** | FCM / APNs delivery |
| **Background Modes** → Remote notifications | Background push handling |
| **Keychain Sharing** | flutter_secure_storage JWT storage |

## 4. Version & Build Number

- **General** tab → **Version:** matches `pubspec.yaml` marketing version (e.g. `1.0.0`)
- **Build:** auto-incremented by `bump_version.sh` or Fastlane
- For Fastlane: add to `Fastfile`:
  ```ruby
  increment_build_number(build_number: number_of_commits)
  ```

## 5. ExportOptions.plist

Copy template and fill in Team ID:
```bash
cp release/ExportOptions.plist.template release/ExportOptions.plist
# Edit release/ExportOptions.plist → replace YOUR_TEAM_ID_HERE
```

Do NOT commit `release/ExportOptions.plist` if it contains secrets (add to `.gitignore`).

## 6. App Icons

- Source: 1024×1024 PNG, no alpha channel, no rounded corners (Apple rounds them)
- Place in: `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- Use a tool like [IconKitchen](https://icon.kitchen) or `flutter_launcher_icons` package to generate all sizes

```yaml
# Add to pubspec.yaml dev_dependencies (optional):
flutter_launcher_icons: ^0.14.1

flutter_icons:
  ios: true
  image_path: "assets/app_icon_1024.png"
```

Then run: `dart run flutter_launcher_icons`

## 7. Launch Screen

- `ios/Runner/Base.lproj/LaunchScreen.storyboard` — already configured from project setup
- Test on: iPhone SE (small), iPhone 14 Pro, iPhone 15 Pro Max
- Verify no clipping on notch or Dynamic Island models

## 8. Info.plist — Required Strings

Verify these are present in `ios/Runner/Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>GU HR cần GPS để xác minh vị trí chấm công tại văn phòng.</string>

<key>NSCameraUsageDescription</key>
<string>GU HR cần camera để chụp ảnh selfie khi chấm công.</string>

<key>NSPhotoLibraryUsageDescription</key>
<string>GU HR cần truy cập ảnh để đính kèm vào đơn nhân sự.</string>

<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>remote-notification</string>
</array>
```

## 9. Build Archive for TestFlight

```bash
# Option A: Script (requires Xcode + signing configured)
./release/scripts/build_ipa.sh staging

# Option B: Manual via Xcode
# Product → Archive → Distribute App → App Store Connect → Upload
```

**For developer debug on physical iPhone (free Apple ID):** See `docs/release-checklist.md` → Appendix: Real-Device Debug Install. No archive/distribution needed; use `flutter run -d <udid> --release` for fast iteration.

## 10. APNs Configuration

1. Apple Developer Portal → Certificates, Identifiers & Profiles → **Keys**
2. Create key with **APNs** capability → download `.p8` file
3. Upload to Firebase Console → Project Settings → Cloud Messaging → APNs Authentication Key
4. Note: APNs key works for both sandbox (dev) + production — no separate certs needed

## Fastlane (Optional — Recommended for Team)

```bash
# Install
gem install fastlane

# Initialize in project root
fastlane init

# Example Fastfile lanes:
# fastlane beta → build + upload to TestFlight
# fastlane release → submit to App Store
```

Reference: https://docs.fastlane.tools/getting-started/ios/
