# Release Checklist — GU HR Mobile

Pre-release verification steps. Complete all items before each TestFlight or App Store submission.

## Backend Blockers (must be resolved by backend team)

- [ ] POST `/api/hr/auth/refresh` — refresh token endpoint live
- [ ] DELETE `/api/hr/auth/logout` — server-side token revocation
- [ ] POST `/api/hr/notifications/register-device` — FCM token registration
- [ ] DELETE `/api/hr/notifications/register-device` — token deregistration on logout
- [ ] Timezone documented: server stores attendance timestamps in which tz? (UTC recommended)
- [ ] Rate limiting implemented: POST /mobile-checkin ≤ 10 req/min/user
- [ ] `X-Idempotency-Key` header accepted for check-in (or UUID-in-note confirmed sufficient)
- [ ] GPS radius threshold documented for each office location
- [ ] `attachment_urls` array format for POST /requests confirmed

## Code Quality

- [ ] `flutter analyze` → 0 issues
- [ ] `flutter test` → all tests pass
- [ ] `dart run build_runner build --delete-conflicting-outputs` → no conflicts
- [ ] No hardcoded credentials, API keys, or secrets in source

## iOS Build

- [ ] Bundle ID confirmed: `app.guop.guHrMobile` (match across Xcode + Firebase + provisioning profile)
- [ ] Version + build number bumped (`./release/scripts/bump_version.sh`)
- [ ] `release/ExportOptions.plist` configured with correct Team ID
- [ ] Signing: Automatic signing enabled in Xcode with correct team
- [ ] Capabilities: Push Notifications ✓ / Background Modes (remote-notification) ✓ / Keychain ✓
- [ ] App Icon 1024×1024 PNG (no alpha) uploaded in Runner/Assets.xcassets/AppIcon
- [ ] Launch Screen storyboard renders correctly on iPhone 14 Pro + 15 Pro simulator

## Firebase

- [ ] `flutterfire configure` run → real `firebase_options.dart` (not placeholder)
- [ ] Crashlytics: send a test crash in Release build → verify dashboard receives within 2 min
- [ ] Analytics: verify `login_success` + `checkin_submitted` appear in Firebase DebugView
- [ ] FCM: send test push from Firebase Console → verify foreground banner + tap navigation

## End-to-End Smoke Test (Release build on physical device)

- [ ] Login with employee account → dashboard loads
- [ ] Check-in flow: GPS acquired → selfie taken → confirm → success banner
- [ ] Create leave request → status shows "pending"
- [ ] Manager: approve a request → status updates
- [ ] Push notification received → tap → navigates to correct screen
- [ ] Logout → session cleared → login page shown

## App Store Connect

- [ ] App record created in App Store Connect
- [ ] Privacy policy URL live (e.g. `https://guop.app/privacy`)
- [ ] Support URL live
- [ ] Privacy nutrition labels submitted (see `docs/app-store-metadata.md`)
- [ ] Age rating completed: 4+
- [ ] Screenshots uploaded: 6.7" (1290×2796) + 6.5" (1284×2778), min 3 each
- [ ] Demo account credentials entered in Review Notes
- [ ] Build uploaded to TestFlight + processing complete

## Internal UAT (before External TestFlight)

- [ ] 5 employees complete login + check-in + request submission
- [ ] 2 managers complete approval flow
- [ ] No crash-free rate drop below 99.5% during UAT
- [ ] Offline check-in queue: kill app during submit → reopen → auto-retried

## Sign-off

| Role | Name | Date | Sign |
|------|------|------|------|
| Lead Developer | | | |
| QA | | | |
| Product Manager | | | |

---

## Appendix: Real-Device Debug Install (Free Apple ID)

For developer testing on physical iPhone without paid Apple Developer account:

**Prerequisites:**
- Mac with Xcode installed
- iPhone with Developer Mode enabled (Settings → Privacy & Security → Developer Mode)
- Free Apple ID signed in Xcode (Xcode → Settings → Accounts)
- Trust developer cert: iPhone → Settings → VPN & Device Management → select cert → Trust

**Install via USB:**
```bash
# Get device UDID
xcrun xcode-select --print-path  # Verify Xcode
flutter devices  # List connected devices
UDID="<from above>"

# Run in release (faster iteration):
flutter run -d "$UDID" --release --dart-define=API_BASE=http://<mac-ip>:3000

# Or debug:
flutter run -d "$UDID" --dart-define=API_BASE=http://<mac-ip>:3000
```

**LAN Backend Access:**
- Mac + iPhone on same WiFi
- Get Mac LAN IP: `ifconfig | grep "inet 192"`
- Use `http://192.168.x.x:3000` in API_BASE (not localhost)
- Disable Mac firewall OR allow port 3000: System Settings → Firewall Options

**Note:** Free Apple ID certificate expires after 7 days; renew via Xcode Accounts panel.
