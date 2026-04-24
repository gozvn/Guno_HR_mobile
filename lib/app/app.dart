import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/domain/auth_state.dart';
import '../features/auth/presentation/auth_notifier.dart';
import '../features/notifications/data/dto/push_payload.dart';
import '../features/notifications/notifications_providers.dart';
import '../features/notifications/presentation/permission_primer_sheet.dart';
import '../firebase_options.dart';
import 'router.dart';
import 'theme/theme.dart';

class GuHrApp extends ConsumerStatefulWidget {
  const GuHrApp({super.key});

  @override
  ConsumerState<GuHrApp> createState() => _GuHrAppState();
}

class _GuHrAppState extends ConsumerState<GuHrApp> {
  @override
  void initState() {
    super.initState();
    // Attach FCM listeners after first frame — router must be ready.
    WidgetsBinding.instance.addPostFrameCallback((_) => _initFcmListeners());
    // Show permission primer once when user first becomes authenticated.
    _listenForFirstLogin();
  }

  /// Shows permission primer sheet the first time auth state transitions to
  /// [AuthAuthenticated]. Uses a one-shot listener via ref.listen.
  void _listenForFirstLogin() {
    ref.listenManual(authNotifierProvider, (previous, next) {
      final wasAuthenticated = previous is AuthAuthenticated;
      final isAuthenticated = next is AuthAuthenticated;
      // Trigger only on fresh login (not on rehydration from splash).
      // Skip when Firebase isn't configured — primer touches FCM APIs.
      if (!wasAuthenticated && isAuthenticated && mounted && firebaseConfigured) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            PermissionPrimerSheet.showIfNeeded(context, ref);
          }
        });
      }
    });
  }

  Future<void> _initFcmListeners() async {
    if (!firebaseConfigured) return;
    try {
      _attachForegroundListener();
      _attachTapToOpenListener();
      await _handleColdStart();
    } catch (e) {
      debugPrint('[FCM] listener init skipped (Firebase not ready): $e');
    }
  }

  /// Step 10 — Foreground: show SnackBar banner with [Xem] action.
  void _attachForegroundListener() {
    FirebaseMessaging.onMessage.listen((msg) {
      if (!mounted) return;
      final payload = PushPayload.fromData(msg.data);
      final title = msg.notification?.title ?? 'Thông báo mới';
      final dispatcher = ref.read(deepLinkDispatcherProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(title),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Xem',
            onPressed: () => dispatcher.handle(payload),
          ),
        ),
      );
    });
  }

  /// Background tap (app in background, not killed) — navigates on resume.
  void _attachTapToOpenListener() {
    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      try {
        final payload = PushPayload.fromData(msg.data);
        ref.read(deepLinkDispatcherProvider).handle(payload);
      } catch (e) {
        debugPrint('[FCM] onMessageOpenedApp dispatch error: $e');
      }
    });
  }

  /// Step 11 — Cold-start: check getInitialMessage (killed-state tap).
  /// PendingIntentStore covers the case where background handler fired
  /// but getInitialMessage returns null (background → killed race).
  Future<void> _handleColdStart() async {
    // getInitialMessage path (app launched via notification tap).
    final initial = await FirebaseMessaging.instance.getInitialMessage();
    if (initial != null) {
      try {
        final payload = PushPayload.fromData(initial.data);
        ref.read(deepLinkDispatcherProvider).handle(payload);
      } catch (e) {
        debugPrint('[FCM] getInitialMessage dispatch error: $e');
      }
      return; // Handled; skip PendingIntentStore path.
    }

    // PendingIntentStore path (background handler wrote data, app relaunched).
    final pending =
        await ref.read(pendingIntentStoreProvider).consume();
    if (pending != null) {
      try {
        ref.read(deepLinkDispatcherProvider).handle(pending);
      } catch (e) {
        debugPrint('[FCM] PendingIntentStore dispatch error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'GU HR',
      theme: buildGuHrTheme(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: const Locale('vi', 'VN'),
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
