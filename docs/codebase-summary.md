# Codebase Summary — GU HR Mobile

**Last Updated:** 2026-04-24  
**Language:** Dart 3.11.5  
**Framework:** Flutter 3.41.7  
**Total LOC:** ~12,934 hand-authored  
**Files:** 185+ Dart source files  
**Tests:** 164 unit/widget tests (0 flaky)  
**iOS Deps Added:** apple_maps_flutter ^1.3.0  

---

## Project Structure

```
lib/
├── main.dart                    # Entry point: Firebase init + ProviderScope + GuHrApp
├── firebase_options.dart        # Placeholder (flutterfire configure replaces at phase-08)
├── app/
│   ├── app.dart                 # GuHrApp ConsumerStatefulWidget + MaterialApp.router
│   ├── router.dart              # go_router 14 + StatefulShellRoute (5 bottom tabs)
│   ├── providers.dart           # Root Riverpod: dio, secureStorage, connectivity
│   └── theme/
│       ├── colors.dart          # ColorScheme + GuHrColors ThemeExtension (Material 3)
│       ├── typography.dart      # Inter typography scale (6 TextStyles)
│       ├── tokens.dart          # GuHrRadii, GuHrSpacing constants
│       └── theme.dart           # ThemeData builder (light mode only)
├── core/
│   ├── api/
│   │   ├── dio_client.dart              # Dio factory with timeout config
│   │   ├── auth_interceptor.dart        # Bearer JWT injection (phase-02)
│   │   ├── refresh_interceptor.dart     # 401 retry handler (no real endpoint yet)
│   │   ├── cache_interceptor.dart       # HTTP cache respecting headers (phase-04)
│   │   └── error_mapper_interceptor.dart # DioException → AppFailure sealed
│   ├── errors/
│   │   ├── app_failure.dart   # @freezed sealed: Network | Unauthorized | Forbidden | Server | Validation | Unknown
│   │   └── result.dart        # sealed Result<T>: Ok<T> | Err<AppFailure>
│   ├── storage/
│   │   └── secure_storage.dart  # flutter_secure_storage wrapper (Keychain ops)
│   └── utils/
│       ├── env.dart           # String.fromEnvironment('API_BASE') reader
│       ├── date_utils.dart    # DateTime formatting (vi_VN locale)
│       └── logger.dart        # kDebugMode-gated logging (no PII)
├── features/                    # Feature-first modules (data/domain/presentation per feature)
│   ├── splash/
│   │   ├── data/
│   │   │   └── splash_repository.dart   # Auth state check on cold start
│   │   ├── domain/
│   │   │   └── splash_state.dart        # @freezed enum: Loading | Ready
│   │   └── presentation/
│   │       └── splash_screen.dart       # Splash UI + redirect logic
│   ├── auth/
│   │   ├── data/
│   │   │   ├── auth_remote_data_source.dart  # POST /login, /change-password, /logout
│   │   │   ├── auth_local_data_source.dart   # Keychain JWT CRUD
│   │   │   ├── auth_dto.dart                 # @freezed: LoginRequest, ChangePasswordRequest, LoginOutcome
│   │   │   └── auth_repository.dart          # Result<T> composition layer (unwraps DioException.error)
│   │   ├── domain/
│   │   │   ├── auth_state.dart          # @freezed: AuthLoading | AuthAuthenticated | ForceChangePassword | etc.
│   │   │   ├── auth_user.dart           # @freezed: email, phone, role, is_manager
│   │   │   ├── login_outcome.dart       # @freezed: { user, mustChangePassword }
│   │   │   └── auth_models.dart         # LoginCredentials, UserProfile
│   │   ├── presentation/
│   │   │   ├── auth_notifier.dart       # StateNotifier<AuthState>
│   │   │   │   - attemptLogin(email, password) → Result<LoginOutcome>
│   │   │   │   - completeLogin(outcome) → updates state, saves JWT
│   │   │   │   - login() [thin wrapper for tests]
│   │   │   │   - logout(), changePassword()
│   │   │   ├── login_page.dart          # Email + password form
│   │   │   │   (shows green banner above inputs on success, waits 1.2s)
│   │   │   │   (shows SnackBar at bottom on failure with server message)
│   │   │   ├── change_password_page.dart # Forced change-password on first login
│   │   │   └── auth_providers.dart      # @riverpod annotated providers
│   │   └── auth_providers.dart          # Feature root (auth_providers.g.dart generated)
│   ├── dashboard/
│   │   ├── data/
│   │   │   ├── dashboard_remote_data_source.dart  # GET /dashboard (parallel compose 3 endpoints)
│   │   │   ├── dashboard_dto.dart                 # DashboardResponse (today checkins, active requests, etc.)
│   │   │   └── dashboard_repository.dart          # Result<DashboardData> with caching
│   │   ├── domain/
│   │   │   ├── dashboard_state.dart      # @freezed: Loading | Loaded | Failed
│   │   │   └── dashboard_models.dart     # TodayCheckin, ActiveRequests, ManagerSummary
│   │   ├── presentation/
│   │   │   ├── dashboard_page.dart       # Role-aware layout (employee vs. manager)
│   │   │   ├── widgets/
│   │   │   │   ├── today_checkin_card.dart
│   │   │   │   ├── quick_actions_grid.dart
│   │   │   │   └── manager_summary_card.dart (R2)
│   │   │   └── dashboard_providers.dart
│   │   └── dashboard_providers.dart      # Feature root
│   ├── attendance/
│   │   ├── data/
│   │   │   ├── attendance_remote_data_source.dart  # GET /attendance, POST /checkins, fetchMonthly(month="YYYY-MM") (updated)
│   │   │   ├── attendance_local_db.dart   # drift: PendingCheckins table + dao
│   │   │   ├── attendance_dto.dart        # AttendanceRecord, CheckInRequest, MonthlyAttendanceDto, MonthlyDayDto (updated), MonthlySummaryDto (NEW)
│   │   │   ├── offline_retry_worker.dart  # Exponential backoff: 5s→25s→2m→10m→1h (capped)
│   │   │   └── attendance_repository.dart # Result<T> with offline queue logic
│   │   ├── domain/
│   │   │   ├── attendance_state.dart      # @freezed: Loading | Loaded | OfflineQueued | Failed
│   │   │   ├── check_in_result.dart       # @freezed: Online | OfflineQueued | Failure
│   │   │   ├── location_check.dart        # GPS accuracy validation, radius check
│   │   │   └── attendance_models.dart     # AttendanceData, TodayStatus, MonthlyHistory
│   │   ├── presentation/
│   │   │   ├── attendance_tab_page.dart   # Today + monthly tabs
│   │   │   ├── check_in_flow/
│   │   │   │   ├── check_in_flow_page.dart     # GPS → selfie → confirm → queue/upload
│   │   │   │   ├── gps_permission_widget.dart
│   │   │   │   ├── camera_capture_widget.dart  # camera package integration
│   │   │   │   ├── image_preview_widget.dart   # Resize + compress to JPEG before base64
│   │   │   │   ├── location_preview_step.dart  # Updated brand-theme; passes coords to map
│   │   │   │   ├── office_location_map.dart    # AppleMap iOS: user pin + office radius circle (NEW)
│   │   │   │   ├── wfh_redirect_dialog.dart    # Updated brand-theme
│   │   │   │   └── check_in_notifier.dart      # Orchestrate flow state
│   │   │   ├── monthly_view/
│   │   │   │   ├── monthly_calendar_page.dart  # Grid with attendance status badges
│   │   │   │   ├── calendar_stats_banner.dart  # 4-stat header: Công/Trễ/Vắng/Phép + hours + late mins (NEW)
│   │   │   │   └── calendar_grid_widget.dart   # Day cells w/ bold-attended styling, reads rows[]
│   │   │   ├── widgets/
│   │   │   │   ├── check_in_card.dart
│   │   │   │   ├── offline_queue_indicator.dart # Shows pending checks waiting sync
│   │   │   │   ├── location_radius_indicator.dart
│   │   │   │   └── day_detail_sheet.dart       # Reads workMinutes instead of workingHours
│   │   │   └── attendance_providers.dart
│   │   ├── database/
│   │   │   ├── attendance_database.dart   # drift @DriftDatabase (PendingCheckins + LocationsCache tables)
│   │   │   ├── schemas/
│   │   │   │   ├── pending_checkins_table.dart  # id, gps_lat, gps_lng, selfie_base64, created_at, status
│   │   │   │   └── locations_cache_table.dart   # id, name, gps_radius_m, updated_at (for preview)
│   │   │   └── migrations/
│   │   │       └── migration_v1_initial.dart
│   │   └── attendance_providers.dart     # Feature root
│   ├── leave/
│   │   ├── data/
│   │   │   ├── leave_remote_data_source.dart  # GET /leave/balances, GET /leave/types
│   │   │   ├── leave_dto.dart                 # LeaveBalance, LeaveType
│   │   │   └── leave_repository.dart          # Result<LeaveData> with caching
│   │   ├── domain/
│   │   │   ├── leave_state.dart          # @freezed: Loading | Loaded | Failed
│   │   │   └── leave_models.dart         # BalanceRow (type, available, used, pending)
│   │   ├── presentation/
│   │   │   ├── leave_balances_page.dart  # Grid: type | available | used | pending
│   │   │   └── leave_providers.dart
│   │   └── leave_providers.dart          # Feature root
│   ├── requests/
│   │   ├── data/
│   │   │   ├── request_remote_data_source.dart # GET /requests, POST /requests, PATCH /requests/{id}, DELETE /requests/{id}
│   │   │   ├── request_dto.dart                # RequestSummary, RequestDetail, CreateRequestPayload
│   │   │   ├── requests_database.dart   # drift: RequestTypesCache, LocalDrafts tables
│   │   │   └── request_repository.dart         # Result<T> with offline drafts support
│   │   ├── domain/
│   │   │   ├── request_state.dart        # @freezed: Loading | Loaded | CreatedSuccessfully | Failed
│   │   │   ├── request_models.dart       # RequestStatus, RequestDetail, AttachmentData
│   │   │   └── request_filters.dart      # enum: All | Pending | Approved | Rejected
│   │   ├── presentation/
│   │   │   ├── requests_tab_page.dart    # List with filter tabs
│   │   │   ├── request_detail_page.dart  # Detail + cancel button
│   │   │   ├── create_request/
│   │   │   │   ├── create_request_page.dart        # Form: type, dates, reason, attachments
│   │   │   │   ├── attachment_picker_widget.dart   # image_picker integration
│   │   │   │   ├── date_range_picker_widget.dart
│   │   │   │   └── create_request_notifier.dart
│   │   │   ├── widgets/
│   │   │   │   ├── request_card.dart
│   │   │   │   ├── request_status_badge.dart
│   │   │   │   └── request_timeline_widget.dart
│   │   │   └── requests_providers.dart
│   │   └── requests_providers.dart       # Feature root
│   ├── profile/
│   │   ├── data/
│   │   │   ├── profile_remote_data_source.dart  # GET /profile, PATCH /profile/phone
│   │   │   ├── profile_dto.dart                 # ProfileData, UpdatePhoneRequest
│   │   │   └── profile_repository.dart          # Result<T>
│   │   ├── domain/
│   │   │   ├── profile_state.dart        # @freezed: Loading | Loaded | UpdatedSuccessfully | Failed
│   │   │   └── profile_models.dart       # EmployeeProfile (email, phone, role, created_at)
│   │   ├── presentation/
│   │   │   ├── profile_page.dart         # Readonly display + logout button
│   │   │   ├── profile_edit_page.dart    # Edit phone form
│   │   │   ├── widgets/
│   │   │   │   └── profile_card.dart
│   │   │   └── profile_providers.dart
│   │   └── profile_providers.dart        # Feature root
│   ├── company/
│   │   ├── data/
│   │   │   ├── company_remote_data_source.dart  # GET /company/calendar, GET /company/documents (folder tree)
│   │   │   ├── company_dto.dart                 # CalendarEvent, DocumentFolder, DocumentFile
│   │   │   └── company_repository.dart          # Result<T> with caching
│   │   ├── domain/
│   │   │   ├── company_state.dart        # @freezed: Loading | Loaded | Failed
│   │   │   └── company_models.dart       # CalendarData, DocumentTree, DocumentNode
│   │   ├── presentation/
│   │   │   ├── company_calendar_page.dart    # Month calendar + event list
│   │   │   ├── company_documents_page.dart   # Folder tree + download buttons (share_plus)
│   │   │   ├── widgets/
│   │   │   │   ├── calendar_day_cell.dart
│   │   │   │   ├── document_tree_widget.dart
│   │   │   │   └── document_file_tile.dart
│   │   │   └── company_providers.dart
│   │   └── company_providers.dart        # Feature root
│   ├── manager/ (R2)
│   │   ├── data/
│   │   │   ├── manager_remote_data_source.dart  # GET /reports, /live-team, /live-shifts (endpoints)
│   │   │   ├── manager_dto.dart                 # ManagerDashboard, ApprovalItem, ShiftData
│   │   │   ├── manager_repository.dart          # Result<T>
│   │   │   └── live_shifts_api.dart             # LiveShiftsApi.weekly(), .monthlySummary()
│   │   ├── domain/
│   │   │   ├── manager_state.dart        # @freezed: Loading | Loaded | ActionInProgress | Failed
│   │   │   ├── manager_models.dart       # TeamMember, Shift, ApprovalDetail
│   │   │   └── manager_actions.dart      # ApproveRequest, RejectRequest, ApproveShift, etc.
│   │   ├── presentation/
│   │   │   ├── live_shifts/
│   │   │   │   ├── live_shifts_page.dart         # Channel filter chips (TikTok/Facebook/Shopee/Other)
│   │   │   │   ├── tabs/
│   │   │   │   │   ├── weekly_shifts_tab.dart        # Week picker + grouped by date
│   │   │   │   │   ├── planned_shifts_tab.dart       # status='planned', next 30 days
│   │   │   │   │   ├── pending_approval_tab.dart     # status='worked' (approve/reject embedded)
│   │   │   │   │   └── monthly_summary_tab.dart      # Month picker + per-employee totals
│   │   │   │   └── shift_list_tile.dart              # Reusable shift item with approval actions
│   │   │   ├── live_team/
│   │   │   │   ├── live_team_page.dart           # Roster with search + role filter
│   │   │   │   └── team_member_card.dart         # Member detail in modal
│   │   │   ├── reports/
│   │   │   │   ├── reports_page.dart              # Manager-only landing with 3 entry cards
│   │   │   │   ├── attendance_report_page.dart    # Monthly attendance GET /api/hr/reports/monthly-attendance
│   │   │   │   ├── leave_balance_report_page.dart # GET /api/hr/reports/leave-balance
│   │   │   │   └── requests_report_page.dart      # GET /api/hr/reports/requests (status filter chips)
│   │   │   ├── widgets/
│   │   │   │   ├── approval_action_buttons.dart  # Approve/reject inline
│   │   │   │   ├── shift_status_badge.dart
│   │   │   │   └── team_summary_card.dart
│   │   │   └── manager_providers.dart
│   │   └── manager_providers.dart        # Feature root (includes isLiveMemberProvider)
│   ├── settings/
│   │   ├── presentation/
│   │   │   ├── settings_page.dart         # MVP: Đổi mật khẩu, Đăng xuất, app-version footer
│   │   │   │   (reuses NotificationsSettingsTile from notifications feature)
│   │   │   │   (reuses confirm dialog for logout)
│   │   │   └── settings_providers.dart
│   │   └── settings_providers.dart        # Feature root
│   ├── reports/
│   │   ├── data/
│   │   │   ├── reports_api.dart           # API wrapper for 3 report endpoints
│   │   │   └── reports_repository.dart
│   │   ├── presentation/
│   │   │   ├── reports_page.dart          # ConsumerWidget, role-aware (employee: Cá nhân section, manager: Quản lý + pending banner)
│   │   │   ├── attendance_report_page.dart
│   │   │   ├── leave_balance_report_page.dart
│   │   │   ├── requests_report_page.dart  # Status filter chips
│   │   │   └── reports_providers.dart
│   │   └── reports_providers.dart         # Feature root
│   └── notifications/
│       ├── data/
│       │   ├── notification_remote_data_source.dart  # POST /register-device, DELETE /register-device
│       │   └── notification_repository.dart          # Result<T>
│       ├── domain/
│       │   ├── notification_state.dart    # @freezed: Registered | RegistrationFailed
│       │   ├── deep_link_intent.dart      # @freezed enum: ApprovalDetail | CheckInReminder (updated paths)
│       │   └── notification_models.dart
│       ├── presentation/
│       │   ├── notification_handler.dart   # FCM message listener + deep-link dispatcher
│       │   ├── local_notification_service.dart  # flutter_local_notifications (foreground banner)
│       │   └── notification_providers.dart
│       └── notifications_providers.dart    # Feature root
├── shared/
│   └── widgets/
│       ├── skeleton_shimmer.dart          # Loading placeholder (gradient animate)
│       ├── gu_loading_indicator.dart      # Custom branded spinner
│       ├── error_state_widget.dart        # AppFailure display + retry button
│       ├── empty_state_widget.dart        # No data illustration + action
│       ├── confirm_dialog_widget.dart     # Async alert for destructive actions
│       └── internet_status_banner.dart    # connectivity_plus watch
└── instrumentation/
    ├── crashlytics_service.dart         # Firebase.initializeApp() gate + PII redaction
    ├── analytics_service.dart           # logEvent wrapper (kDebugMode gated)
    └── telemetry_service.dart           # Unified instrumentation interface
```

---

## Key Design Patterns

### 1. Feature-First Organization
Each feature (`auth`, `attendance`, `requests`, etc.) is self-contained:
- **data/:** API integration (remote data source), local storage (drift tables), DTOs, repository (Result<T>)
- **domain/:** Core models (@freezed sealed classes for state/errors), business logic
- **presentation/:** Pages, widgets, Riverpod state notifiers
- **{feature}_providers.dart:** Riverpod root (@riverpod annotated)

**Benefit:** Clear boundaries, team parallel work, easy to test and refactor.

### 2. Riverpod Providers
- **Annotated providers:** `@riverpod` macro on functions in `*_providers.dart` → auto-generates `.g.dart`
- **Feature composition:** Each feature exposes providers via its `{feature}_providers.dart` entry
- **Root providers:** `app/providers.dart` → `dio`, `secureStorage`, `connectivity` (shared across features)
- **Dependency injection:** Feature repos depend on `ref.read(dioProvider)`, no globals

**Benefit:** Compile-safe, testable (easy mock), auto-dispose avoids memory leaks.

### 3. Dio Interceptor Chain
```
Request enters Dio
├─ AuthInterceptor: reads JWT from Keychain, injects Bearer header
├─ RefreshInterceptor: catches 401, attempts refresh, retries (NOTE: no endpoint yet)
├─ CacheInterceptor: respects HTTP cache-control headers
└─ ErrorMapperInterceptor: DioException → AppFailure sealed
    ↓
Network call
    ↓
Response exits interceptors (same order reversed)
```

**Benefit:** Centralized auth/error handling, cacheable GET requests without per-method logic.

### 4. Result<T> Type for Repositories
Instead of throwing:
```dart
// Bad
Future<User> getUser() async {
  throw NetworkError("...");
}

// Good
Future<Result<User>> getUser() async {
  return Err(AppFailure.network("..."));
}
```

**Benefit:** No try-catch spam, exhaustive pattern matching, compile-time safety.

### 5. Sealed Classes for State & Errors
```dart
@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated(AuthUser user) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
}

// Usage: exhaustive pattern matching
state.when(
  loading: () => LoadingWidget(),
  authenticated: (user) => HomeScreen(),
  unauthenticated: () => LoginScreen(),
);
```

**Benefit:** Compiler enforces all cases covered, no default fallthrough bugs.

### 6. Offline Check-in Queue
**Drift tables:**
- `pending_checkins`: stores GPS + selfie (base64 + metadata) + UUID for idempotency
- `locations_cache`: office locations + GPS radius (refreshed on login)

**Retry logic:**
- On check-in, immediately save to `pending_checkins`, show "offline queue" UI
- When online (connectivity_plus detects), `OfflineRetryWorker` triggers:
  - 5s wait → 1st retry
  - 25s wait → 2nd retry
  - 2m wait → 3rd retry
  - 10m wait → 4th retry
  - 1h wait → final retry (cap)
- Server responds `200 OK` → delete from queue
- Server responds `400` with "Đã check-in lúc..." → idempotent, delete from queue
- Server responds `4xx` or timeout → increment backoff, schedule next retry

**Benefit:** No lost data, resilient on flaky networks, idempotent design prevents duplicates.

### 7. Role-Based Navigation Gating
```dart
@riverpod
bool isManager(Ref ref) {
  final auth = ref.watch(authNotifierProvider);
  return auth.whenData((state) {
    if (state case AuthAuthenticated(:final user)) {
      return user.isManager;
    }
    return false;
  });
}
```

**StatefulShellRoute config:**
- 5 bottom-tab branches: Home, Attendance, Requests, Leaves, Profile
- 6th branch (Manager) conditionally hidden via `showLabel: !isManager`
- Non-managers deep-linking to `/manager/*` auto-route to `/home`

**Benefit:** Single navigation tree, compile-safe role checking, no manual route guarding.

### 8. Firebase Gating
```dart
@riverpod
bool firebaseConfigured(Ref ref) {
  // Check if real options loaded (not placeholder)
  return Firebase.apps.isNotEmpty && 
         Firebase.app().options.projectId.isNotEmpty;
}

// Usage:
if (firebaseConfigured) {
  await FirebaseCrashlytics.instance.recordError(error, stackTrace);
}
```

**Benefit:** Prevents NSException crash on dev machines with placeholder `firebase_options.dart`.

### 9. SQLite DTO Defensive Parsing (bool-as-int)
Server backend uses SQLite → boolean fields return as int (0/1) instead of true/false. All DTOs with bool fields include helper + @JsonKey:

```dart
bool _toBool(Object? v) => v == true || v == 1 || v == '1';

// Then apply to each bool field:
@JsonKey(fromJson: _toBool)
required bool fieldName
```

**Applied in:**
- `location_dto.dart` → `is_active`
- `checkin_response_dto.dart` → `ok`, `photo_saved`
- `attendance_record_dto.dart` → `is_lack_working_point`
- `live_team_dto.dart` → `active`
- `login_response.dart` → `must_change_password`

**Benefit:** Handles SQLite int 0/1 seamlessly; no client-side int→bool casting logic.

### 10. Router: Fixed 5-Slot Bottom Nav with MoreSheet (R2 Final)
All routes nest under `StatefulShellRoute.indexedStack` (9 branches). Bottom nav shows 5 slots + MoreSheet modal for additional items. Slot 4 "Báo cáo" is now UNIVERSAL (all roles):

```
StatefulShellRoute (9 branches: 5 visible in nav, 4 hidden)
├─ Branch 0: /home → HomeScreen
├─ Branch 1: /requests → RequestsTabPage
├─ Branch 2: /attendance → AttendanceTabPage
├─ Branch 3: /leave → LeaveBalancesPage
├─ Branch 4: /reports → ReportsPage (UNIVERSAL: role-aware content for employee + manager)
│  ├─ Sub: /reports/attendance (employee: personal; manager: team monthly)
│  ├─ Sub: /reports/leave-balance (employee: personal; manager: team)
│  ├─ Sub: /reports/requests
│  └─ Sub: /reports/live-shifts (manager only)
├─ Branch 5: /profile (hidden, in MoreSheet for both roles) — MOVED from slot 3
├─ Branch 6: /docs (hidden, accessed via MoreSheet)
├─ Branch 7: /live-team (hidden, accessed via MoreSheet)
└─ Branch 8: /settings (hidden, accessed via MoreSheet)
```

**MoreSheet:** Now always appends profile entry (both employee + manager); was conditional in R1.

**TabShellScreen:** Simplified `_toBranchIndex` / `_toVisibleIndex` — slot 3 → branch 3 unconditionally (no role check).

**Deprecation redirects** (1-release transition):
- `/home/leave` → `/leave`, `/home/company/docs` → `/docs`, `/manager` → `/reports`, `/manager/approvals` → `/reports/approvals`, `/manager/live-team` → `/reports/live-team`, `/manager/live-shifts` → `/live-shifts`

**Benefit:** Fixed nav, universal Báo cáo slot, profile always in MoreSheet, bottom nav persists for escape routes.

### 11. JSON Field Naming (snake_case)
**build.yaml:**
```yaml
targets:
  $default:
    builders:
      json_serializable|json_serializable:
        options:
          field_rename: snake
```

Server sends `{"email_address": "..."}` → Flutter model has `emailAddress` field (automatically renamed).

**Benefit:** No per-field `@JsonKey('email_address')` boilerplate, consistency across all models.

### 12. Material 3 Design System (HR-Web Brand Adoption)
- **Colors:** Primary `#E8642C` (hr-web brand orange), Secondary `#77564A` (warm brown), Tertiary `#006D44` (green for approvals)
  - Primary variants: PrimaryFixedDim `#F0845A`, OnPrimaryFixedVariant `#C94D1A`
  - Surface tones warmed to beige for brand harmony
- **Typography:** Inter font (6 scales: display-lg, headline-md, title-sm, body-md, body-sm, label-caps)
- **Spacing:** 8px base unit (8, 16, 24, 32, 48)
- **Radii:** 2px (sm) → 4px → 8px → 12px (xl)
- **Elevation:** 0 (surface) → 5 (modal)
- **Vietnamese-first copy:** All user-facing strings start vi_VN, en_US fallback
- **Source of truth:** `lib/app/theme/colors.dart` (not DESIGN.md)

**Benefit:** Consistent with hr-web brand, Material 3 compliance, accessible contrast ratios.

---

## Inter-Feature Dependencies

```
                    ┌─ AuthState ─┐
                    │             │
              auth_notifier        │ (watched by all)
                │   │   │         │
        ┌───────┴───┴───┴─────────┘
        │
        ├─→ dashboard (composed from 3 endpoints in parallel)
        │    └─→ leave (GET /leave/balances)
        │    └─→ requests (GET /requests?status=pending)
        │    └─→ attendance (GET /attendance/today)
        │
        ├─→ attendance
        │    ├─→ locations_cache (drift, refreshed on login)
        │    ├─→ pending_checkins (drift, offline queue)
        │    └─→ offline_retry_worker (connectivity_plus watch)
        │
        ├─→ requests
        │    ├─→ request_types_cache (drift)
        │    └─→ local_drafts (drift)
        │
        ├─→ profile
        │    └─→ secure_storage (edit phone → Keychain)
        │
        ├─→ company
        │    └─→ cache_interceptor (GET /calendar + /documents)
        │
        ├─→ manager (R2)
        │    ├─→ isManagerProvider (guards nav + features)
        │    ├─→ dashboard (manager-specific view)
        │    ├─→ approvals_inbox (derived from requests)
        │    └─→ team + shifts (new manager-only endpoints)
        │
        └─→ notifications
             ├─→ firebase_messaging (FCM receiver)
             ├─→ flutter_local_notifications (foreground banner)
             ├─→ deep_link_dispatcher (routes to approvals, etc.)
             └─→ notification_repository (register-device endpoint)

Core layer (used by all):
├─ dio (HTTP client + interceptor chain)
├─ secure_storage (JWT Keychain)
├─ connectivity_plus (offline detection)
└─ app_failure + result (error types)
```

---

## Code Generation Dependencies

**build_runner is required for:**
1. **freezed** — generates `@freezed` sealed classes (state, errors, models)
2. **json_serializable** — generates `.fromJson()` / `.toJson()` for DTOs
3. **riverpod_generator** — generates Riverpod providers from `@riverpod` annotations
4. **drift** — generates database DAOs + migration logic

**Trigger regeneration after changes to:**
- Any `@freezed` class definition
- Any `@freezable` class with JSON serialization
- Any function annotated `@riverpod`
- Drift schema files (`*_table.dart` or `*_database.dart`)

```bash
dart run build_runner build --delete-conflicting-outputs
# Or watch mode during development:
dart run build_runner watch --delete-conflicting-outputs
```

---

## Testing Structure

**Unit tests:** `test/` directory mirrors `lib/` structure
- **data/:** Repository tests (mock remote/local, verify Result<T>)
- **domain/:** Model tests (JSON round-trip, sealed class matching)
- **presentation/:** Widget tests (Riverpod mock, verify state transitions)

**Example test locations:**
- `test/features/auth/data/auth_repository_test.dart`
- `test/features/auth/domain/auth_user_test.dart`
- `test/features/auth/presentation/login_page_test.dart`

**Coverage:** 164 tests, all passing, 0 flaky (verified on CI).

---

### 11. Request Type Icons (Material Icons, Not Emoji)
Request list tiles and type pickers now use Material Icons keyed by request `type` code (e.g., `late_arrival` → `schedule`, `leave_annual` → `beach_access`, `ot` → `bolt`, `wfh` → `home_work_outlined`). Helper `_iconForRequestType(code)` ensures consistent rendering when emoji glyphs fail across devices.

**Applied in:**
- `request_list_tile.dart` — displays icon beside request type name
- `type_picker_step.dart` — shows icon in type selection dropdown

**Benefit:** Consistent rendering, fallback if emoji glyphs unavailable.

### 12. WFH Check-in Flow (Smart Pre-approval Check)
`hasApprovedWfhTodayProvider` in `attendance_providers.dart`:
- Queries `/api/hr/requests?status=approved&type=wfh&month=YYYY-MM`
- Filters where today ∈ [start_date, end_date]
- `WfhRedirectDialog` pre-checks provider before showing actions:
  - Approved exists → "Huỷ" / "Chấm công WFH" (submit allowed)
  - No approved → "Huỷ" / "Tạo đơn WFH" (no submit path → no late 403 surprise)

**Benefit:** Prevents 403 errors on submit; guides users to create request first if needed.

### 13. Riverpod Lifecycle Mutation Safety
Riverpod prohibits state mutations in `build()` or `initState()`. When initializing flows with side effects, wrap in `WidgetsBinding.instance.addPostFrameCallback()`:

```dart
// Bad (build-phase mutation)
@override
void initState() {
  super.initState();
  ref.read(startFlowProvider.notifier).startFlow();  // ✗ Crashes
}

// Good (post-frame callback)
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(startFlowProvider.notifier).startFlow();  // ✓ Safe
  });
}
```

**Example:** `CreateRequestPage.initState()` uses this pattern to avoid Riverpod mutation errors during page mount.

### 14. Monthly Attendance API Shape & Provider
`AttendanceApi.fetchMonthly({required String month})` signature changed (month param is `"YYYY-MM"` format). Server response shape:
```dart
// Old (R1): { year, month, days[] }
// New (R2): { rows[], summary? }
```

**MonthlyAttendanceDto:** Top-level response container.
- `rows: List<MonthlyDayDto>` — daily attendance records
- `summary: MonthlySummaryDto?` — optional server-computed totals

**MonthlyDayDto:**
- Removed: `workingHours: double` (was client convenience)
- Added: `workMinutes: int`, `otMinutes: int` (server-native, mirrors minutes not hours)
- Other: date, status, reason, etc.

**MonthlySummaryDto (NEW):**
- `totalDays, present, late, absent, leave: int`
- `totalWorkMinutes, totalOtMinutes, totalLateMinutes: int`

**monthlyAttendanceProvider:** `Ref, {required String month}` → returns `MonthlyAttendanceDto`.

**CalendarStatsBanner (NEW):** Prefers server `summary` if present; else rolls up from `rows[]` locally (defensive).

### 15. Multi-Office Check-in Resolver
Previously, `resolveLocationCheck` only checked NEAREST office's radius. Edge case: user inside office B's radius but A is geographically closer → incorrectly reported "outside" against A.

**New algorithm:** Any office where `distance ≤ office.gpsRadiusM` qualifies; if multiple match, pick closest. Falls back to nearest office (any radius) for the "outside" reference shown in WFH dialog.

**Impact:** Users can now check in at N valid locations (all within ~50m of any office boundary).

### 16. Locations Cache TTL Reduction
`LocationsCacheDao.getFreshOrNull()` TTL reduced from 24h → 1h. Trade-off: 1 extra GET /locations per hour per device in exchange for admin-added offices being reachable without logout.

### 17. Apple Maps Integration (iOS Only)
New dep `apple_maps_flutter: ^1.3.0`. New widget `office_location_map.dart` renders `AppleMap` with:
- User pin (red marker) at current GPS lat/lng
- Office annotation + radius `Circle` (brand-tinted alpha 0.18) when office resolved
- `myLocationEnabled: true` fallback (Apple's blue dot if custom annotation fails)
- Dynamic camera: midpoint of user+office when within ~50° bearing; falls back to user-centred. Zoom: `log2(360 / maxDelta) - 1`, clamped 4..17.

**Integration:** `LocationPreviewStep` passes user + nearest `LocationDto` coords into map. Icon placeholder visible until GPS resolves.

### 18. Brand Colour Adoption Tightened
Theme buttons now inherit brand orange (#E8642C) from `FilledButtonTheme`, `TextButtonTheme`, `FloatingActionButtonTheme`. Removed hardcoded `Colors.orange.shade700` from `location_preview_step.dart` (WFH button) and `wfh_redirect_dialog.dart` (Chấm công WFH button). Card shadow tinted brand; `scaffoldBackgroundColor` → warm beige; `dividerColor` → outlineVariant. Semantic colours retained (success SnackBar green, low-accuracy warning orange.shade50, pending-sync chip orange shades).

### 19. Profile Logout Dialog Context Fix
`ProfilePage._confirmLogout` captured outer page `BuildContext` for `Navigator.pop()`, which popped the `StatefulShellRoute`'s last page → black screen. Fixed by capturing dialog `ctx` from builder and using `Navigator.pop(ctx, ...)`. **Pattern:** Always capture dialog builder ctx; never pop with outer page ctx.

### 20. CreatedRequest DTO Server Contract Mismatch Fix
`POST /api/hr/requests` response from server omits `status` field, returning only `{id, request_code, firstApproverId?}`. Old DTO required `status: String`, causing `type 'Null' is not a subtype of type 'String'` parse error. Fixed: `@Default('pending') String status` (matches DB default for new rows), `@JsonKey(name: 'request_code') String? requestCode` (camelCase-to-snake auto-fail worked for most fields, but `request_code` wasn't handled). Also added `@JsonKey(name: 'firstApproverId')` to handle server's camelCase override of global build.yaml snake_case setting.

**Lesson:** Server response shapes != request shapes. Trust actual API contract; default missing required fields to server's documented defaults.

---

## Unresolved Questions

- **Device orientation:** Currently portrait-only (auto_orientation + screen_brightness packages not integrated yet)
- **Biometric auth:** Phase-02 uses password only; fingerprint/Face ID deferred to R3
- **Batch operations:** Manager can only approve/reject single shifts; batch not implemented
- **Offline-first sync:** Currently offline queue only for check-in; requests/leave not queued when offline
- **In-app messaging:** Firebase In-App Messaging not integrated; only push notifications (FCM)
