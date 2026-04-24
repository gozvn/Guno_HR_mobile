# Push Notifications Setup Guide

Code is complete (Phase 07). This document covers the infrastructure steps
the user must perform before push notifications work in production.

---

## 1. Firebase Project Decision

Decide whether to reuse the existing `guop.app` Firebase project or create a
dedicated project for the mobile app. Recommended: **separate project** to
isolate mobile crash/analytics data from the web app.

---

## 2. Register the iOS App in Firebase

1. Open [Firebase Console](https://console.firebase.google.com) → your project.
2. Add iOS app → enter your bundle ID (e.g. `com.guop.guHrMobile`).
3. Download `GoogleService-Info.plist`.
4. Place it at `ios/Runner/GoogleService-Info.plist`.
5. Add it to the Xcode project (drag into Runner group, check "Copy items if needed",
   target: Runner).

---

## 3. Run flutterfire configure

```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=<your-firebase-project-id>
```

This regenerates `lib/firebase_options.dart` with real API keys, replacing the
placeholder file committed in Phase 07. Commit the result.

---

## 4. APNs Auth Key (.p8)

1. Go to [Apple Developer → Certificates, IDs & Profiles → Keys](https://developer.apple.com/account/resources/authkeys/list).
2. Create a new key → enable **Apple Push Notifications service (APNs)**.
3. Download the `.p8` file. **Keep it safe — cannot be re-downloaded.**
4. In Firebase Console → Project Settings → Cloud Messaging → Apple app configuration:
   - Upload the `.p8` key.
   - Enter your **Team ID** (10-char code from Apple Developer account).
   - Enter the **Key ID** shown when you created the key.

---

## 5. Xcode Capabilities

Open `ios/Runner.xcodeproj` in Xcode:

1. Select Runner target → **Signing & Capabilities**.
2. Click **+ Capability** → add **Push Notifications**.
3. Click **+ Capability** → add **Background Modes** → check **Remote notifications**.

`UIBackgroundModes` is already added to `Info.plist` by Phase 07 code, but
Xcode must also have the capability enabled for entitlements to be signed.

---

## 6. AppDelegate Notes

`AppDelegate.swift` requires no changes — `firebase_messaging` Flutter plugin
handles APNs registration via method swizzling by default. If swizzling is
disabled (e.g. `FirebaseAppDelegateProxyEnabled = NO` in Info.plist), add
manual APNs delegate calls per Firebase docs.

---

## 7. Backend — Register Device Endpoint (BLOCKER for GA)

The endpoint `POST /api/hr/notifications/register-device` is **not yet
implemented** (confirmed missing from API audit 2026-04-24). The app degrades
gracefully (404 logged, token cached locally) but push delivery is impossible
without it.

### Required contract

```
POST /api/hr/notifications/register-device
Authorization: Bearer <jwt>

Body (JSON):
{
  "fcm_token":   "string",   // FCM registration token
  "platform":    "ios",      // always "ios" for this app
  "device_id":   "string",   // iOS identifierForVendor (IDFV)
  "app_version": "string"    // semver e.g. "1.0.0+1"
}

Response: 200 OK (empty body or { "success": true })

DELETE /api/hr/notifications/register-device
Authorization: Bearer <jwt>

Body: { "fcm_token": "string" }

Response: 200 OK
```

Security requirement: backend must link the FCM token to the authenticated
employee (from JWT) and validate on every push dispatch. Never trust tokens
sent without auth headers.

---

## 8. Notification Payload Contract

Backend must send FCM data-only messages with the following `data` fields:

| type                     | Additional fields                        | Deep-link         |
|--------------------------|------------------------------------------|-------------------|
| `request_status_changed` | `request_id` (string int)                | `/requests/:id`   |
| `leave_balance_updated`  | `source_code` (string, e.g. `"AL"`)      | `/leave`          |
| `new_pending_approval`   | `request_id` (string int, optional)      | `/manager/approvals?focus=:id` |
| `team_checkin_alert`     | _(none required)_                        | `/manager`        |
| `checkin_reminder`       | _(none required)_                        | `/attendance/check-in` |

All values are strings (FCM data payloads are string-only). Numeric IDs must
be sent as stringified integers — the client uses `int.tryParse`.

---

## 9. Test Checklist (post-infrastructure setup)

- [ ] Send test message from Firebase Console → FCM token visible in device logs (`[PUSH] token registered: XXXXXXXX…`)
- [ ] Foreground: SnackBar appears with notification title + [Xem] action
- [ ] Background tap: navigates to correct deep-link target
- [ ] Killed state tap: app launches, auth rehydrates, then navigates
- [ ] Permission denied: settings tile shows "Đã tắt", tap opens iOS Settings
- [ ] Logout: `[PUSH] unregisterDevice` logged (404 OK until endpoint ships)
- [ ] Malformed payload (missing `type`): dispatches to `/home`, no crash
