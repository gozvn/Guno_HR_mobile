# System Architecture — GU HR Mobile

**Last Updated:** 2026-04-24  
**Version:** 1.0.0 (R1 + R2 complete)  
**Platform:** iOS 14+ (Flutter/Dart)

---

## Bottom Navigation Structure (R2 Final)

**Fixed 5-slot layout with MoreSheet for additional items. Slot 4 "Báo cáo" is now UNIVERSAL (all roles):**

### Employee View
```
Slot Layout:
[Trang chủ] | [Đơn từ] | [Chấm công]* | [Phép năm] | [Báo cáo]†
                          (centred)

*Chấm công: Attendance + check-in flow (circular FAB style)
†Báo cáo: Reports landing (employee sees: personal monthly attendance, annual leave)
  
Thêm (More): Opens MoreSheet modal with:
  - Tài liệu (documents)
  - Cài đặt (settings)
  - Ca Live (if live-team member)
  - Hồ sơ (profile) — ALWAYS appended
```

### Manager View
```
[Trang chủ] | [Đơn từ] | [Chấm công]* | [Phép năm] | [Báo cáo]†
                          (centred)       (with badge)

†Báo cáo: Reports landing (manager sees: personal + team sections + pending-approvals banner)
  
Thêm (More): Opens MoreSheet modal with:
  - Tài liệu (documents)
  - Ca Live
  - Cài đặt (settings)
  - Hồ sơ (profile) — ALWAYS appended
```

### Router: 9 StatefulShellRoute.indexedStack Branches
```
StatefulShellRoute (bottom nav persists)
├─ Branch 0: /home
│  └─ HomePage
├─ Branch 1: /requests
│  └─ RequestsTabPage
│     └─ Sub: /requests/create → CreateRequestPage
├─ Branch 2: /attendance
│  └─ AttendanceTabPage
│     └─ Sub: /attendance/monthly → MonthlyCalendarPage (with CalendarStatsBanner + OfficeLocationMap)
│     └─ Sub: /attendance/check-in → CheckInFlowPage
├─ Branch 3: /leave
│  └─ LeaveBalancesPage
├─ Branch 4: /reports (UNIVERSAL, role-aware)
│  └─ ReportsPage (ConsumerWidget, role-aware sections)
│     └─ Section "Cá nhân": Bảng công của tôi, Phép năm của tôi
│     └─ Section "Quản lý" (manager only): Chấm công tháng, Phép năm, Đơn từ + pending-approvals banner
│     └─ Sub: /reports/attendance
│     └─ Sub: /reports/leave-balance
│     └─ Sub: /reports/requests
│     └─ Sub: /reports/live-shifts (manager only)
├─ Branch 5: /profile (hidden, in MoreSheet for both roles)
│  └─ ProfilePage
│     └─ Sub: /profile/edit → ProfileEditPage
├─ Branch 6: /docs (hidden, accessible via MoreSheet)
│  └─ CompanyDocumentsPage
├─ Branch 7: /live-team (hidden, accessible via MoreSheet)
│  └─ LiveTeamPage
└─ Branch 8: /settings (hidden, accessible via MoreSheet)
   └─ SettingsPage
```

### Navigation Constants Updates
**File:** `lib/app/router.dart` — Routes enum renamed:
- Removed: `leaveBalances`, `companyDocs`, `manager*`
- Added: `leave`, `docs`, `liveShifts`, `settings`, `reports`, `reportsApprovals`, `reportsLiveTeam`, `reportsAttendance`, `reportsLeaveBalance`, `reportsRequests`

### Deprecation Redirects
**Old paths → new paths** (1 release transition period):
- `/home/leave` → `/leave`
- `/home/company/docs` → `/docs`
- `/manager` → `/reports`
- `/manager/approvals` → `/reports/approvals`
- `/manager/live-team` → `/reports/live-team`
- `/manager/live-shifts` → `/live-shifts`

Implemented in `_deprecationRedirect()` middleware.

### MoreSheet Widget
**File:** `lib/features/home/widgets/more_sheet.dart`

Role-aware menu items (Hồ sơ ALWAYS appended):
- **Employee:** Tài liệu, Cài đặt, Hồ sơ
- **Employee + live-team member:** + Ca Live (before settings)
- **Manager:** Ca Live, Tài liệu, Cài đặt, Hồ sơ

Derived from `isLiveMemberProvider` in `manager_providers.dart` (watches `liveTeamMembersProvider` + current user ID).

**TabShellScreen slot mapping (simplified):**
- `_toBranchIndex` / `_toVisibleIndex` no longer role-conditional
- Slot 3 → Branch 3 always (leaves)
- Slot 4 → Branch 4 always (reports, content is role-aware)

---

## Dio Interceptor Chain (HTTP Layer)

Request/Response flow:

```
CLIENT REQUEST
       │
       ├─→ [1] AuthInterceptor
       │   - Reads JWT from SecureStorage (Keychain)
       │   - Injects: Authorization: Bearer {jwt_token}
       │   - If no JWT: passes through (login endpoint)
       │
       ├─→ [2] RefreshInterceptor
       │   - Intercepts DioException with status 401
       │   - Attempts refresh token (endpoint TBD by backend)
       │   - On refresh success: retries original request
       │   - On refresh fail: triggers force logout
       │
       ├─→ [3] CacheInterceptor
       │   - Respects HTTP cache-control headers (GET only)
       │   - Stores response in memory cache (dio_cache_interceptor)
       │   - Cache key: method + path + params
       │   - TTL configurable per endpoint (default 5min)
       │
       ├─→ [4] ErrorMapperInterceptor
       │   - Catches DioException at response level
       │   - Parses error body: {"error_message": "...", "error_code": "..."}
       │   - Maps to AppFailure sealed class
       │
       └─→ NETWORK REQUEST
           (GET /api/hr/...)
           (POST /api/hr/...)
           
NETWORK RESPONSE
       │
       ├─← [4] ErrorMapperInterceptor (reverse)
       │   - Success (2xx): passes through
       │   - Error (4xx/5xx): converts to AppFailure
       │
       ├─← [3] CacheInterceptor (reverse)
       │   - Caches successful 2xx responses
       │   - Returns cached copy on future requests (within TTL)
       │
       ├─← [2] RefreshInterceptor (reverse)
       │   - Detects 401: triggers refresh flow
       │
       ├─← [1] AuthInterceptor (reverse)
       │   - No-op on response
       │
       └─→ REPOSITORY (handles Result<T>)
           - Converts AppFailure to user-facing error
           - Returns Ok(data) | Err(failure)
```

### Dio Configuration
**File:** `lib/core/api/dio_client.dart`

```dart
Dio buildDio({
  required String baseUrl,
  required List<Interceptor> interceptors,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 60),  // Generous for selfie upload
      headers: const {'Accept': 'application/json'},
    ),
  );
  dio.interceptors.addAll(interceptors);
  return dio;
}
```

**Timeout Strategy:**
- **Connect:** 10s (handshake)
- **Receive:** 30s (download response)
- **Send:** 60s (upload attachments/selfies)

---

## Riverpod Provider Architecture

### Provider Tree (Simplified)

```
app/providers.dart (Root)
├─ @riverpod dioProvider
│  └─ Depends on: env.dart (API_BASE), secureStorageProvider
│
├─ @riverpod secureStorageProvider
│  └─ flutter_secure_storage (Keychain)
│
├─ @riverpod connectivityProvider
│  └─ connectivity_plus (online/offline state)
│
├─ features/auth/auth_providers.dart
│  ├─ @riverpod authRepositoryProvider
│  │  └─ Depends on: dioProvider
│  ├─ StateNotifier<AuthState> authNotifierProvider
│  │  └─ Depends on: authRepositoryProvider
│  └─ @riverpod isManagerProvider
│     └─ Watches: authNotifierProvider
│
├─ features/dashboard/dashboard_providers.dart
│  ├─ @riverpod dashboardRepositoryProvider
│  │  └─ Depends on: dioProvider
│  └─ @riverpod dashboardProvider (Future<DashboardData>)
│     └─ Depends on: dashboardRepositoryProvider
│
├─ features/attendance/attendance_providers.dart
│  ├─ @riverpod attendanceRepositoryProvider
│  │  └─ Depends on: dioProvider, attendanceDatabaseProvider
│  ├─ @riverpod attendanceDatabaseProvider
│  │  └─ drift (SQLite instance)
│  ├─ @riverpod offlineRetryWorkerProvider
│  │  └─ Depends on: connectivityProvider, attendanceRepositoryProvider
│  └─ @riverpod attendanceProvider (Future<AttendanceData>)
│
├─ features/requests/requests_providers.dart
│  ├─ @riverpod requestRepositoryProvider
│  │  └─ Depends on: dioProvider, requestsDatabaseProvider
│  ├─ @riverpod requestsDatabaseProvider
│  │  └─ drift (SQLite instance, LocalDrafts + RequestTypesCache)
│  └─ @riverpod myRequestsProvider (Future<List<Request>>)
│
└─ ... (profile, leave, company, manager, notifications)
```

### Key Provider Types

| Type | Use Case | Example |
|------|----------|---------|
| **Async** | Fetch data from API/DB | `@riverpod Future<T> myData(Ref ref)` |
| **State** | Mutable form/UI state | `StateNotifier<FormState>` |
| **Computed** | Derived from other providers | `@riverpod bool isManager(Ref ref)` |
| **Cache** | Long-lived shared service | `@riverpod Dio dioProvider(Ref ref)` |

---

## Data Flow: Login

```
User taps "Đăng nhập" button
        │
        ├─→ LoginPage calls
        │   authNotifierProvider.notifier.attemptLogin(email, password)
        │
        ├─→ AuthNotifier.attemptLogin() → Result<LoginOutcome>:
        │   - Set state to AuthLoading
        │   - Call authRepositoryProvider.login(email, password)
        │   - Returns LoginOutcome { user, mustChangePassword }
        │
        ├─→ AuthRepository.login():
        │   - Call authRemoteDataSourceProvider.login(email, password)
        │   - POST /api/hr/auth/login
        │
        ├─→ [AuthInterceptor] Dio chain:
        │   - No JWT yet (login endpoint), skip Bearer injection
        │   - Network request sent
        │
        ├─→ Server response:
        │   - 200: {"token": "eyJ...", "user": {...}, "must_change_password": false}
        │   - 401: {"error": "Email không tồn tại"}
        │
        ├─→ [ErrorMapperInterceptor]:
        │   - 200: passes {token, user} to repo
        │   - 401: maps to AppFailure.unauthorized("Email không tồn tại")
        │     (server message passed into unauthorized(message))
        │
        ├─→ AuthRepository._mapException():
        │   - Unwraps DioException.error → AppFailureException
        │   - Returns Result<AuthUser> with proper failure context
        │
        ├─→ LoginForm shows status banner (above inputs):
        │   - On success: "Đăng nhập thành công. Đang chuyển trang…" (green)
        │   - Waits 1.2s before calling completeLogin()
        │   - On failure: SnackBar floating at bottom with server message
        │     (e.g., "Email không tồn tại")
        │
        ├─→ AuthNotifier.completeLogin(outcome):
        │   - Save JWT to Keychain via authLocalDataSourceProvider
        │   - Set state = AuthState.authenticated(user)
        │   - If mustChangePassword: state = AuthState.forceChangePassword(email)
        │
        ├─→ router.dart watches authNotifierProvider:
        │   - Detects AuthState.authenticated
        │   - Triggers redirect: "/" → "/home"
        │
        └─→ HomeScreen appears (dashboard loads in parallel)
```

**New pattern:**
- `AuthNotifier.attemptLogin()` now split into attempt + complete phases
- Old `login()` retained as thin wrapper for tests
- LoginForm shows green banner on success, waits 1.2s, then calls complete
- Server error messages display verbatim in SnackBar (Vietnamese localization)

---

## Data Flow: Mobile Check-in (Online)

```
User taps "Check-in" → Location requested
        │
        ├─→ CheckInFlowPage:
        │   - Calls geolocator.getCurrentPosition()
        │   - Validates accuracy (±20m recommended)
        │   - Note: No pre-flight _isOnline() check (Connectivity.onConnectivityChanged
        │     only emits on STATE CHANGE, not initial state → blocks indefinitely)
        │   - Dio detects connection errors via DioException.connectionError
        │
        ├─→ LocationCheckPage:
        │   - Compares GPS against locations_cache (drift)
        │   - Shows "Trong bán kính công ty" or "Ngoài bán kính"
        │
        ├─→ User accepts → CameraPage:
        │   - camera package starts selfie capture
        │   - User captures image
        │
        ├─→ ImagePreviewPage:
        │   - image package: resize 1024x1024 → compress JPEG 80%
        │   - Convert to base64
        │   - Show preview + "Xác nhận" button
        │
        ├─→ CheckInConfirmPage:
        │   - Call checkInNotifierProvider.notifier.submitCheckIn(...)
        │   - State: CheckInResult.loading
        │
        ├─→ CheckInSubmitter.submit():
        │   - Route based on checkInType (switch statement):
        │     - 'wfh_checkin' → POST /api/hr/attendance/wfh-checkin
        │     - 'wfh_checkout' → POST /api/hr/attendance/wfh-checkout
        │     - 'checkout' → POST /api/hr/attendance/mobile-checkout
        │     - default → POST /api/hr/attendance/mobile-checkin
        │   - Detect connectivity: check pending_checkins count (can't use streaming check)
        │   - If online:
        │     - [AuthInterceptor] injects JWT
        │     - Network succeeds (200) → return Ok(CheckInResult.online)
        │     - Network fails (DioException) → return Err(failure)
        │   - If offline:
        │     - Save to pending_checkins (drift table)
        │     - Return Ok(CheckInResult.offlineQueued)
        │
        ├─→ CheckInNotifier:
        │   - On Ok(online): show "Đã check-in lúc 08:30"
        │   - On Ok(offlineQueued): show "Đã lưu, sẽ gửi khi có kết nối"
        │   - On Err: surface server error (verbatim Vietnamese) via setError()
        │       (e.g., "WFH request not approved" from backend)
        │
        └─→ Return to AttendancePage (navigate via rootNavigator.pop + context.go)
```

---

## Data Flow: Mobile Check-in (Offline Queue & Retry)

```
Offline check-in saved to drift (pending_checkins table)
        │
        └─→ OfflineRetryWorker (background):
            - Watches connectivityProvider (online/offline state change)
            - On transition to online:
              - Reads pending_checkins from drift (all with status='pending')
              - For each pending record:
                - Retry POST /api/hr/attendance/mobile-checkin (or specific endpoint)
                - Idempotency key: uuid column (prevents duplicate check-ins)
                - Retry schedule (exponential backoff, capped at 1h):
                  - 1st attempt: immediately (0ms)
                  - 2nd attempt: +5s
                  - 3rd attempt: +25s
                  - 4th attempt: +2m
                  - 5th attempt: +10m
                  - Final: +1h (max)
                
                - Handle response:
                  - 200 OK: delete from pending_checkins ✓
                  - 400 with "Đã check-in lúc..." (idempotent duplicate):
                    delete from pending_checkins ✓ (already checked in)
                  - 4xx client error (400 other, 401, 403, 404):
                    DELETE row, log as [RETRY-DEAD], do NOT retry ✗
                    (400: invalid request; 401: auth expired; 403: forbidden)
                  - 5xx server error (500, 503):
                    Keep row, reschedule next retry ⟳
                  - Network timeout / connection error:
                    Keep row, reschedule next retry ⟳
```

**Terminal errors (no retry):**
- `400` (Bad Request) — malformed check-in data, won't retry
- `401` (Unauthorized) — token expired, won't retry (user re-login required)
- `403` (Forbidden) — access denied, won't retry
- `404` (Not Found) — endpoint doesn't exist, won't retry

**Retryable errors:**
- `500`, `502`, `503` (Server errors)
- Network timeouts
- Connection refused / DNS failures

**Retry logic in `lib/features/attendance/data/offline_retry_worker.dart`:**
```dart
static const _retryBackoffs = [
  Duration(milliseconds: 0),    // Immediate
  Duration(seconds: 5),
  Duration(seconds: 25),
  Duration(minutes: 2),
  Duration(minutes: 10),
];

const _retryCapDuration = Duration(hours: 1);

Future<void> _retry(PendingCheckin pending) async {
  for (int attempt = 0; attempt < _retryBackoffs.length; attempt++) {
    if (attempt > 0) {
      final backoff = _retryBackoffs[attempt];
      final cappedBackoff = backoff > _retryCapDuration ? _retryCapDuration : backoff;
      await Future.delayed(cappedBackoff);
    }

    final result = await _repo.submitCheckIn(
      gpsLat: pending.gpsLat,
      gpsLng: pending.gpsLng,
      selfieBase64: pending.selfieBase64,
      idempotencyKey: pending.uuid,  // Prevent duplicates
    );

    if (result.isOk) {
      await _db.delete(pending);
      return;
    } else if (result.isIdempotentDuplicate) {
      await _db.delete(pending);  // Already checked in
      return;
    }
    // Else: retry on next backoff
  }
  
  // After all retries exhausted, notify user
  _notifyUserPersistentError(pending);
}
```

---

## Data Flow: Monthly Attendance View

```
User navigates to Báo cáo → Bảng công của tôi (ReportsPage link)
        │
        ├─→ MonthlyCalendarPage receives month="YYYY-MM" param
        │
        ├─→ Calls monthlyAttendanceProvider(ref, month: "2026-04")
        │   - Triggers AttendanceApi.fetchMonthly(month: "2026-04")
        │   - Sends GET /api/hr/attendance/monthly?employee_id=me&month=2026-04
        │   - [AuthInterceptor] injects JWT
        │
        ├─→ Server returns:
        │   {
        │     "rows": [
        │       {"date": "2026-04-01", "workMinutes": 480, "otMinutes": 0, "status": "present", ...},
        │       {"date": "2026-04-02", "workMinutes": 300, "otMinutes": 120, "status": "late", ...},
        │       ...
        │     ],
        │     "summary": {
        │       "totalDays": 22,
        │       "present": 20,
        │       "late": 2,
        │       "absent": 0,
        │       "leave": 0,
        │       "totalWorkMinutes": 10560,
        │       "totalOtMinutes": 120,
        │       "totalLateMinutes": 45
        │     }
        │   }
        │
        ├─→ MonthlyAttendanceDto parsed:
        │   - rows: List<MonthlyDayDto>
        │   - summary: MonthlySummaryDto?
        │
        ├─→ CalendarStatsBanner (NEW widget above grid):
        │   - Displays 4 stat tiles: Công, Trễ, Vắng, Phép (from summary if present; else rolls up from rows[])
        │   - Total work hours (totalWorkMinutes / 60)
        │   - Total late minutes
        │
        ├─→ CalendarGridWidget:
        │   - Reads rows[]
        │   - Bold-attended days: background alpha 0.30, bold text, thicker border
        │   - Tap day: shows DayDetailSheet with workMinutes (÷60 for display)
        │
        └─→ Navigation link "Xem bảng công tháng" removed from AttendanceTabPage
```

**Multi-office resolution:** When user views location on map (OfficeLocationMap widget):
- Uses nearest office from `resolveLocationCheck(userLat, userLng, offices[])`
- Any office within `gpsRadiusM` qualifies as "in radius"
- If multiple offices qualify, picks closest match
- Falls back to nearest office (any radius) for WFH dialog reference

**Apple Maps integration (iOS only):**
- `OfficeLocationMap` renders AppleMap with user pin + office circle
- Circle tinted brand orange, alpha 0.18
- Dynamic camera based on user↔office bearing + distance
- `myLocationEnabled: true` fallback

---

## Database Layer (Drift)

### Tables

#### 1. PendingCheckins
**Purpose:** Queue for offline check-ins

```dart
@DataClassName('PendingCheckin')
class PendingCheckinsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text()();  // Idempotency key
  RealColumn get gpsLat => real()();
  RealColumn get gpsLng => real()();
  TextColumn get selfieBase64 => text().limited(length: 5000000)();  // ~1.5MB encoded
  TextColumn get checkInType => text()();  // 'checkin' | 'checkout' | 'wfh_checkin'
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get status => text().withDefault(const Constant('pending'))();  // 'pending' | 'retrying' | 'failed'
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
}
```

**Usage in code:**
```dart
// Insert (offline check-in)
await db.into(db.pendingCheckinsTable).insert(
  PendingCheckinsTableCompanion(
    uuid: Value(uuid),
    gpsLat: Value(gpsLat),
    gpsLng: Value(gpsLng),
    selfieBase64: Value(selfieBase64),
    checkInType: const Value('checkin'),
  ),
);

// Query (retry worker)
final pending = await db.select(db.pendingCheckinsTable)
    .where((t) => t.status.equals('pending'))
    .get();

// Delete (successful upload)
await db.delete(db.pendingCheckinsTable)
    .where((t) => t.uuid.equals(uuid))
    .go();
```

#### 2. LocationsCache
**Purpose:** Cache office locations + GPS radius (refreshed on login)

```dart
@DataClassName('LocationCache')
class LocationsCacheTable extends Table {
  IntColumn get id => integer()();  // Server location ID
  TextColumn get name => text()();  // "HQ Hà Nội", "Branch TP.HCM"
  RealColumn get gpsLat => real()();
  RealColumn get gpsLng => real()();
  RealColumn get gpsRadiusM => real()();  // Radius in meters
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {id};
}
```

**Sync on login:**
```dart
// AuthRepository.login() also calls:
final locationsResult = await _locationRemoteDataSource.getLocations();
locationsResult.when(
  ok: (locations) async {
    // Upsert into drift
    for (final loc in locations) {
      await _db.into(_db.locationsCacheTable).insertOnConflictUpdate(
        LocationsCacheTableCompanion(
          id: Value(loc.id),
          name: Value(loc.name),
          gpsLat: Value(loc.gpsLat),
          gpsLng: Value(loc.gpsLng),
          gpsRadiusM: Value(loc.gpsRadiusM),
        ),
      );
    }
  },
  err: (_) {
    // Fail silently; use stale cache
  },
);
```

#### 3. RequestTypesCache
**Purpose:** Cache leave/request types (for form dropdowns)

```dart
@DataClassName('RequestTypeCache')
class RequestTypesCacheTable extends Table {
  IntColumn get id => integer()();  // Server type ID
  TextColumn get name => text()();  // "Nghỉ lúc", "Đi công tác"
  TextColumn get code => text()();  // 'LEAVE_HALF' | 'LEAVE_FULL' | 'BUSINESS_TRIP'
  BoolColumn get requiresApproval => boolean()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {id};
}
```

#### 4. LocalDrafts
**Purpose:** Store unsaved request drafts (offline)

```dart
@DataClassName('LocalDraft')
class LocalDraftsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text()();
  IntColumn get requestTypeId => integer()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get reason => text()();
  TextColumn get attachmentsJson => text()();  // JSON array of file paths
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
```

### Drift Configuration
**File:** `lib/features/attendance/database/attendance_database.dart`

```dart
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'attendance_database.g.dart';  // Generated

@DriftDatabase(tables: [
  PendingCheckinsTable,
  LocationsCacheTable,
  RequestTypesCacheTable,
  LocalDraftsTable,
])
class AttendanceDatabase extends _$AttendanceDatabase {
  AttendanceDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'attendance_db');
  }
}
```

### Database Providers
**File:** `lib/features/attendance/attendance_providers.dart`

```dart
@riverpod
AttendanceDatabase attendanceDatabaseProvider(Ref ref) {
  return AttendanceDatabase();
}

@riverpod
Future<List<PendingCheckin>> pendingCheckinsProvider(Ref ref) async {
  final db = ref.watch(attendanceDatabaseProvider);
  return db.select(db.pendingCheckinsTable)
      .where((t) => t.status.equals('pending'))
      .get();
}
```

---

## Deep-Link Handling (FCM + Router)
FCM message received → `DeepLinkIntent` sealed class (approvalDetail, checkInReminder, requestDetail) → `NotificationHandler` dispatches to appropriate route via `context.go()`. Foreground notifications shown via `flutter_local_notifications` banner.

---

## Role-Based Access Control

**Manager detection:** `@riverpod bool isManager(Ref ref)` watches auth state; filters branch access in `StatefulShellRoute.indexedStack`.

**MoreSheet menu:** Role-aware items determined by `isManagerProvider` + `isLiveMemberProvider` (derived from `liveTeamMembersProvider`).

**Redirect pattern:** Non-managers deep-linking to `/reports/*` auto-redirect to `/home` via route guards.

---

## State Management Pattern

**StateNotifier + Result<T>:** Each feature has a notifier (Action methods → state mutation) + async providers (fetch data). All repository methods return `Result<T>` (Ok/Err) for exhaustive error handling.

**Example:** `AuthNotifier.attemptLogin(email, password) → Result<LoginOutcome>`, then `completeLogin(outcome)` updates state + saves JWT to Keychain.

See `code-standards.md` for detailed patterns (Riverpod Providers section).

---

## API Client Configuration

### Environment Setup

**File:** `lib/core/utils/env.dart`

```dart
class Env {
  static String get apiBase {
    return String.fromEnvironment(
      'API_BASE',
      defaultValue: 'https://api.guop.app',
    );
  }
}
```

**Build/Run Commands:**
```bash
# Dev
flutter run --dart-define=API_BASE=https://dev.api.guop.app

# Staging
flutter run --dart-define=API_BASE=https://stg.api.guop.app

# Prod (default)
flutter run
```

---

## Performance Considerations

### Caching Strategy

| Layer | TTL | Strategy |
|-------|-----|----------|
| **HTTP (dio_cache_interceptor)** | Per response `cache-control` header | GET endpoints only |
| **locations_cache (drift)** | 1h (reduced from 24h for admin-added offices) | Refreshed on login + manual refresh |
| **request_types_cache (drift)** | Never (manual refresh) | Loaded on app start |
| **Riverpod (in-memory)** | Auto-dispose on ref loss | Dashboard data, monthly attendance, user profile |
| **JSON deserialization** | None | Lazy on access (no eager parsing) |

### Image Optimization (Check-in Selfie)
Selfies resized to 1024×1024, compressed JPEG quality 80, then base64-encoded in JSON body (not multipart).

---

## Unresolved

- Biometric auth (R3)
- Offline sync for requests/leave (not queued)
- Batch manager approvals (single-action only)
- Device fingerprinting for multi-device FCM targeting
