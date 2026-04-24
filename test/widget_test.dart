import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gu_hr_mobile/app/app.dart';

void main() {
  testWidgets('App boots without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: GuHrApp()));
    // Splash screen renders — theme primary teal present
    expect(find.text('GU HR'), findsOneWidget);
  });
}
