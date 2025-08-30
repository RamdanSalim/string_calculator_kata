import 'dart:math';

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

  //[delimiter]\n[numbers…]
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
  });
}

//test code
int add(String num) {
  if (num.isEmpty) return 0;

  //raw string to avoid escape or special regexp chars
  String delimiterPattern = r'[,\n]';
  String number = num;

  if (num.startsWith('//')) {
    //assign the index of \n
    final delimiterIndex = num.indexOf('\n');
    //find the customer delimiter
    final delimiter = RegExp.escape(num.substring(2, delimiterIndex));
    //assign the custom delimiter to the pattern
    delimiterPattern = delimiter;

    //assign the numbers after \n
    number = num.substring(delimiterIndex + 1);
  }

  final numList = number.split(RegExp(delimiterPattern));
  final integerNum = numList.map(int.parse).toList();

  //check for negative numbers
  final negative = integerNum.where((n) => n < 0).toList();
  if (negative.isNotEmpty) {
    throw Exception('negative numbers not allowed : ${negative.join(',')}');
  }

  return integerNum.reduce((a, b) => a + b);
}
