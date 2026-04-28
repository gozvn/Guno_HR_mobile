// ignore_for_file: type=lint, lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// PLACEHOLDER: replace with real values via `flutterfire configure`.
///
/// Running Firebase.initializeApp() with these placeholder values will log a
/// warning at startup and push delivery will not work. Set up a real Firebase
/// project and run `flutterfire configure` before TestFlight / Play release.
///
/// Steps:
///   1. Create Firebase project (or reuse existing guop.app project).
///   2. Register iOS bundle ID + Android package name (cùng = app.guop.guHrMobile).
///   3. Run: `flutterfire configure --project=<your-project-id>`
///   4. Commit the regenerated file (it will have real API keys).
///   5. Drop google-services.json vào android/app/ + GoogleService-Info.plist vào ios/Runner/.
/// True when [DefaultFirebaseOptions] no longer holds placeholder values.
/// Gate every `FirebaseMessaging.instance` / `FirebaseAnalytics.instance`
/// / `FirebaseCrashlytics.instance` access on this — those throw
/// `[core/no-app]` when Firebase has not been initialised.
bool get firebaseConfigured =>
    !DefaultFirebaseOptions.currentPlatform.projectId.startsWith('PLACEHOLDER');

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'GU HR Mobile is mobile-only. Web platform not supported.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for platform: $defaultTargetPlatform',
        );
    }
  }

  /// Placeholder iOS options. All values are intentionally invalid stubs.
  /// Replace via `flutterfire configure`.
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'PLACEHOLDER_API_KEY',
    appId: 'PLACEHOLDER_APP_ID',
    messagingSenderId: 'PLACEHOLDER_SENDER_ID',
    projectId: 'PLACEHOLDER_PROJECT_ID',
    storageBucket: 'PLACEHOLDER_PROJECT_ID.appspot.com',
    iosBundleId: 'com.example.guHrMobile',
  );

  /// Placeholder Android options. Cùng pattern iOS — gate skip Firebase init.
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'PLACEHOLDER_API_KEY',
    appId: 'PLACEHOLDER_APP_ID',
    messagingSenderId: 'PLACEHOLDER_SENDER_ID',
    projectId: 'PLACEHOLDER_PROJECT_ID',
    storageBucket: 'PLACEHOLDER_PROJECT_ID.appspot.com',
  );
}
