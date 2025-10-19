

import 'code.dart';

void doHeavyTask(){
  int sum = 0;
  for(int i=0; i<100000000; i++){
    sum += i;
  }
  print("Heavy Task Done: $sum");
}


Future<String> test()async{
  await Future.delayed(Duration(seconds: 2));
  return "Test Complete";
}

// API, System call 

Future<void> fetchDataFromServer() async {
  print('x');
  print(await test()); // Awaiting here for string to be
  print('After TEST');
  await Future.delayed(Duration(seconds: 3));
  print("Data fetched from server");
}


void main(List<String> args) {
  fetchDataFromServer();
}