# 🚀 Dart Advanced - Mastering Object-Oriented Programming

<div align="center">

![Dart Advanced](https://img.shields.io/badge/Dart-Advanced-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![OOP](https://img.shields.io/badge/OOP-Master-FF6B6B?style=for-the-badge)
![Async](https://img.shields.io/badge/Async-Await-4ECDC4?style=for-the-badge)

**Level Up Your Dart Skills! 🎯**

*From basics to advanced - become a Dart ninja! ⚡*

</div>

---

## 🎯 Class 2: Dart Advanced Overview

Welcome to the advanced concepts of Dart! This branch covers everything you need to become a proficient Dart developer and prepare for complex Flutter applications.

### 📚 What You'll Learn

- 🏗️ **Classes & Objects**: Object-oriented programming fundamentals
- 🧬 **Inheritance & Polymorphism**: Code reuse and flexibility
- 🎭 **Mixins & Abstract Classes**: Advanced OOP concepts
- 🔌 **Interfaces & Implementations**: Contract-based programming
- ⚠️ **Exception Handling**: Robust error management
- 🎪 **Generics**: Type-safe reusable code
- ⏰ **Futures & Async/Await**: Asynchronous programming
- 🌊 **Streams**: Reactive programming
- 📦 **Collections Advanced**: Powerful data manipulation
- 🔧 **Extension Methods**: Adding functionality to existing types
- 📝 **Typedef & Function Types**: Function as first-class citizens
- 📚 **Packages & Imports**: Code organization and reuse

---

## 📖 Lecture Notes

### 1. Classes & Objects 🏗️

Classes are blueprints for creating objects. They encapsulate data and behavior.

```dart
// Basic class definition
class Person {
  // Instance variables (fields)
  String name;
  int age;
  String? email;
  
  // Constructor
  Person(this.name, this.age, [this.email]);
  
  // Named constructor
  Person.guest() : name = "Guest", age = 0;
  
  // Instance methods
  void introduce() {
    print("Hi, I'm $name and I'm $age years old!");
    if (email != null) {
      print("My email is $email");
    }
  }
  
  // Getter
  String get info => "$name ($age years old)";
  
  // Setter
  set updateAge(int newAge) {
    if (newAge >= 0) {
      age = newAge;
    }
  }
  
  // Static method
  static Person createAdult(String name) {
    return Person(name, 18);
  }
  
  // Override toString
  @override
  String toString() {
    return "Person(name: $name, age: $age, email: $email)";
  }
}

void main() {
  // Creating objects
  Person person1 = Person("Alice", 25, "alice@example.com");
  Person person2 = Person.guest();
  
  // Using objects
  person1.introduce();
  print(person2.info);
  person1.updateAge = 26;
  print(person1);
  
  // Static method
  Person adult = Person.createAdult("Charlie");
  print(adult);
}
```

### 2. Inheritance & Polymorphism 🧬

Inheritance allows classes to inherit properties and methods from other classes.

```dart
// Base class (Parent)
class Animal {
  String name;
  int age;
  
  Animal(this.name, this.age);
  
  void makeSound() {
    print("Some generic animal sound");
  }
  
  void eat() {
    print("$name is eating");
  }
}

// Derived class (Child)
class Dog extends Animal {
  String breed;
  
  // Constructor with super call
  Dog(String name, int age, this.breed) : super(name, age);
  
  // Override parent method
  @override
  void makeSound() {
    print("$name barks: Woof! Woof!");
  }
  
  // Additional method specific to Dog
  void fetch() {
    print("$name is fetching the ball");
  }
}

class Cat extends Animal {
  bool isIndoor;
  
  Cat(String name, int age, this.isIndoor) : super(name, age);
  
  @override
  void makeSound() {
    print("$name meows: Meow! Meow!");
  }
  
  void purr() {
    print("$name is purring");
  }
}

void main() {
  // Polymorphism in action
  List<Animal> animals = [
    Dog("Buddy", 3, "Golden Retriever"),
    Cat("Whiskers", 2, true),
    Animal("Generic", 1),
  ];
  
  // Each animal makes its own sound (polymorphism)
  for (Animal animal in animals) {
    animal.makeSound();
    animal.eat();
    print("---");
  }
}
```

### 3. Mixins & Abstract Classes 🎭

Mixins provide a way to reuse code in multiple class hierarchies.

```dart
// Mixin definition
mixin Flyable {
  void fly() {
    print("Flying through the air");
  }
  
  void land() {
    print("Landing safely");
  }
}

mixin Swimmable {
  void swim() {
    print("Swimming in water");
  }
}

// Abstract class
abstract class Bird {
  String name;
  
  Bird(this.name);
  
  // Abstract method (must be implemented by subclasses)
  abstract void makeSound();
  
  // Concrete method
  void breathe() {
    print("$name is breathing");
  }
}

// Class using mixins
class Duck extends Bird with Swimmable, Flyable {
  Duck(String name) : super(name);
  
  @override
  void makeSound() {
    print("$name quacks: Quack! Quack!");
  }
}

void main() {
  Duck duck = Duck("Donald");
  
  // Using mixin methods
  duck.makeSound();
  duck.swim();
  duck.fly();
}
```

### 4. Exception Handling ⚠️

Handle errors gracefully with try-catch blocks.

```dart
// Custom exception class
class CustomException implements Exception {
  final String message;
  CustomException(this.message);
  
  @override
  String toString() => "CustomException: $message";
}

class Calculator {
  static double divide(double a, double b) {
    if (b == 0) {
      throw CustomException("Division by zero is not allowed");
    }
    return a / b;
  }
}

void main() {
  // Basic exception handling
  try {
    double result = Calculator.divide(10, 0);
    print("Result: $result");
  } on CustomException catch (e) {
    print("Custom error: $e");
  } catch (e) {
    print("Unexpected error: $e");
  } finally {
    print("This always executes");
  }
}
```

### 5. Generics 🎪

Generics allow you to write type-safe, reusable code.

```dart
// Generic class
class Box<T> {
  T content;
  
  Box(this.content);
  
  T getContent() => content;
  
  void setContent(T newContent) {
    content = newContent;
  }
}

// Generic function
T findFirst<T>(List<T> list, bool Function(T) predicate) {
  for (T item in list) {
    if (predicate(item)) {
      return item;
    }
  }
  throw Exception("No matching item found");
}

void main() {
  // Using generic class
  Box<String> stringBox = Box("Hello");
  Box<int> intBox = Box(42);
  
  print("String box: ${stringBox.getContent()}");
  print("Int box: ${intBox.getContent()}");
  
  // Using generic function
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int firstEven = findFirst(numbers, (n) => n % 2 == 0);
  print("First even number: $firstEven");
}
```

### 6. Futures & Async/Await ⏰

Handle asynchronous operations with Futures and async/await.

```dart
import 'dart:async';

// Simulating async operations
Future<String> fetchUserName(int id) async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));
  
  if (id == 1) {
    return "Alice";
  } else if (id == 2) {
    return "Bob";
  } else {
    throw Exception("User not found");
  }
}

// Async function with error handling
Future<void> loadUserData(int userId) async {
  try {
    print("Loading user data for ID: $userId");
    
    String name = await fetchUserName(userId);
    print("User name: $name");
    
    print("User data loaded successfully!");
  } catch (e) {
    print("Error loading user data: $e");
  }
}

void main() async {
  print("=== Async/Await Demo ===");
  await loadUserData(1);
}
```

### 7. Extension Methods 🔧

Add functionality to existing types without modifying their source code.

```dart
// Extension on String
extension StringExtension on String {
  bool get isEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
  
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
  
  String get reverse {
    return split('').reversed.join('');
  }
}

// Extension on int
extension IntExtension on int {
  bool get isEven => this % 2 == 0;
  bool get isOdd => this % 2 != 0;
  
  String get ordinal {
    if (this >= 11 && this <= 13) {
      return '${this}th';
    }
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }
}

void main() {
  // Using String extensions
  String email = "user@example.com";
  String name = "john doe";
  
  print("Is email valid: ${email.isEmail}");
  print("Capitalized: ${name.capitalize}");
  print("Reversed: ${name.reverse}");
  
  // Using int extensions
  int number = 12;
  print("Is even: ${number.isEven}");
  print("Ordinal: ${number.ordinal}");
}
```

---

## 💻 Hands-On Projects

### Project 1: Library Management System 📚
**Difficulty**: ⭐⭐⭐⭐  
**Time**: 2 hours

Build a complete library management system using advanced Dart concepts.

**Requirements**:
- Book class with inheritance (Fiction, NonFiction)
- User management with mixins
- Exception handling for invalid operations
- Generic collections for different data types
- Async operations for data loading

### Project 2: Weather App with Streams 🌤️
**Difficulty**: ⭐⭐⭐⭐⭐  
**Time**: 2.5 hours

Create a weather app that uses streams for real-time data.

**Requirements**:
- Stream-based weather data
- Error handling with custom exceptions
- Generic data processing
- Extension methods for data formatting
- Async/await for API calls

---

## 🎯 Key Takeaways

After completing this branch, you should understand:

1. **Object-Oriented Programming**: Classes, inheritance, polymorphism
2. **Advanced OOP**: Mixins, abstract classes, interfaces
3. **Error Handling**: Robust exception management
4. **Generics**: Type-safe reusable code
5. **Asynchronous Programming**: Futures, async/await, streams
6. **Advanced Collections**: Functional programming concepts
7. **Extension Methods**: Adding functionality to existing types
8. **Function Types**: Functions as first-class citizens
9. **Package Management**: Code organization and imports

---

## 🚀 Next Steps

Once you've mastered Dart advanced concepts:
1. Move to Flutter-specific branches
2. Practice with real-world projects
3. Explore Flutter's widget system
4. Build complex mobile applications

---

<div align="center">

**You're Now a Dart Ninja! 🥷**

*Ready to conquer Flutter development!*

</div>
