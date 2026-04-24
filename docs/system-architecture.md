# System Architecture — GU HR Mobile

**Last Updated:** 2026-04-24  
**Version:** 1.0.0 (R1 + R2 complete)  
**Platform:** iOS 14+ (Flutter/Dart)

---

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         GuHrApp (root)                          │
│                    (ConsumerStatefulWidget)                     │
└────────────────────────────┬────────────────────────────────────┘
                             │
                    ProviderScope (Riverpod)
                             │
        ┌────────────────────┼────────────────────┐
        │                    │                    │
    MaterialApp          Theme            go_router
    (dark: off)        (Material 3)    (5 bottom tabs)
        │                    │                    │
        └────────────────────┴────────────────────┘
                             │
                   StatefulShellRoute
                (Bottom nav persists across branches)
                             │
     ┌──────┬──────────┬──────────┬──────────┬──────────┐
     │      │          │          │          │          │
    Init  Branch 1   Branch 2   Branch 3   Branch 4   Branch 5
    Auth  /home      /attend     /requests  /profile    /manager
    (R0)  (R1)       (R1)        (R1)       (R1)        (R2*)
           │          │           │          │           │
          Home       Attendance   Requests  Profile      Manager
          Screen     Tab Page     Tab Page  Page         Dashboard
           │          │           │          │           │
       Nested:   Nested:     Nested:    Nested:    Nested:
       /leave    /check-in   /create    /edit      /approvals/:id
       /calendar (modal)     (modal)    (modal)    /team
       /docs                                       /shifts
    
* Manager tab only if isManager == true
```

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
        │   authNotifierProvider.notifier.login(email, password)
        │
        ├─→ AuthNotifier.login() method:
        │   - Set state to AuthLoading
        │   - Call authRepositoryProvider.login(email, password)
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
        │   - 200: {"token": "eyJ...", "user": {...}}
        │   - 400: {"error_message": "Email không tồn tại"}
        │
        ├─→ [ErrorMapperInterceptor]:
        │   - 200: passes {token, user} to repo
        │   - 400: maps to AppFailure.validation("Email không tồn tại")
        │
        ├─→ AuthRepository returns Result<AuthUser>:
        │   - Ok(user) → save JWT to Keychain via authLocalDataSourceProvider
        │   - Err(failure) → return to notifier
        │
        ├─→ AuthNotifier:
        │   - Ok: state = AuthState.authenticated(user)
        │   - Err: state = AuthState.error(failure.message)
        │
        ├─→ router.dart watches authNotifierProvider:
        │   - Detects AuthState.authenticated
        │   - Triggers redirect: "/" → "/home"
        │
        └─→ HomeScreen appears (dashboard loads in parallel)
```

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

### FCM Message Flow

```
Firebase Console sends push notification
        │
        ├─→ APNs delivers to iPhone
        │
        ├─→ firebase_messaging onMessage (app foreground):
        │   - flutter_local_notifications shows banner
        │   - User taps banner
        │
        ├─→ firebase_messaging onMessageOpenedApp:
        │   - Handler reads message data: {intent: 'approval_detail', requestId: '123'}
        │   - Calls deepLinkDispatcher.dispatch(intent)
        │
        ├─→ DeepLinkIntent sealed class:
        │   const factory DeepLinkIntent.approvalDetail(int requestId) = ApprovalDetailIntent;
        │   const factory DeepLinkIntent.checkInReminder() = CheckInReminderIntent;
        │
        ├─→ Deep-link dispatcher:
        │   intent.when(
        │     approvalDetail: (requestId) =>
        │       context.go('/manager/approvals/$requestId'),
        │     checkInReminder: () =>
        │       context.go('/attendance'),
        │   )
        │
        └─→ Router navigates to corresponding screen
```

**File:** `lib/features/notifications/presentation/notification_handler.dart`

```dart
class NotificationHandler {
  static Future<void> _setupFcmListeners(BuildContext context) async {
    // Foreground: notification received while app is open
    FirebaseMessaging.onMessage.listen((message) {
      _showForegroundNotification(message);
    });

    // Tap on notification (app was backgrounded)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final intent = DeepLinkIntent.fromMessage(message.data);
      _dispatchDeepLink(context, intent);
    });

    // App cold-started from notification tap
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      final intent = DeepLinkIntent.fromMessage(initialMessage.data);
      _dispatchDeepLink(context, intent);
    }
  }

  static void _dispatchDeepLink(BuildContext context, DeepLinkIntent intent) {
    intent.when(
      approvalDetail: (requestId) {
        context.go('/manager/approvals/$requestId');
      },
      checkInReminder: () {
        context.go('/attendance');
      },
      requestDetail: (requestId) {
        context.go('/requests/$requestId');
      },
    );
  }
}
```

---

## Role-Based Access Control

### Manager Detection

```dart
@riverpod
bool isManager(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  
  return authState.whenData((state) {
    if (state case AuthAuthenticated(:final user)) {
      return user.isManager;
    }
    return false;
  }).value ?? false;
}
```

### Navigation Gating

**StatefulShellRoute in `lib/app/router.dart`:**

```dart
StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) {
    return TabShellScreen(navigationShell: navigationShell);
  },
  branches: [
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/home',
          name: Routes.home,
          builder: (context, state) => const HomePage(),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/attendance',
          name: Routes.attendance,
          builder: (context, state) => const AttendanceTabPage(),
        ),
      ],
    ),
    // ... more branches
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: '/manager',
          name: Routes.manager,
          builder: (context, state) => const ManagerDashboardPage(),
          // Redirect non-managers to home
          redirect: (context, state) async {
            final isManager = ref.read(isManagerProvider).value ?? false;
            return isManager ? null : '/home';
          },
        ),
      ],
    ),
  ],
)
```

### Tab Visibility

**File:** `lib/features/home/tab_shell_screen.dart`

```dart
class TabShellScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isManager = ref.watch(isManagerProvider);
    
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: [
          const NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          const NavigationDestination(label: 'Attendance', icon: Icon(Icons.checklist)),
          const NavigationDestination(label: 'Requests', icon: Icon(Icons.mail)),
          const NavigationDestination(label: 'Leave', icon: Icon(Icons.calendar_today)),
          // Only show Manager tab if user.isManager
          if (isManager.value ?? false)
            const NavigationDestination(label: 'Manager', icon: Icon(Icons.supervised_user_circle)),
        ],
        onDestinationSelected: (index) {
          widget.navigationShell.goBranch(index);
        },
        selectedIndex: _calculateSelectedIndex(context),
      ),
    );
  }
}
```

---

## State Management Pattern

### Feature State Notifier Template

```dart
// lib/features/{feature}/presentation/{feature}_notifier.dart
class MyFeatureNotifier extends StateNotifier<MyFeatureState> {
  MyFeatureNotifier(this._repository)
      : super(const MyFeatureState.loading());

  final MyFeatureRepository _repository;

  // Action method
  Future<void> doSomething(String param) async {
    state = const MyFeatureState.loading();
    
    final result = await _repository.performAction(param);
    
    state = result.when(
      ok: (data) => MyFeatureState.loaded(data),
      err: (failure) => MyFeatureState.error(failure.userMessage),
    );
  }
}

// lib/features/{feature}/{feature}_providers.dart
@riverpod
StateNotifier<MyFeatureState> myFeatureNotifier(Ref ref) {
  final repo = ref.watch(myFeatureRepositoryProvider);
  return MyFeatureNotifier(repo);
}

// Usage in widget:
class MyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myFeatureNotifierProvider);
    
    return state.when(
      loading: () => const LoadingWidget(),
      loaded: (data) => ListView(children: [...]),
      error: (msg) => ErrorWidget(message: msg),
    );
  }
}
```

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
| **Drift (local DB)** | Never (manual refresh) | locations_cache, request_types_cache |
| **Riverpod (in-memory)** | Auto-dispose on ref loss | Dashboard data, user profile |
| **JSON deserialization** | None | Lazy on access (no eager parsing) |

### Image Optimization (Check-in Selfie)

```dart
// Before upload:
// 1. Capture via camera package
// 2. Load into image.Image
// 3. Resize to 1024×1024 (downscale if larger)
// 4. Compress JPEG quality 80 → retry 60 if >2MB
// 5. Encode base64 → upload in JSON body (NOT multipart)

final image = img.decodeImage(await file.readAsBytes())!;
final resized = img.copyResize(image, width: 1024, height: 1024);
final jpeg = img.encodeJpg(resized, quality: 80);
return base64Encode(jpeg);
```

---

## Unresolved

- **Biometric auth:** Not yet integrated (planned R3)
- **Offline sync for non-check-in:** Requests/leave not queued offline
- **Concurrent manager approvals:** Single-action only, batch approval TBD
- **Push notification rate limiting:** Server side not yet documented
- **Device fingerprinting:** For FCM targeting (multiple devices per user)
