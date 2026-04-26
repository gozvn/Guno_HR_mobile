# Code Standards — GU HR Mobile

**Last Updated:** 2026-04-24  
**Language:** Dart 3.11.5  
**Framework:** Flutter 3.41.7  
**Tool:** `dart analyze` + `flutter format`

---

## File Naming & Organization

### Dart Files
- **Convention:** snake_case for file names (Dart/Flutter ecosystem standard)
- **Examples:**
  - `auth_notifier.dart` (not `AuthNotifier.dart`)
  - `check_in_flow_page.dart` (not `CheckInFlowPage.dart`)
  - `pending_checkins_table.dart` (not `PendingCheckinsTable.dart`)
- **Target length:** <200 LOC per file (split if exceeds; see modularization below)
- **Self-documenting names:** Prefix indicates purpose: `*_page.dart` (screen), `*_notifier.dart` (state), `*_dto.dart` (serializable model), `*_repository.dart` (data layer)

### Feature Folder Structure
```
lib/features/{feature}/
├── data/
│   ├── {feature}_remote_data_source.dart   # API calls
│   ├── {feature}_local_data_source.dart    # Local DB / Keychain ops
│   ├── {feature}_dto.dart                  # @freezed serializable models
│   ├── {feature}_repository.dart           # Result<T> composition
│   └── {feature}_database.dart             # Drift schema (if needed)
├── domain/
│   ├── {feature}_state.dart                # @freezed sealed state
│   ├── {feature}_models.dart               # Business logic models
│   └── {feature}_error.dart                # (if custom errors beyond AppFailure)
├── presentation/
│   ├── {feature}_page.dart                 # Main screen
│   ├── {feature}_notifier.dart             # StateNotifier or @riverpod async
│   ├── widgets/                            # Sub-components
│   │   └── *.dart
│   └── {feature}_providers.dart            # Feature's Riverpod root
└── {feature}_providers.dart                # Feature entry point (mirrors presentation/)
```

---

## Dart Language Conventions

### Naming
| Element | Convention | Example |
|---------|-----------|---------|
| **Classes** | PascalCase | `AuthNotifier`, `CheckInResult`, `AppFailure` |
| **Enums** | PascalCase | `RequestStatus`, `AuthState` |
| **Functions** | camelCase | `loginUser()`, `validateEmail()` |
| **Variables** | camelCase | `emailAddress`, `isLoading`, `checkInResult` |
| **Constants** | lowerCamelCase | `defaultTimeout = Duration(...)` |
| **Private members** | Leading `_` | `_jwtToken`, `_validateInput()` |
| **Files** | snake_case | `auth_notifier.dart` |

### Imports
- **Group by type:** dart, packages, relative imports
- **Alphabetize within groups**
```dart
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/errors/app_failure.dart';
import 'auth_notifier.dart';

part 'auth_notifier.g.dart';  // Generated code
```

### Line Length
- **Hard limit:** 120 characters
- **Soft limit:** 80 characters for readability
- Use string interpolation over concatenation:
```dart
// Bad
final msg = 'Error: ' + error.toString() + ' at ' + DateTime.now().toString();

// Good
final msg = 'Error: $error at ${DateTime.now()}';
```

---

## Freezed & Sealed Classes

### All State & Errors Use @freezed Sealed
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated(AuthUser user) = AuthAuthenticated;
  const factory AuthState.forceChangePassword(String email) = AuthForceChangePassword;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error(String message) = AuthError;
}
```

### Usage in Widgets
```dart
// Bad: if-else chain, runtime errors if case missing
if (state is AuthLoading) {
  return LoadingWidget();
} else if (state is AuthAuthenticated) {
  return HomeScreen();
}
// What if AuthForceChangePassword? Silently shows nothing.

// Good: exhaustive pattern matching, compile-time guarantee
state.when(
  loading: () => LoadingWidget(),
  authenticated: (user) => HomeScreen(),
  forceChangePassword: (email) => ChangePasswordScreen(email: email),
  unauthenticated: () => LoginScreen(),
  error: (msg) => ErrorScreen(message: msg),
);
```

### Models Always Immutable
```dart
@freezed
class User with _$User {
  const factory User({
    required String email,
    required String phone,
    required bool isManager,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// User is immutable, copyWith() auto-generated
final user = User(email: 'a@b.com', phone: '123', isManager: false);
final updated = user.copyWith(phone: '456');  // Creates new instance
```

---

## Riverpod Providers

### Use @riverpod Annotations (Code-Gen Preferred)
```dart
// Good: compile-time safe, auto-disposes
@riverpod
Future<AuthUser> authUser(Ref ref) async {
  final repo = ref.watch(authRepositoryProvider);
  return repo.getCurrentUser();
}

// Then in a widget:
class UserScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(authUserProvider);
    return userAsync.when(
      data: (user) => Text('Hi ${user.email}'),
      loading: () => LoadingWidget(),
      error: (err, st) => ErrorWidget(error: err),
    );
  }
}
```

### StateNotifier for Complex State Mutations
```dart
// For state that changes via user actions (form editing, etc.)
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authRepo) : super(const AuthState.loading());

  final AuthRepository _authRepo;

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    final result = await _authRepo.login(email, password);
    state = result.when(
      ok: (user) => AuthState.authenticated(user),
      err: (failure) => AuthState.error(failure.message),
    );
  }
}

// Riverpod provider:
@riverpod
StateNotifier<AuthState> authNotifier(Ref ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthNotifier(repo);
}
```

### Avoid Manual StateNotifier Subclasses (unless complex)
Use `@riverpod` async function when possible:
```dart
// Preferred: async provider, auto-handles loading/error/data
@riverpod
Future<List<Request>> myRequests(Ref ref) async {
  final repo = ref.watch(requestRepositoryProvider);
  return repo.getMyRequests();
}

// Only use StateNotifier if you need methods (login, logout, etc.):
class AuthNotifier extends StateNotifier<AuthState> { ... }
```

---

## Error Handling

### Always Return Result<T> from Repositories
```dart
// Bad: throws, callers must try-catch
Future<User> login(String email, String password) async {
  final response = await dio.post('/login', ...);
  if (response.statusCode != 200) throw NetworkError();
  return User.fromJson(response.data);
}

// Good: returns Result<T>, exhaustive matching
Future<Result<User>> login(String email, String password) async {
  try {
    final response = await dio.post('/login', ...);
    if (response.statusCode == 200) {
      return Ok(User.fromJson(response.data));
    } else {
      return Err(AppFailure.server(response.statusCode, response.data['message']));
    }
  } on DioException catch (e) {
    return Err(AppFailure.network('Connection failed'));
  } catch (e) {
    return Err(AppFailure.unknown(e));
  }
}
```

### AppFailure Sealed Class
Use only these failure types (in `lib/core/errors/app_failure.dart`):
```dart
@freezed
sealed class AppFailure with _$AppFailure {
  const factory AppFailure.network(String message) = _Network;
  const factory AppFailure.unauthorized() = _Unauthorized;
  const factory AppFailure.forbidden(String? required) = _Forbidden;
  const factory AppFailure.server(int code, String? message) = _Server;
  const factory AppFailure.validation(String message) = _Validation;
  const factory AppFailure.unknown(Object error) = _Unknown;
}
```

**Never catch and silently ignore:**
```dart
// Bad
try {
  await repo.login(email, password);
} catch (e) {
  // Silent failure — user sees nothing
}

// Good
final result = await repo.login(email, password);
result.when(
  ok: (user) => showSuccessMessage('Welcome!'),
  err: (failure) => showErrorDialog(failure),
);
```

---

## Firebase & Instrumentation

### Gated by kDebugMode (Dev-Only in Debug Builds)
```dart
// lib/core/utils/logger.dart
void logError(Object error, StackTrace? stackTrace) {
  if (kDebugMode) {
    print('ERROR: $error\n$stackTrace');
  }
  // In Release builds, only send to Firebase Crashlytics (with redaction)
  if (!kDebugMode && firebaseConfigured) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}
```

### PII Redaction (Never Log)
**Never log or send to Crashlytics:**
- JWT tokens (`_jwtToken`, `bearerToken`)
- Passwords (`password`, `oldPassword`, `newPassword`)
- FCM tokens (`fcmToken`, `deviceToken`)
- GPS coordinates (only log office name, not lat/lng)
- Attachment URLs (log filename, not full URL)
- Email addresses (log user ID, not email)

**Safe to log:**
- Request method + path: `POST /api/hr/checkins`
- Response status code: `200 OK`
- Generic error type: `NetworkFailure` (not details)
- Feature name: `AttendanceFeature` (not user data)

```dart
// Bad
logError('Login failed for user $email with password $password');
logError('Check-in at GPS (${gps.lat}, ${gps.lng})');
logError('FCM token: $fcmToken');

// Good
logError('Login failed for user ID $userId');
logError('Check-in at location ${location.name}');
logError('FCM token registered');  // No token value
```

### Firebase Initialization
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Only initialize if real options (not placeholder)
  if (kDebugMode) {
    // Dev: use placeholder or mock
    print('Firebase disabled in Debug build');
  } else {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseAnalytics.instance.logAppOpen();
  }
  
  runApp(const GuHrApp());
}
```

---

## Testing Conventions

### Test File Mirroring
```
lib/features/auth/data/auth_repository.dart
test/features/auth/data/auth_repository_test.dart

lib/features/auth/presentation/login_page.dart
test/features/auth/presentation/login_page_test.dart
```

### Unit Tests: Mock External Dependencies
```dart
test('login returns Ok(user) on 200 response', () async {
  final mockDio = MockDio();
  when(mockDio.post(...)).thenAnswer(
    (_) async => Response(data: {'email': 'a@b.com', ...}, statusCode: 200),
  );
  
  final repo = AuthRepository(dio: mockDio);
  final result = await repo.login('a@b.com', 'password');
  
  expect(result, isA<Ok>().having((r) => r.value.email, 'email', 'a@b.com'));
});
```

### Widget Tests: Mock Riverpod
```dart
testWidgets('shows error message on login failure', (WidgetTester tester) async {
  final container = ProviderContainer(
    overrides: [
      authNotifierProvider.overrideWithValue(
        StateNotifier(const AuthState.error('Invalid credentials')),
      ),
    ],
  );
  
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: const GuHrApp(),
    ),
  );
  
  expect(find.text('Invalid credentials'), findsOneWidget);
});
```

### Never Use Real API Calls in Tests
```dart
// Bad
test('login', () async {
  final repo = AuthRepository(dio: Dio()); // Real Dio!
  final result = await repo.login('user@example.com', 'password'); // Real API call!
  expect(result, isA<Ok>());
});

// Good
test('login', () async {
  final mockDio = MockDio();
  when(mockDio.post(...)).thenAnswer((_) async => Response(...));
  final repo = AuthRepository(dio: mockDio);
  final result = await repo.login('user@example.com', 'password');
  expect(result, isA<Ok>());
});
```

---

## JSON Serialization

### Global snake_case Configuration
**File:** `build.yaml`
```yaml
targets:
  $default:
    builders:
      json_serializable|json_serializable:
        options:
          field_rename: snake
```

Server sends: `{"email_address": "test@example.com", "is_manager": true}`

Flutter model:
```dart
@freezed
class User with _$User {
  const factory User({
    required String emailAddress,  // Auto-renamed from email_address
    required bool isManager,        // Auto-renamed from is_manager
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// No @JsonKey needed!
```

### Only Use @JsonKey for Non-Standard Cases
```dart
@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    @JsonKey(name: 'error_code')
    int? errorCode,  // Non-snake_case exception
    required String message,  // Auto-converts from message_text per global config
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
```

---

## Code Organization & Modularization

### File Size Limit: 200 LOC
**Target:** Keep individual Dart files under 200 lines (soft), 250 (hard).

**When to split:**
- **Widgets:** Extract sub-widgets into separate files if >100 lines
- **Notifiers:** Separate form logic from display if >150 lines
- **Models:** If a single `@freezed` class exceeds 100 lines, split into multiple files

**Example: Split a large page**
```
lib/features/requests/presentation/
├── create_request_page.dart           # Main form page (120 LOC)
├── widgets/
│   ├── attachment_picker_widget.dart  # Image picking logic (80 LOC)
│   ├── date_range_picker_widget.dart  # Date selection (60 LOC)
│   └── reason_field_widget.dart       # Text input validation (40 LOC)
└── create_request_notifier.dart       # Form state management (100 LOC)
```

### Shared Components
- **Reused across 2+ features:** Move to `lib/shared/widgets/`
- **Reused within 1 feature:** Keep in feature's `presentation/widgets/`
- **Examples in shared:**
  - `skeleton_shimmer.dart` (loading placeholders)
  - `gu_loading_indicator.dart` (branded spinner)
  - `error_state_widget.dart` (error recovery UI)
  - `confirm_dialog_widget.dart` (async confirmation)

---

## Widget Best Practices

### Prefer StatelessWidget + ConsumerWidget
```dart
// Bad: StatefulWidget (mutable state, harder to test)
class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = '';
  // ...
}

// Good: ConsumerWidget + Riverpod
class LoginForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    return Form(...);
  }
}
```

### Extract Large Builders
```dart
// Bad: 200+ LOC in single build method
Widget build(BuildContext context) {
  return Column(
    children: [
      ...200 lines of UI...
    ],
  );
}

// Good: Extract into private widget methods or separate files
Widget build(BuildContext context) {
  return Column(
    children: [
      _buildHeader(),
      _buildContent(),
      _buildFooter(),
    ],
  );
}

Widget _buildHeader() => ... // ~40 LOC
Widget _buildContent() => ... // ~80 LOC
Widget _buildFooter() => ... // ~30 LOC
```

### Use const Constructors
```dart
// Bad: creates new instance every rebuild
Widget build(BuildContext context) {
  return ListView(children: [
    MyCard(title: 'Title 1'),
    MyCard(title: 'Title 2'),
  ]);
}

// Good: const constructor, reuses instance
Widget build(BuildContext context) {
  return const ListView(children: [
    MyCard(title: 'Title 1'),
    MyCard(title: 'Title 2'),
  ]);
}

class MyCard extends StatelessWidget {
  const MyCard({required this.title});  // const constructor
  final String title;
  @override
  Widget build(BuildContext context) => ...
}
```

---

## Material 3 & Design

### Use Material 3 Components
```dart
// Bad: Cupertino (iOS legacy), wrong brand
CupertinoButton(
  onPressed: () {},
  child: const Text('Submit'),
)

// Good: Material 3 button (brand consistency)
ElevatedButton(
  onPressed: () {},
  child: const Text('Submit'),
)

FilledButton(  // Solid background
  onPressed: () {},
  child: const Text('Submit'),
)

OutlinedButton(  // Border only
  onPressed: () {},
  child: const Text('Submit'),
)

TextButton(  // No background
  onPressed: () {},
  child: const Text('Submit'),
)
```

### Colors via Theme
```dart
// Bad: hardcoded color
Container(
  color: const Color(0xFF0F4C5C),  // Huh? What is this?
  child: const Text('Text'),
)

// Good: theme-aware color
Container(
  color: Theme.of(context).colorScheme.primary,
  child: Text('Text', style: Theme.of(context).textTheme.titleMedium),
)
```

### Spacing via Constants
```dart
// Bad: magic numbers
Padding(
  padding: const EdgeInsets.all(24),  // Why 24?
  child: Column(
    children: [
      const SizedBox(height: 16),  // Why 16?
      ...
    ],
  ),
)

// Good: semantic spacing
Padding(
  padding: const EdgeInsets.all(GuHrSpacing.containerPadding),  // 24
  child: Column(
    children: [
      const SizedBox(height: GuHrSpacing.base),  // 8
      ...
    ],
  ),
)
```

**Spacing values (lib/app/theme/tokens.dart):**
- `base` = 8px
- `double` = 16px
- `triple` = 24px
- `quad` = 32px
- `containerPadding` = 24px (card content)
- `gutter` = 24px (grid items)

---

## Linting & Format

### Run Before Every Commit
```bash
# Format code
dart format lib/

# Analyze for issues (must be 0)
flutter analyze

# Run tests
flutter test

# Build runner (after schema/provider changes)
dart run build_runner build --delete-conflicting-outputs
```

### Suppress Warnings Only if Justified
```dart
// Bad: suppress without reason
// ignore: prefer_const_constructors
Widget build(BuildContext context) => Container();

// Good: comment explaining why
// ignore: prefer_const_constructors
// Cannot use const because height is dynamic from MediaQuery
Widget build(BuildContext context) => Container(
  height: MediaQuery.of(context).size.height,
);
```

---

## SQLite Bool-as-Int DTO Pattern
Backend SQLite stores booleans as 0/1 integers. Add top-level `bool _toBool(Object? v) => v == true || v == 1 || v == '1';` + `@JsonKey(fromJson: _toBool)` to each bool field. Applied in: `location_dto.dart`, `checkin_response_dto.dart`, `attendance_record_dto.dart`, `live_team_dto.dart`, `login_response.dart`.

---

## Riverpod Lifecycle Mutation Safety
Riverpod prohibits state mutations in `build()` or `initState()`. Wrap side effects in `WidgetsBinding.instance.addPostFrameCallback()` to defer until post-frame. Example: `CreateRequestPage.initState()`.

---

## Vietnamese Localization
All user-facing strings start vi_VN, English fallback. Server-provided error messages (e.g., "Email đã được sử dụng") displayed verbatim without re-translation. See `design-guidelines.md` for Vietnamese copy conventions (Nghỉ phép, Check-in, Phê duyệt, etc.).

---

## Server-Summary-or-Local-Compute Pattern

When displaying aggregate stats (e.g., monthly attendance totals):
1. If server provides `summary` object, use it directly (canonical)
2. Else, compute from detail rows `rows[]` locally (defensive fallback)

**Example (CalendarStatsBanner):**
```dart
final totalDays = data.summary?.totalDays ?? data.rows.length;
final totalPresent = data.summary?.present ?? 
  data.rows.where((r) => r.status == 'present').length;
```

**Benefit:** Handles incomplete migrations; server can optimize (compute once) without blocking UI.

---

## Match-Then-Nearest Location Resolver

When validating user location against multiple offices:
1. Check if user is within radius of ANY office (`distance ≤ office.gpsRadiusM`)
2. If multiple offices match, pick the geographically closest
3. Fall back to nearest office (any radius) for reference display

**Example (Check-in flow):**
```dart
LocationDto? resolveLocationCheck(double userLat, double userLng, List<LocationDto> offices) {
  // Find all qualifying (in-radius) locations
  final qualifying = offices.where((o) => _distance(userLat, userLng, o) <= o.gpsRadiusM).toList();
  if (qualifying.isNotEmpty) {
    qualifying.sort((a, b) => _distance(userLat, userLng, a).compareTo(_distance(userLat, userLng, b)));
    return qualifying.first;  // Closest match
  }
  // Fall back to nearest office (for "outside" reference)
  offices.sort((a, b) => _distance(userLat, userLng, a).compareTo(_distance(userLat, userLng, b)));
  return offices.first;
}
```

**Benefit:** Allows multi-office check-in; user only needs to be within ONE boundary.

---

## Dialog BuildContext Capture Pattern

When dismissing a dialog via navigator, capture the dialog's own `BuildContext` (from builder callback), not the outer page context. Popping with outer context can unwind the StatefulShellRoute stack → black screen.

**Bad:**
```dart
showDialog(
  context: context,  // Outer page context
  builder: (_) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),  // ✗ Pops page context
          child: Text('Đóng'),
        ),
      ],
    );
  },
);
```

**Good:**
```dart
showDialog(
  context: context,
  builder: (dialogCtx) {  // Capture dialog's own context
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(dialogCtx),  // ✓ Pops dialog only
          child: Text('Đóng'),
        ),
      ],
    );
  },
);
```

**Benefit:** Prevents accidental page navigation when dismissing dialogs.

---

## API Contract Pitfalls

### Trust Actual Response Shape, Not Assumed Request Shape
Server POST/PATCH response DTOs often differ from request payloads. Example: `POST /api/hr/requests` returns `{id, request_code, firstApproverId?}` (no `status`), but request sends `{type, startDate, endDate, reason?, attachmentUrls}`. DTOs for responses must account for:
- Missing fields: default to server-documented defaults (e.g., `@Default('pending')`)
- Renamed fields: use `@JsonKey(name: '...')` explicitly, even if global `build.yaml` has snake_case config (server may override on specific fields)
- Type mismatches: handle SQLite int→bool (see SQLite Bool-as-Int pattern)

**Don't assume:** If field not in request, it won't appear in response (false). Always verify actual response via API docs or test response capture.

### Field Naming Consistency Across Request/Response
When global `field_rename: snake` applies in `build.yaml`, server may still override per-field via camelCase in JSON. Use `@JsonKey(name: 'fieldName')` on response DTOs if server API docs specify camelCase (e.g., `firstApproverId`).

---

## Unresolved

- Concurrent requests (no race detection; Riverpod handles sequencing)
- Memory profiling for Drift caches
- Biometric auth (Phase-02 password-only; R3 planned)
