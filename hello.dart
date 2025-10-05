void main() {
  String greet(String name, [String? title]) {
  if (title != null) {
    return "Hello, $title $name!";
  }
  return "Hello, $name!";
}

  print(greet("Alice")); // Output: Hello, Alice!
  print(greet("Bob", "Dr.")); // Output: Hello, Dr. Bob!



  int add({required int firstValue, int? b ,required int c}){
    return firstValue+(b ?? 0)+c;
  };


  add( b: 100, c: 3, firstValue: 10);



  List<num> x = [];

  x.add(1);
  x.add(2);
  x.add(12.5);

  print(x);

// print(x.length);
  x.removeRange(0,1);
  print(x);

  x.remove(12.5);
  print(x);


  List<num> numberList = [1,2,3,4,5,6,7,8,9,10];


  print(numberList);
  for (var number in numberList){
    print(number+1);
  }

  numberList.map((element){
    if(element % 2 == 0){
      print("EVEN NUMBER: $element");
      return element * 2;
    } else {
      print("ODD NUMBER: $element");
      return element;
    }
  } ).toList();


  numberList.where((element) => element == 5).toList();
}
