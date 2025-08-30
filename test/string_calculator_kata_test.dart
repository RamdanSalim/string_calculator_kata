import 'package:string_calculator_kata/string_calculator_kata.dart';
import 'package:test/test.dart';

void main() {

  /*Input: “”, Output: 0*/
  test('empty string should return 0', ()
  {
    expect(add(""),equals(0));
  });


  /*Input: “1”, Output: 1*/
  test('single input should return its value',()
  {
  expect(add("1"),equals(1));
  });
}
