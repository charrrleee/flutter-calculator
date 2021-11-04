import 'package:calculator/components/button.dart';
import 'package:calculator/main.dart' as app;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('11.1 + 12.1 = 23.20', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      Finder output = find.byKey(const Key("output-text-widget"));
      expect(output, findsOneWidget);

      Finder one = find.widgetWithText(CustomElevatedButton, "1");
      Finder plus = find.widgetWithText(CustomElevatedButton, "+");
      Finder two = find.widgetWithText(CustomElevatedButton, "2");
      Finder equal = find.widgetWithText(CustomElevatedButton, "=");
      Finder dot = find.widgetWithText(CustomElevatedButton, ".");

      await tester.tap(one);
      await tester.tap(one);
      await tester.tap(dot);
      await tester.tap(one);
      await tester.tap(plus);
      await tester.tap(one);
      await tester.tap(two);
      await tester.tap(dot);
      await tester.tap(one);
      await tester.tap(equal);

      expect(one, findsOneWidget);
      expect(plus, findsOneWidget);
      expect(two, findsOneWidget);
      expect(equal, findsOneWidget);

      await tester.pumpAndSettle();

      Finder result = find.text("23.20");
      expect(result, findsOneWidget);
    });

    testWidgets('0.01 + 1.20 = 1.21', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      Finder output = find.byKey(const Key("output-text-widget"));
      expect(output, findsOneWidget);

      Finder zero = find.widgetWithText(CustomElevatedButton, "0");
      Finder percentage = find.widgetWithText(CustomElevatedButton, "%");
      Finder one = find.widgetWithText(CustomElevatedButton, "1");
      Finder plus = find.widgetWithText(CustomElevatedButton, "+");
      Finder two = find.widgetWithText(CustomElevatedButton, "2");
      Finder equal = find.widgetWithText(CustomElevatedButton, "=");
      Finder dot = find.widgetWithText(CustomElevatedButton, ".");

      await tester.tap(one);
      await tester.tap(percentage);
      await tester.tap(plus);
      await tester.tap(one);
      await tester.tap(dot);
      await tester.tap(two);
      await tester.tap(zero);
      await tester.tap(equal);

      expect(one, findsOneWidget);
      expect(plus, findsOneWidget);
      expect(two, findsOneWidget);
      expect(equal, findsOneWidget);

      await tester.pumpAndSettle();

      Finder result = find.text("1.21");
      expect(result, findsOneWidget);
    });

  });
}
