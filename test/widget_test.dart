
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_testing_sample/main.dart';

void main() {
  testWidgets('Widget Testing the Calculator', (WidgetTester tester) async {
    
    // Pumping out our application widget for testing.
    await tester.pumpWidget(MyApp());

    // Widget Testing for the title of the app in App bar.
    final titleFinder = find.text('Calculator Tester');
    
    expect(titleFinder, findsOneWidget);

    // Finding Widget for entering Number one.
    final numberOneFinder = find.byTooltip('Number one');
    expect(numberOneFinder, findsOneWidget);

    // Finding Widget for entering number two.
    final numberTwoFinder = find.byTooltip('Number two');
    expect(numberTwoFinder, findsOneWidget);

    // Entering number one
    await tester.enterText(numberOneFinder, '78');

    // Entering number two
    await tester.enterText(numberTwoFinder, '22');

    // Verifying there is one instance of both the numbers to be calculated on screen.
    expect(find.text('78'), findsOneWidget);
    expect(find.text('22'), findsOneWidget);

    // Testing the Add button of the calculator.
    await tester.tap(find.widgetWithText(MaterialButton, '+'));
    await tester.pump();

    // After addition has taken place, the initial numbers should not be there.
    expect(find.text('78'), findsNothing);
    expect(find.text('22'), findsNothing);

    // Verifying Addition has taken place sucessfully.
    expect(find.text('100'), findsOneWidget);

    // After calculating there should be two equal symbols on screen(one for the button)
    expect(find.text('='), findsNWidgets(2));

  });
}
