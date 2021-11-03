import 'package:calculator/components/button.dart';
import 'package:calculator/main.dart' as app;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('11 + 12 = 23', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      Finder output = find.byKey(const Key("output-text-widget"));
      expect(output, findsOneWidget);

      Finder one = find.widgetWithText(CustomElevatedButton, "1");
      Finder plus = find.widgetWithText(CustomElevatedButton, "+");
      Finder two = find.widgetWithText(CustomElevatedButton, "2");
      Finder equal = find.widgetWithText(CustomElevatedButton, "=");

      await tester.tap(one);
      await tester.tap(one);
      await tester.tap(plus);
      await tester.tap(one);
      await tester.tap(two);
      await tester.tap(equal);

      expect(one, findsOneWidget);
      expect(plus, findsOneWidget);
      expect(two, findsOneWidget);
      expect(equal, findsOneWidget);

      Finder result = find.text("23");
      print(output.description);
      expect(result, findsOneWidget);
    });
  });
}
