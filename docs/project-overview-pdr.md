# GU HR Mobile — Product Development Requirements

**Status:** Code Complete R1 + R2 (pending Firebase + Apple signing + Play Services)  
**Version:** 1.0.0  
**Created:** 2026-04-24  
**Platforms:** iOS 14+ & Android 7+ (API 24+) (Flutter 3.41.7 / Dart 3.11.5)  
**Bundle IDs:** iOS `app.guop.guHrMobile` / Android `app.guop.guHrMobile`

---

## Problem Statement

GU employees + managers currently rely on Telegram Mini App for HR self-service (check-in, leave requests, approvals). Gaps:
- No offline check-in support (GPS-gated, no queue)
- No native geolocation + camera integration
- No native push notifications
- No manager approval workflow
- Desktop hr-web admin panel unsuitable for mobile UX

**Solution:** Build cross-platform Flutter app (iOS 14+ / Android 7+) targeting employees (R1) + managers (R2), consuming existing HR API (`/api/hr/*`).

---

## Target Users & Scope

| Persona | R1 Release | R2 Release |
|---------|-----------|-----------|
| **Employee** | ✓ Check-in/out (GPS + selfie), leave requests, profile, calendar, documents | ✓ View own requests, deep-link push notifications |
| **Manager** | N/A | ✓ Approve requests, view team roster, manage shifts, live shifts dashboard |
| **Admin/Reports** | ✗ Out of scope | ✗ Remains on desktop hr-web |

### R1 In-Scope Features
- **Auth:** email+password login, change password, JWT Keychain storage, 8h expiry
- **Dashboard:** role-based home (employee vs. manager lane hidden until login)
- **Attendance:** today's check-in/out status, monthly history grid, offline queue for mobile
- **Mobile Check-in:** GPS validation, selfie capture, location radius check, base64 upload
- **Leave:** balance grid, request list, create request with attachment uploads
- **Requests:** filter by status, create, detail view, cancel action
- **Profile:** view/edit phone, logout
- **Company:** calendar grid, document tree + download
- **Push notifications:** FCM → deep-link to approval inbox (infrastructure code-ready, requires backend `register-device` endpoint)

### R2 In-Scope Features
- **Manager Dashboard:** team checkins, active requests, shift summaries (deprecated, replaced by Reports page)
- **Reports Landing Page:** manager-only with 3 entry cards (attendance, leave-balance, requests) + pending-approvals badge
- **Attendance/Leave-Balance/Requests Reports:** detailed views with status filters + month/date pickers
- **Approvals Inbox:** requests awaiting manager approval with detail view (now under /reports/approvals)
- **Approve/Reject:** inline action buttons, success/error handling
- **Live Team:** roster view, search, roles visible
- **Live Shifts:** 4-tab layout (weekly, planned, pending-approval, monthly-summary) with channel filter chips
- **Settings Page (MVP):** change password, logout, app version footer (employee + manager feature)

### Out of Scope (R3+)
- Department/position/role CRUD → desktop `hr-web`
- Employee creation → desktop
- Attendance settings/corrections → desktop
- Reports + analytics → desktop
- Admin tools → desktop
- WebView integration (dropped to avoid SSO complexity)

---

## Success Metrics

| Metric | Target | Rationale |
|--------|--------|-----------|
| Check-in success rate (online) | ≥99% | Core feature reliability |
| Offline queue eventual sync | 100% | No lost data |
| Login p95 latency | <1s | User frustration threshold |
| Crash-free rate | ≥99.5% | Firebase Crashlytics baseline |
| Time to R1 TestFlight | ≤5 weeks | Team bandwidth, single dev |
| Time to R2 completion | ≤9 weeks total | Incremental manager features |
| Code coverage | ≥80% unit tests | 164 tests passing, 0 flaky |

---

## Stakeholders & Responsibilities

| Role | Commitment |
|------|-----------|
| **Mobile Lead** | Full-stack Dart/Flutter implementation, 8-10 week runway |
| **Backend Team** | Deliver 5 API blockers before production (see below) |
| **Design/Brand** | Material 3 tokens + Inter font from `theme/stitch_modern_hr_hub/` |
| **Apple Developer** | Team ID, signing certificates, provisioning profiles (phase-08) |
| **Firebase Team** | Project creation, APNs cert upload, console access |
| **QA** | Manual smoke testing on physical iPhone + TestFlight UAT |

---

## Critical Backend Dependencies (Production Blockers)

**Without these, app cannot go GA:**

1. **POST `/api/hr/auth/refresh`** — Refresh token endpoint
   - Current: 8h JWT expires, no refresh in audit
   - Impact: User forced to re-login daily
   - Required by: phase-02 (auth), must ship before production

2. **POST `/api/hr/notifications/register-device`** → FCM token registration
   - Current: Not in API audit
   - Impact: Cannot register device for targeted push
   - Required by: phase-07, must ship before production

3. **DELETE `/api/hr/notifications/register-device`** → Token cleanup on logout
   - Current: Not in API audit
   - Impact: Logout does not unregister device (stale tokens)
   - Required by: phase-07

4. **Timezone documentation** — Server timezone for attendance records
   - Current: Ambiguous (assumed Asia/Saigon)
   - Impact: Leave date calculations, monthly rollover
   - Required by: phase-04 + phase-05

5. **Rate limiting** — Per-user request throttling
   - Current: Absent per audit
   - Impact: DoS risk on mobile-checkin + login endpoints
   - Required by: phase-04, before production

6. **GPS radius per location** — `GET /api/hr/locations` returns `gps_radius_m`
   - Current: Spec ambiguous
   - Impact: Client cannot preview radius before check-in
   - Required by: phase-04

---

## Tech Stack Decision

| Layer | Tech | Why Not Alternatives |
|-------|------|-----|
| **Framework** | Flutter 3.41.7 | Cross-platform iOS + Android; vs. native (2+ separate codebases) |
| **Language** | Dart 3.11.5 | Flutter-native; single codebase compiles to iOS + Android |
| **State** | Riverpod 2.x + `riverpod_generator` | Compile-safe DI, code-gen; vs. Provider (runtime), Cubit (boilerplate) |
| **HTTP** | Dio 5.7 + interceptor chain | Flexible interceptor pipeline; vs. http (no chain), dio_http2 (overkill) |
| **Models** | freezed + json_serializable | Sealed unions for errors/state, immutable defaults; vs. manual serialization |
| **Router** | go_router 14 | Deep-link ready, StatefulShellRoute for tabbed nav; vs. auto_route (annotation soup) |
| **Secure storage** | flutter_secure_storage | iOS Keychain native; vs. shared_preferences (unencrypted) |
| **Offline DB** | drift 2.18 | Type-safe SQLite, auto-migrations; vs. hive (untyped) |
| **Geolocation** | geolocator 12 | Robust accuracy/permission handling; vs. location (stale) |
| **Camera** | camera 0.11 | Native CameraController; vs. image_picker (gallery-focused) |
| **Maps** | apple_maps_flutter 1.3.0 (iOS) + text fallback (Android) | iOS: Native Apple Maps. Android: Haversine text card (Phase R3: google_maps_flutter or flutter_map for visual parity) |
| **Push** | firebase_messaging + APNs | Apple's unified platform; vs. OneSignal (vendor lock) |
| **Design** | Material 3 (Flutter material package) | Brand alignment; vs. Cupertino (iOS-only, legacy look) |
| **Font** | Inter via google_fonts | DESIGN.md spec; vs. roboto (wrong brand) |

---

## Architecture Highlights

### Feature-First Structure
```
lib/features/{feature}/
├── data/       # API/local data sources, DTOs, repositories
├── domain/     # Models, sealed classes, business logic
└── presentation/ # Pages, widgets, state notifiers
```
Each feature self-contained; core utils + shared widgets in `lib/core/` + `lib/shared/`.

### Riverpod Providers
- Root providers: `dio`, `secureStorage`, `connectivity` (in `app/providers.dart`)
- Feature providers: `auth_providers.dart`, `attendance_providers.dart`, etc.
- Code-gen annotations: `@riverpod` macro preferred over manual StateNotifier

### Interceptor Chain
```
Dio request → AuthInterceptor (Bearer JWT)
           → RefreshInterceptor (silent 401 retry on refresh)
           → CacheInterceptor (HTTP cache headers)
           → ErrorMapperInterceptor (DioException → AppFailure sealed)
           → Network
```

### Offline Check-in Queue
- Drift table `pending_checkins` stores GPS + selfie + metadata
- `OfflineRetryWorker` retries with exponential backoff: 5s → 25s → 2m → 10m → 1h (capped)
- Idempotent: server responds "Đã check-in lúc..." on duplicate → delete from queue
- Online detection: `connectivity_plus` watch + manual connectivity check before retry

### Role-Based Gating
- `isManagerProvider` watches `authNotifier` → bool
- Manager tab (index 3 in StatefulShellRoute) conditionally hidden
- Deep-link to manager routes auto-routes non-managers to home

### Sealed Classes for Exhaustive Matching
- `AuthState` (Loading | ForceChangePassword | Authenticated | Unauthenticated)
- `Result<T>` (Ok<T> | Err<AppFailure>)
- `AppFailure` (Network | Unauthorized | Forbidden | Server | Validation | Unknown)
- `CheckInResult` (Online | OfflineQueued | Failure)
- Compile-time guarantee: all branches covered

### Firebase Gating
- `firebaseConfigured` provider checks if real options loaded (not placeholder)
- Crashlytics + Analytics + Messaging all no-op until `flutterfire configure` run
- Prevents iOS NSException crash when dev using placeholder `firebase_options.dart`

### JSON Serialization
- Global `build.yaml` → `field_rename: snake` for all models
- Server sends `email_address`, flutter parses to `emailAddress` automatically
- No per-field `@JsonKey` clutter

---

## Release Timeline

| Phase | Deliverable | Status | Effort | Target Date |
|-------|-----------|--------|--------|------------|
| 01 | Project setup + theme | COMPLETE | 4d | Week 1 |
| 02 | Auth + JWT Keychain | COMPLETE | 4d | Week 2 |
| 03 | Dashboard + profile + company | COMPLETE | 5d | Week 2–3 |
| 04 | Attendance + check-in + offline queue | COMPLETE | 8d | Week 4–5 |
| 05 | Leave + requests | COMPLETE | 5d | Week 5–6 |
| 06 | Manager dashboard + approvals + team | COMPLETE | 8d | Week 6–8 |
| 07 | Push notifications (FCM + APNs) | COMPLETE | 4d | Week 8–9 |
| 08 | Testing + instrumentation + release | COMPLETE | 6d | Week 9–10 |
| **TestFlight (internal)** | R1 + R2 ready for signing | PENDING | – | Week 10 |
| **App Store (external)** | Public beta | BLOCKED (backend) | – | Week 11+ |
| **GA** | Production release | BLOCKED (backend + Apple review) | – | TBD |

**Blockers to GA:**
- Backend: refresh token, device register, rate limiting, timezone doc, GPS radius
- Apple: signing certs, provisioning profile, app review (1–3 days)
- Firebase: real project ID, APNs cert upload

---

## Metrics & Health

| Metric | Current | Target |
|--------|---------|--------|
| Total LOC | 12,934 | <13,500 (maintainable) |
| Source files | 180+ | <200 (feature-first) |
| Tests | 164 passing | ≥160 (0 flaky) |
| `flutter analyze` | 0 issues | 0 issues |
| Code coverage | 80%+ | ≥80% |

---

## Unresolved Questions

- **TBD:** Final Firebase project ID (must match iOS Bundle ID `app.guop.guHrMobile`)
- **TBD:** Apple Team ID for Xcode signing (phase-08 blocker)
- **TBD:** Backend refresh token timeline (production blocker)
- **TBD:** Timezone for server attendance records (affects leave date math)
