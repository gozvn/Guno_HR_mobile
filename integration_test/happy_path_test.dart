// INTEGRATION TEST — DO NOT RUN IN CI WITHOUT REAL CREDENTIALS
//
// This test launches the full app, logs in, navigates to dashboard, and
// performs a check-in flow end-to-end against a real dev API.
//
// Prerequisites:
//   1. Physical iOS device or iOS Simulator with location permission granted.
//   2. Real Firebase project configured (run `flutterfire configure`).
//   3. Dev API reachable: https://dev.api.guop.app
//
// Run command (uncomment and replace creds):
//   flutter test integration_test/happy_path_test.dart \
//     --dart-define=API_BASE=https://dev.api.guop.app \
//     --dart-define=TEST_USER_EMAIL=employee@guop.app \
//     --dart-define=TEST_USER_PASSWORD=testpass123 \
//     -d <device-id>
//
// This file is intentionally skipped by default (all tests wrapped in group
// with skip: true). Remove the skip flag when running manually.

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const apiBase =
      String.fromEnvironment('API_BASE', defaultValue: '');
  const testEmail =
      String.fromEnvironment('TEST_USER_EMAIL', defaultValue: '');
  const testPassword =
      String.fromEnvironment('TEST_USER_PASSWORD', defaultValue: '');

  // ---------------------------------------------------------------------------
  // Skip guard — prevents accidental execution in CI without real creds.
  final bool missingCreds =
      apiBase.isEmpty || testEmail.isEmpty || testPassword.isEmpty;

  group(
    'Happy path — login → dashboard → check-in → logout',
    skip: missingCreds
        ? 'Set --dart-define=API_BASE, TEST_USER_EMAIL, TEST_USER_PASSWORD to run'
        : false,
    () {
      // TODO(integration): implement full happy path when dev API + creds are
      // provisioned. Steps:
      //   1. app.main() — await Firebase init
      //   2. pump until SplashScreen resolves → LoginPage appears
      //   3. enterText email + password fields
      //   4. tap Đăng nhập → await pumpAndSettle (auth + navigation)
      //   5. expect DashboardPage visible (find 'Chào buổi sáng' or similar)
      //   6. tap check-in FAB → await permission dialog → accept
      //   7. await location step → tap confirm
      //   8. await selfie step (simulate camera with mock) → tap confirm
      //   9. tap 'Xác nhận chấm công' → await success banner
      //  10. tap profile → tap logout → expect LoginPage
      testWidgets('placeholder — requires real creds + device', (tester) async {
        // This test body intentionally left empty.
        // It serves as a placeholder for the integration test suite.
        // Implement the steps above once dev API URL and test credentials are
        // provisioned. See docs/testing-guide.md for full instructions.
        expect(true, isTrue);
      });
    },
  );
}
