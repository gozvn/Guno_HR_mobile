import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gu_hr_mobile/app/theme/theme.dart';

/// Wraps [home] in a ProviderScope + MaterialApp with the GU HR theme.
///
/// Pass [overrides] to replace any Riverpod provider for the test.
///
/// Example:
/// ```dart
/// await pumpApp(tester, LoginPage(), overrides: [
///   authNotifierProvider.overrideWith(() => FakeAuthNotifier()),
/// ]);
/// ```
Future<void> pumpApp(
  WidgetTester tester,
  Widget home, {
  List<Override> overrides = const [],
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        theme: buildGuHrTheme(),
        home: home,
        // Vietnamese locale support.
        locale: const Locale('vi', 'VN'),
      ),
    ),
  );
}
