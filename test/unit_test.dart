import 'package:flutter_testing_sample/main.dart';
import 'package:test/test.dart';

void main() {
  /*
  UNIT TEST FORMAT
  test('Test Description text', () {
      setup code;

      run test code;

      verify test code;
    });
  */

  group('Calculator Unit Tests', () {
    test('Cannot calculate empty number fields', () {
      var result = Calculator.calculate('+', '', '');

      expect(result, null);
    });

    test('Adding two numbers', () {
      var result = Calculator.calculate('+', '56', '10');

      expect(result, '66');
    });

    test('Subtracting two numbers', () {
      var result = Calculator.calculate('-', '56', '10');

      expect(result, '46');
    });

    test('Multiplying two numbers', () {
      var result = Calculator.calculate('*', '56', '10');

      expect(result, '560');
    });

    test('Dividing two numbers', () {
      var result = Calculator.calculate('/', '56', '10');

      expect(result, '5.6');
    });

    test('Exponent calculation', () {
      var result = Calculator.calculate('^', '7', '2');

      expect(result, '49');
    });
  });
}
