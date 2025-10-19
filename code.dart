class Person{
  String name;
  int age;
  int id;

  Person({required  this.name,required this.age, required this.id });

  Person.withoutId({required this.name, required this.age}): id = 0;

  void introduce() {
    print("Hello, my name is $name and I am $age years old.");
  }
}

class PX{
  int? x;
  int? y;

  PX();
  PX.withCoordinates(this.x, this.y);

  int _proivateNumber = 42;

  get privateNumber =>  10 *  _proivateNumber;


  static void demo(){
    print("Demo method called");
  }

  void showCoordinates(){
    print("Coordinates: ($x, $y)");
  }

}


abstract class Util{
  int? x;

  Util();


  int calculate({required int a, required int b});  

}


class AdvancedUtil extends Util{
  @override
  int calculate({required int a, required int b}) {
    return a + b;
  }
}


abstract class Analysis{
  void sendInt();
  void sendString();
  void sendErrorReport({required String errorMessage});
}

class GoogleAnalysis implements Analysis{
  @override
  void sendErrorReport({required String errorMessage}) {

    logEvent('test');
    print("Google Analysis Error: $errorMessage");
  }

  void logEvent(String eventName){
    print("Google Analysis Event: $eventName");
  }

  @override
  void sendInt() {
    print("Google Analysis Int sent");
  }

  @override
  void sendString() {
    print("Google Analysis String sent");
  }
}


class Test{
  final Analysis analysis;

  Test(this.analysis);
}

class Box<T>{
  T? value;

  Box(this.value);
}


void main(List<String> args) {

  Box<int> intBox = Box<int>(10);
  Box<String> strBox = Box<String>("Hello");

  // Person person1 = Person("Alice", 30, 1);
  // Person person2 = Person("Bob", 25, 2);

  // person1.introduce();
  // person2.introduce();

  Person person1 = Person(name: "Alice", age: 30, id: 1);
  Person person2 = Person.withoutId(name: "Bob", age: 25);


  PX point1 = PX();
  PX point2 = PX.withCoordinates(10, 20);




  point1.showCoordinates();
  PX.demo();

  GoogleAnalysis analysis = GoogleAnalysis();

  Analysis analysis2 = GoogleAnalysis(); //==> SOLID ==> L ==> Liskov Substitution Principle
 
  Test test = Test(GoogleAnalysis());
  Test test2 = Test(analysis2);

}