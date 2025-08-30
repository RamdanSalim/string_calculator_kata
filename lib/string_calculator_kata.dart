//test code
int add(String num) {
  if (num.isEmpty) return 0;

  //raw string to avoid escape or special regexp chars
  String delimiterPattern = r'[,\n]';
  String number = num;

  if (num.startsWith('//[')) {
    //multiple delimiter length

    delimiterPattern = delimiterFn(num);
    number = num.substring(number.indexOf('\n') + 1);
  } else if (num.startsWith('//')) {
    //single delimiter

    //assign the index of \n
    final delimiterIndex = num.indexOf('\n');
    //find the customer delimiter
    final delimiter = delimiterIs(2, num, delimiterIndex);
    //assign the custom delimiter to the pattern
    delimiterPattern = delimiter;

    //assign the numbers after \n
    number = num.substring(delimiterIndex + 1);
  }

  final numList = number.split(RegExp(delimiterPattern));
  final integerList = numList.map(int.parse).toList();

  //check for negative numbers
  final negative = integerList.where((n) => n < 0).toList();
  if (negative.isNotEmpty) {
    throw Exception('negative numbers not allowed : ${negative.join(',')}');
  }

  //check for number greater 1000 and omit it
  final filteredList = integerList.where((n) => n <= 1000).toList();

  return filteredList.isEmpty ? 0 : filteredList.reduce((a, b) => a + b);
}

/*===============================================================================================================*/

String delimiterIs(int num, String numbers, int delimiterIndex) {
  return RegExp.escape(numbers.substring(num, delimiterIndex));
}

String delimiterFn(String num) {
  final delimiters = <String>[];

  int start = 0;
  while (true) {
    final open = num.indexOf('[', start);
    if (open == -1) break;
    final close = num.indexOf(']', open);
    delimiters.add(RegExp.escape(num.substring(open + 1, close)));
    start = close + 1;
  }
  return delimiters.join('|');
}
