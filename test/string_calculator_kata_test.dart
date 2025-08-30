import 'package:string_calculator_kata/string_calculator_kata.dart';
import 'package:test/test.dart';

void main() {

  test('empty string should return 0', ()
  {
    expect(add(""),equals(0));
  });

  test('single input should return its value',()
  {
  expect(add("1"),equals(1));
  });

  test('two numbers separated by , should return their sum',()
  {
    expect(add("2,4"),equals(6));
  });

}
