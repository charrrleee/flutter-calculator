// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator/components/button.dart';
import 'package:calculator/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Calculator', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    List<Finder> clickableList = [
      find.widgetWithText(CustomElevatedButton, "1"),
      find.widgetWithText(CustomElevatedButton, "2"),
      find.widgetWithText(CustomElevatedButton, "3"),
      find.widgetWithText(CustomElevatedButton, "4"),
      find.widgetWithText(CustomElevatedButton, "5"),
      find.widgetWithText(CustomElevatedButton, "6"),
      find.widgetWithText(CustomElevatedButton, "7"),
      find.widgetWithText(CustomElevatedButton, "8"),
      find.widgetWithText(CustomElevatedButton, "9"),
      find.widgetWithText(CustomElevatedButton, "0"),
      find.widgetWithText(CustomElevatedButton, "+"),
      find.widgetWithText(CustomElevatedButton, "-"),
      find.widgetWithText(CustomElevatedButton, "*"),
      find.widgetWithText(CustomElevatedButton, "/"),
      find.widgetWithText(CustomElevatedButton, "."),
      find.widgetWithText(CustomElevatedButton, "%"),
    ];

    clickableList.map((e) async {
      await tester.tap(e);
    });
    await tester.pump();
  });
}
