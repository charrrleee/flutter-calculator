import 'package:calculator/components/button.dart';
import 'package:calculator/main.dart' as app;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Finder one = find.widgetWithText(CustomElevatedButton, "1");
  Finder two = find.widgetWithText(CustomElevatedButton, "2");
  Finder three = find.widgetWithText(CustomElevatedButton, "3");
  Finder four = find.widgetWithText(CustomElevatedButton, "4");
  Finder five = find.widgetWithText(CustomElevatedButton, "5");
  Finder six = find.widgetWithText(CustomElevatedButton, "6");
  Finder seven = find.widgetWithText(CustomElevatedButton, "7");
  Finder eight = find.widgetWithText(CustomElevatedButton, "8");
  Finder nine = find.widgetWithText(CustomElevatedButton, "9");
  Finder zero = find.widgetWithText(CustomElevatedButton, "0");

  Finder plus = find.widgetWithText(CustomElevatedButton, "+");
  Finder posNeg = find.widgetWithText(CustomElevatedButton, "-");
  Finder multiple = find.widgetWithText(CustomElevatedButton, "*");
  Finder dividend = find.widgetWithText(CustomElevatedButton, "/");
  Finder percentage = find.widgetWithText(CustomElevatedButton, "%");
  Finder equal = find.widgetWithText(CustomElevatedButton, "=");
  Finder dot = find.widgetWithText(CustomElevatedButton, ".");
  Finder clear = find.widgetWithText(CustomElevatedButton, "A/C");

  group('end-to-end test', () {
    testWidgets('11.1 + 12.1 ', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      Finder output = find.byKey(const Key("output-text-widget"));
      expect(output, findsOneWidget);

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

      await tester.pumpAndSettle();

      Finder result = find.text("23.2");
      expect(result, findsOneWidget);
    });

    testWidgets('0.01 - 1.20 ', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      Finder output = find.byKey(const Key("output-text-widget"));
      expect(output, findsOneWidget);

      await tester.tap(one);
      await tester.tap(percentage);
      await tester.tap(plus);
      await tester.tap(one);
      await tester.tap(dot);
      await tester.tap(two);
      await tester.tap(zero);
      await tester.tap(equal);

      await tester.pumpAndSettle();

      Finder result = find.text("1.21");
      expect(result, findsOneWidget);
    });

    testWidgets('1 * 12.0 + ', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      Finder output = find.byKey(const Key("output-text-widget"));
      expect(output, findsOneWidget);

      await tester.tap(one);
      await tester.tap(multiple);
      await tester.tap(one);
      await tester.tap(two);
      await tester.tap(dot);
      await tester.tap(zero);
      await tester.tap(equal);

      await tester.pumpAndSettle();

      Finder result = find.text("12.0");
      expect(result, findsOneWidget);
    });

    testWidgets('0. + 6', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      Finder output = find.byKey(const Key("output-text-widget"));
      expect(output, findsOneWidget);

      await tester.tap(zero);
      await tester.tap(dot);
      await tester.tap(plus);
      await tester.tap(six);
      await tester.tap(equal);

      await tester.pumpAndSettle();

      Finder result = find.text("6.0");
      expect(result, findsOneWidget);
    });
  });
}
