import 'package:string_calculator_kata/string_calculator_kata.dart';
import 'package:test/test.dart';

void main() {
  //Input: “”, Output: 0
  test('empty string should return 0', () {
    expect(add(""), equals(0));
  });

  //Input: “1”, Output: 1
  test('single input should return its value', () {
    expect(add("1"), equals(1));
  });

  // Input: “1,5”, Output: 6
  test('two string numbers separated by , should return their sum', () {
    expect(add("2,4"), equals(6));
  });

  //Input: “5,3,2”, Output: 10
  test('multiple string numbers should return the total sum', () {
    expect(add("5,3,2"), equals(10));
  });

  //"1\n2,3"
  test('numbers separated by newlines should also return the total sum', () {
    expect(add("1\n2,3"), equals(6));
  });

  //input: //[delimiter]\n[numbers…]
  test('check for custom delimiter and return the total sum', () {
    expect(add("//;\n1;2"), equals(3));
  });

  //input : "1,-2", output : negative numbers not allowed : -2
  test('check for negative number', () {
    //check for single or multiple -ve numbers
    final input = "1,-2,-3,4";

    final negative = input
        .split(RegExp(r'[,\n]'))
        .map(int.parse)
        .where((n) => n < 0)
        .toList();
    expect(
      () => add(input),
      throwsA(
        predicate(
          (e) =>
              e.toString() ==
              'Exception: negative numbers not allowed : ${negative.join(',')}',
        ),
      ),
    );
  });

  //input : "2,1001", output : 2
  test('check for number greater than 1000 and ignore it in the sum', () {
    expect(add("2,1001"), equals(2));
    expect(add("1000,1001,5"), equals(1005));
  });

  //[***]\n1***2***3, output : 6
  test('multiple length of delimiter check and sum the total', () {
    expect(add("//[***]\n1***2***3"), equals(6));
  });

  //input: //[delim1][delim2]\n, output: 6
  test('multiple number of delimiters check and sum', () {
    expect(add("//[*][%]\n1*2%3"), equals(6));
    expect(add("//[***][%%]\n4***5%%6"), equals(15));
    expect(add("//[;][***][%]\n1;2***3%4"), equals(10));
  });
}
