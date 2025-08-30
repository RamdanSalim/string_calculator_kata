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
