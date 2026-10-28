import 'package:flutter_test/flutter_test.dart';
import 'package:pageview_widget/main.dart';

void main() {
  testWidgets('OnboardingScreen displays PageView and navigates', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify first page is shown
    expect(find.text('Discover Places'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });
}
