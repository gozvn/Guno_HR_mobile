import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'firebase_options.dart';

/// Top-level background message handler — runs in a separate isolate.
/// Cannot access Riverpod providers; uses SharedPreferences directly.
/// The pending payload is consumed by [PendingIntentStore] during cold start.
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage msg) async {
  if (!firebaseConfigured) return;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('pending_push_data', jsonEncode(msg.data));
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (firebaseConfigured) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

    if (!kDebugMode) {
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    }
  } else {
    debugPrint(
      '[Firebase] init skipped — firebase_options.dart still holds '
      'placeholder values. Run `flutterfire configure` to enable push, '
      'Crashlytics, and Analytics.',
    );
  }

  runApp(const ProviderScope(child: GuHrApp()));
}
