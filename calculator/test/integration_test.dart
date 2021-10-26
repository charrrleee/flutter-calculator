import 'package:calculator/components/button.dart';
import 'package:calculator/main.dart' as app;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('1 + 1 = 2', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      Finder output = find.widgetWithText(Text, '0');
      var textFind = find.text("0").last;
      print('${textFind} haha');
      // expect(output, findsOneWidget);

      Finder one = find.widgetWithText(CustomElevatedButton, "1");
      Finder two = find.widgetWithText(CustomElevatedButton, "2");
      Finder three = find.widgetWithText(CustomElevatedButton, "3");
      Finder plus = find.widgetWithText(CustomElevatedButton, "+");
      Finder equal = find.widgetWithText(CustomElevatedButton, "=");

      await tester.tap(one);
      await tester.tap(plus);
      await tester.tap(one);
      await tester.tap(equal);

      Text aa = tester.firstWidget(textFind);
      print('${aa.data} haha222');
      expect(find.widgetWithText(Text, "2"), findsOneWidget);

      await tester.pumpAndSettle();
    });
  });
}
