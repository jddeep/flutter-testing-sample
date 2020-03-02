import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator Driver Test', () {
    final numberoneFinder = find.byValueKey('numberone');
    final numbertwoFinder = find.byValueKey('numbertwo');
    final operatorFinder = find.byValueKey('operator');
    final addbtnFinder = find.byValueKey('+');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Entering number one', () async {
      await driver.tap(numberoneFinder);
      await driver.enterText('56');
      await driver.waitFor(find.text('56'));
    });

    test('Entering number two', () async {
      await driver.tap(numbertwoFinder);
      await driver.enterText('10');
      await driver.waitFor(find.text('10'));
    });

    test('Testing operator field before calculating', () async {
      expect(await driver.getText(operatorFinder), '');
    });

    test('Performing Addition', () async {
      await driver.tap(addbtnFinder);
      await driver.waitFor(find.text('66'));
      expect(await driver.getText(operatorFinder), '=');
    });
  });
}
