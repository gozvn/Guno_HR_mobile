# Testing Guide — GU HR Mobile

**Updated:** 2026-04-24  
**Test Count:** 164 (all passing, 0 flaky)  
**Coverage:** ≥82%

## Test Matrix

| Layer | Tool | Location | Run in CI |
|-------|------|----------|-----------|
| Unit | flutter_test + mocktail | `test/` | Yes |
| Widget | flutter_test | `test/widget/` | Yes |
| Integration | integration_test | `integration_test/` | Manual only |

## Running Tests Locally

### All unit + widget tests

```bash
flutter test
```

### With coverage report

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Single test file

```bash
flutter test test/features/auth/auth_notifier_test.dart
```

### With verbose output

```bash
flutter test --reporter expanded
```

## Unit Tests

### Location: `test/`

| File | Covers |
|------|--------|
| `test/features/auth/auth_repository_test.dart` | JWT storage, login OK/fail, clearSession |
| `test/features/auth/auth_notifier_test.dart` | login transitions, mustChangePassword, logout, analytics |
| `test/features/attendance/check_in_submitter_test.dart` | online/offline paths, 400/5xx handling, checkout routing |
| `test/features/attendance/offline_retry_worker_test.dart` | backoff formula (5^n capped 3600s) |
| `test/features/attendance/photo_compressor_test.dart` | resize ≤1024px, output ≤2MB, portrait/landscape |
| `test/features/attendance/attendance_database_test.dart` | in-memory Drift DAO CRUD |
| `test/core/auth_interceptor_test.dart` | public vs protected paths, Bearer header |
| `test/core/error_mapper_interceptor_test.dart` | timeout/401/403/5xx → AppFailure variants |
| `test/features/requests/requests_database_test.dart` | Drift DAO for requests |
| `test/features/requests/request_status_test.dart` | status parsing |
| `test/features/requests/create_request_payload_test.dart` | DTO serialization |
| `test/features/manager/manager_role_test.dart` | isManager logic |
| `test/features/manager/requests_api_approve_reject_test.dart` | approve/reject API calls |
| `test/features/notifications/notification_type_test.dart` | type parsing |
| `test/features/notifications/push_payload_test.dart` | payload deserialization |
| `test/features/notifications/deep_link_dispatcher_test.dart` | intent routing |
| `test/features/notifications/token_sync_service_test.dart` | FCM token registration flow |
| `test/features/company/company_doc_tree_test.dart` | tree node builder |

### Test Helpers

| Helper | Purpose |
|--------|---------|
| `test/helpers/pump_app.dart` | `pumpApp()` — ProviderScope + GuHrTheme + MaterialApp |
| `test/helpers/fakes/fake_secure_storage.dart` | In-memory FlutterSecureStorage |
| `test/helpers/fakes/fake_analytics_service.dart` | Records analytics calls for assertion |
| `test/helpers/fakes/fake_crashlytics_service.dart` | No-op Crashlytics for tests |
| `test/helpers/fakes/fake_connectivity.dart` | Controllable online/offline stream |

## Widget Tests

### Location: `test/widget/`

| File | Covers |
|------|--------|
| `test/widget/login_page_test.dart` | Form validation, error display, repo.login called |
| `test/widget/change_password_page_test.dart` | PopScope canPop, mismatch validation, min-length |
| `test/features/manager/approval_action_sheet_test.dart` | Reject btn disabled until comment, approve always enabled |

## Integration Tests

### Location: `integration_test/`

**NOT run in CI by default** — requires real device + API credentials.

```bash
# Prerequisites: provisioned dev API + test accounts
flutter test integration_test/happy_path_test.dart \
  --dart-define=API_BASE=https://dev.api.guop.app \
  --dart-define=TEST_USER_EMAIL=employee@guop.app \
  --dart-define=TEST_USER_PASSWORD=testpass123 \
  -d <device-id>
```

Steps covered (once implemented):
1. App launch → splash → login page
2. Enter credentials → tap Đăng nhập → dashboard
3. Tap check-in → grant permissions → confirm location → selfie → submit
4. Verify success banner
5. Logout → login page

## CI Configuration

Tests run automatically on every PR and push to `main`/`dev` via:
`.github/workflows/flutter-ci.yml`

### What CI runs:
1. `flutter pub get`
2. `dart run build_runner build --delete-conflicting-outputs`
3. `flutter analyze`
4. `flutter test --coverage`
5. Coverage upload to Codecov

## Coverage Targets

| Package | Target |
|---------|--------|
| `lib/core/` | ≥ 80% |
| `lib/features/auth/` | ≥ 75% |
| `lib/features/attendance/services/` | ≥ 70% |
| `lib/features/requests/data/` | ≥ 70% |
| `lib/instrumentation/` | ≥ 60% (Firebase calls mocked) |

## Debugging Failing Tests

```bash
# Run with verbose output
flutter test --reporter expanded test/features/auth/auth_notifier_test.dart

# Check for unresolved mocks
flutter test --reporter json | jq '.testStart[] | select(.test.name | contains("mock"))'
```

Common pitfalls:
- `MissingStubError`: add `when(() => mock.method(...)).thenAnswer(...)` in `setUp`
- `Null check operator`: provider not overridden — add to `ProviderScope(overrides: [...])`
- `FlutterSecureStorage` platform exception in unit test: use `FakeSecureStorage` instead

## Debug Logging (Temporary)

The following debug logs are present for dev testing and **must be removed before production**:

**Tagged debug prints (prefix with [TAG]):**
- `[Firebase]` — main.dart: Firebase init gating status
- `[HTTP-ERR]` — error_mapper_interceptor.dart: HTTP errors (method, URL, status, body)
- `[DBG todaySummary/requestSummary/myTodayAttendance]` — dashboard_api.dart: API response payloads
- `[DBG types]` — requests_api.dart: Request type parsing
- `[RETRY-DEAD]` — offline_retry_worker.dart: Terminal (non-retry) errors

**Search for cleanup:**
```bash
# Find all debugPrint/print statements
grep -r "debugPrint\|print(" lib/ | grep -E "\[.*\]"
```

**Disable before TestFlight:**
1. Remove all `debugPrint()` / `print()` statements
2. Set `kDebugMode = false` in release build
3. Verify via `flutter build ios --release`
