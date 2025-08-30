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

  test('two string numbers separated by , should return their sum',()
  {
    expect(add("2,4"),equals(6));
  });

  test('multiple string numbers should return the total sum',()
  {
    expect(add("5,3,2"),equals(10));
  });

  test('numbers separated by newlines should also return the total sum',()
  {
    expect(add("1\n2,3"),equals(6));
  });

  test('check for the delimiter and return the total sum',()
  {
    expect(add("//;\n1;2"),equals(3));
  });
}


//test code
int add(String num) {
  if(num.isEmpty)
  {
    return 0;
  }

  if(num.contains(','))
  {
    final sum = num.replaceAll('\n',',').split(',');
    return sum.map(int.parse).reduce((a,b)=> a+b);
  }

  return int.parse(num);
}
