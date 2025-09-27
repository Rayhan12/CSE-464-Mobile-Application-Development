# 🎯 Dart Basics - Your Programming Foundation

<div align="center">

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Basics](https://img.shields.io/badge/Level-Basics-4ECDC4?style=for-the-badge)
![Flutter](https://img.shields.io/badge/Flutter-Ready-02569B?style=for-the-badge&logo=flutter&logoColor=white)

**Master the Language That Powers Flutter! 🚀**

*Every Flutter expert started here - let's build your foundation! ✨*

</div>

---

## 🎯 Class 1: Dart Basics Overview

Welcome to your first step into the world of Dart! This branch covers all the fundamental concepts you need to master before diving into Flutter development.

### 📚 What You'll Learn

- 🎭 **Variables & Data Types**: The building blocks of Dart
- 🔒 **Constants & Final**: Immutable values
- ⚡ **Operators**: Mathematical and logical operations
- 🔀 **Control Flow**: Making decisions and repeating actions
- 🎪 **Functions**: Reusable code blocks
- 📋 **Collections**: Lists, Maps, and Sets
- 🛡️ **Null Safety**: Dart's modern approach to null handling
- 💬 **Input/Output**: Communicating with users

---

## 📖 Lecture Notes

### 1. Introduction to Dart & Dart SDK 🚀

**Dart** is a client-optimized language for fast apps on any platform. It's the language that powers Flutter!

#### Why Dart?
- ⚡ **Fast**: Compiles to native code
- 🎯 **Productive**: Great tooling and IDE support
- 🛡️ **Safe**: Strong typing and null safety
- 🌐 **Portable**: Runs on mobile, web, and desktop

#### Dart SDK Installation:
```bash
# Check if Dart is installed
dart --version

# If not installed, follow the Flutter installation guide
# Dart comes bundled with Flutter
```

### 2. Variables & Data Types 🎭

Dart is a statically typed language, but it can infer types.

```dart
void main() {
  // Explicit type declaration
  String name = "Flutter Developer";
  int age = 25;
  double height = 5.9;
  num number = 5.6 || 9;
  bool isLearning = true;
  
  // Type inference with 'var'
  var city = "Dhaka";        // Dart infers this as String
  var score = 95.5;          // Dart infers this as double
  var isPassed = true;       // Dart infers this as bool
  
  // Dynamic type (use sparingly!)
  dynamic anything = "Hello";
  anything = 42;
  anything = true;
  
  print("Name: $name, Age: $age, Height: $height");
  print("City: $city, Score: $score, Passed: $isPassed");
}
```

#### Data Types Summary:
| Type | Description | Example |
|------|-------------|---------|
| `int` | Integer numbers | `42`, `-17` |
| `double` | Decimal numbers | `3.14`, `-2.5` |
| `String` | Text data | `"Hello World"` |
| `bool` | True/false values | `true`, `false` |
| `var` | Type inference | `var x = 42` |
| `dynamic` | Any type | `dynamic x = "anything"` |

### 3. Constants & Final 🔒

Both `const` and `final` create immutable values, but they work differently.

```dart
void main() {
  // final - runtime constant
  final String currentTime = DateTime.now().toString();
  final int userAge = calculateAge(); // Function call allowed
  
  // const - compile-time constant
  const String appName = "My Flutter App";
  const double pi = 3.14159;
  const List<String> colors = ["red", "green", "blue"];
  
  // const objects
  const person = Person("John", 25); // All fields must be const
  
  print("App: $appName, PI: $pi");
  print("Current time: $currentTime");
}

class Person {
  final String name;
  final int age;
  
  const Person(this.name, this.age);
}

int calculateAge() {
  return 25; // Simplified for example
}
```

### 4. Operators ⚡

Dart supports various types of operators.

```dart
void main() {
  int a = 10;
  int b = 3;
  
  // Arithmetic operators
  print("Addition: ${a + b}");        // 13
  print("Subtraction: ${a - b}");     // 7
  print("Multiplication: ${a * b}");  // 30
  print("Division: ${a / b}");        // 3.333...
  print("Integer division: ${a ~/ b}"); // 3
  print("Modulus: ${a % b}");         // 1
  
  // Comparison operators
  print("Equal: ${a == b}");          // false
  print("Not equal: ${a != b}");      // true
  print("Greater than: ${a > b}");    // true
  print("Less than: ${a < b}");       // false
  print("Greater or equal: ${a >= b}"); // true
  print("Less or equal: ${a <= b}");  // false
  
  // Logical operators
  bool x = true;
  bool y = false;
  print("AND: ${x && y}");            // false
  print("OR: ${x || y}");             // true
  print("NOT: ${!x}");                // false
  
  // Assignment operators
  int c = 5;
  c += 3;  // c = c + 3
  c -= 2;  // c = c - 2
  c *= 2;  // c = c * 2
  c ~/= 3; // c = c ~/ 3
  print("Final c: $c");
}
```

### 5. Conditional Statements 🔀

Control the flow of your program with conditions.

```dart
void main() {
  int score = 85;
  String grade;
  
  // if-else statements
  if (score >= 90) {
    grade = "A";
  } else if (score >= 80) {
    grade = "B";
  } else if (score >= 70) {
    grade = "C";
  } else if (score >= 60) {
    grade = "D";
  } else {
    grade = "F";
  }
  
  print("Grade: $grade");
  
  // Ternary operator
  String status = score >= 60 ? "Passed" : "Failed";
  print("Status: $status");
  
  // Switch statement
  String day = "Monday";
  switch (day) {
    case "Monday":
    case "Tuesday":
    case "Wednesday":
    case "Thursday":
    case "Friday":
      print("Weekday");
      break;
    case "Saturday":
    case "Sunday":
      print("Weekend");
      break;
    default:
      print("Invalid day");
  }
}
```

### 6. Loops 🔄

Repeat code execution with different loop types.

```dart
void main() {
  // for loop
  print("For loop:");
  for (int i = 1; i <= 5; i++) {
    print("Count: $i");
  }
  
  // while loop
  print("\nWhile loop:");
  int j = 1;
  while (j <= 3) {
    print("While count: $j");
    j++;
  }
  
  // do-while loop
  print("\nDo-while loop:");
  int k = 1;
  do {
    print("Do-while count: $k");
    k++;
  } while (k <= 3);
  
  // for-in loop (for collections)
  print("\nFor-in loop:");
  List<String> fruits = ["apple", "banana", "orange"];
  for (String fruit in fruits) {
    print("Fruit: $fruit");
  }
  
  // forEach method
  print("\nForEach method:");
  fruits.forEach((fruit) => print("Fruit: $fruit"));
}
```

### 7. Functions 🎪

Create reusable code blocks with functions.

```dart
// Function with return type
int add(int a, int b) {
  return a + b;
}

// Arrow function (single expression)
int multiply(int a, int b) => a * b;

// Function with optional parameters
String greet(String name, [String? title]) {
  if (title != null) {
    return "Hello, $title $name!";
  }
  return "Hello, $name!";
}

// Function with named parameters
String createUser({required String name, int age = 18, String? email}) {
  String result = "Name: $name, Age: $age";
  if (email != null) {
    result += ", Email: $email";
  }
  return result;
}

// Function with default values
double calculateArea(double length, [double width = 1.0]) {
  return length * width;
}

void main() {
  // Using functions
  print("Sum: ${add(5, 3)}");
  print("Product: ${multiply(4, 6)}");
  print(greet("Alice"));
  print(greet("Bob", "Dr."));
  print(createUser(name: "Charlie", age: 25, email: "charlie@example.com"));
  print("Area: ${calculateArea(10.0)}");
  print("Rectangle Area: ${calculateArea(10.0, 5.0)}");
}
```

### 8. Lists & List Operations 📋

Lists are ordered collections of objects.

```dart
void main() {
  // Creating lists
  List<int> numbers = [1, 2, 3, 4, 5];
  var fruits = ["apple", "banana", "orange"]; // Type inferred
  List<String> emptyList = [];
  
  // Accessing elements
  print("First number: ${numbers[0]}");
  print("Last fruit: ${fruits[fruits.length - 1]}");
  
  // Adding elements
  numbers.add(6);
  numbers.addAll([7, 8, 9]);
  fruits.insert(1, "grape");
  
  // Removing elements
  numbers.remove(5);
  fruits.removeAt(0);
  
  // List operations
  print("Numbers: $numbers");
  print("Fruits: $fruits");
  print("Length: ${numbers.length}");
  print("Contains 3: ${numbers.contains(3)}");
  print("Index of 4: ${numbers.indexOf(4)}");
  
  // List methods
  numbers.sort();
  print("Sorted: $numbers");
  
  var doubled = numbers.map((n) => n * 2).toList();
  print("Doubled: $doubled");
  
  var evens = numbers.where((n) => n % 2 == 0).toList();
  print("Even numbers: $evens");
}
```

### 9. Maps & Map Operations 🗺️

Maps store key-value pairs.

```dart
void main() {
  // Creating maps
  Map<String, int> ages = {
    "Alice": 25,
    "Bob": 30,
    "Charlie": 35,
  };
  
  var scores = <String, double>{}; // Empty map
  Map<String, String> capitals = Map();
  
  // Adding elements
  ages["David"] = 28;
  scores["Math"] = 95.5;
  scores["Science"] = 87.0;
  
  // Accessing values
  print("Alice's age: ${ages["Alice"]}");
  print("Math score: ${scores["Math"]}");
  
  // Map operations
  print("All ages: $ages");
  print("All scores: $scores");
  print("Number of people: ${ages.length}");
  print("Has Alice: ${ages.containsKey("Alice")}");
  print("Has age 25: ${ages.containsValue(25)}");
  
  // Iterating through maps
  print("\nAges:");
  ages.forEach((name, age) {
    print("$name is $age years old");
  });
  
  print("\nScores:");
  for (String subject in scores.keys) {
    print("$subject: ${scores[subject]}");
  }
}
```

### 10. Sets 🎯

Sets contain unique elements (no duplicates).

```dart
void main() {
  // Creating sets
  Set<String> colors = {"red", "green", "blue"};
  var numbers = <int>{1, 2, 3, 4, 5};
  Set<String> emptySet = {};
  
  // Adding elements
  colors.add("yellow");
  colors.addAll(["purple", "orange"]);
  
  // Sets automatically remove duplicates
  numbers.add(3); // Won't add duplicate
  numbers.add(6); // Will add new element
  
  print("Colors: $colors");
  print("Numbers: $numbers");
  
  // Set operations
  Set<String> primaryColors = {"red", "blue", "yellow"};
  Set<String> secondaryColors = {"green", "purple", "orange"};
  
  // Union
  var allColors = primaryColors.union(secondaryColors);
  print("All colors: $allColors");
  
  // Intersection
  var commonColors = colors.intersection(primaryColors);
  print("Common colors: $commonColors");
  
  // Difference
  var onlyPrimary = primaryColors.difference(secondaryColors);
  print("Only primary: $onlyPrimary");
}
```

### 11. Null Safety 🛡️

Dart's null safety prevents null reference errors.

```dart
void main() {
  // Nullable types (can be null)
  String? nullableString;
  int? nullableInt;
  
  // Non-nullable types (cannot be null)
  String nonNullableString = "Hello";
  int nonNullableInt = 42;
  
  // Null-aware operators
  String? name;
  print("Name length: ${name?.length}"); // Safe call
  print("Name or default: ${name ?? "Unknown"}"); // Null coalescing
  
  // Null assertion operator (!) - use carefully!
  String? definitelyNotNull = "Hello";
  print("Definitely not null: ${definitelyNotNull!.length}");
  
  // late keyword - initialize later
  late String lateString;
  lateString = "Initialized later";
  print("Late string: $lateString");
  
  // Null safety in functions
  String? getUserName(int id) {
    if (id == 1) return "Alice";
    return null;
  }
  
  String? userName = getUserName(1);
  if (userName != null) {
    print("User: $userName");
  } else {
    print("User not found");
  }
}
```

### 12. Basic Input/Output 💬

Communicate with users through console I/O.

```dart
import 'dart:io';

void main() {
  // Output
  print("Hello, World!");
  print("This is a new line");
  
  // String interpolation
  String name = "Flutter Developer";
  int age = 25;
  print("Name: $name, Age: $age");
  print("Next year I'll be ${age + 1}");
  
  // Basic input (for console apps)
  stdout.write("Enter your name: ");
  String? input = stdin.readLineSync();
  print("Hello, $input!");
  
  // Number input
  stdout.write("Enter your age: ");
  String? ageInput = stdin.readLineSync();
  if (ageInput != null) {
    int? age = int.tryParse(ageInput);
    if (age != null) {
      print("You are $age years old");
    } else {
      print("Invalid age input");
    }
  }
}
```

---

## 💻 Hands-On Exercises

### Exercise 1: Calculator App 🧮
Create a simple calculator that performs basic operations.

**Requirements**:
- Take two numbers as input
- Perform addition, subtraction, multiplication, division
- Display results with proper formatting

### Exercise 2: Student Grade Calculator 📊
Build a program that calculates student grades.

**Requirements**:
- Input student name and scores
- Calculate average score
- Determine letter grade (A, B, C, D, F)
- Display results in a formatted way

### Exercise 3: Shopping List Manager 🛒
Create a shopping list management system.

**Requirements**:
- Add items to the list
- Remove items from the list
- Display all items
- Search for specific items
- Count total items

---

## 🎯 Key Takeaways

After completing this branch, you should understand:

1. **Dart Fundamentals**: Variables, data types, and basic syntax
2. **Control Flow**: Making decisions and repeating actions
3. **Functions**: Creating reusable code blocks
4. **Collections**: Working with Lists, Maps, and Sets
5. **Null Safety**: Dart's modern approach to null handling
6. **Input/Output**: Basic user interaction

---

## 🚀 Next Steps

Once you've mastered Dart basics:
1. Move to the `dart-advanced` branch for advanced concepts
2. Practice with more complex programs
3. Explore Dart's standard library
4. Get ready for Flutter development!

---

## 📚 Additional Resources

- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Dart API Documentation](https://api.dart.dev/)
- [DartPad](https://dartpad.dev/) - Online Dart editor

---

<div align="center">

**Master the Basics! 🎯**

*Every expert was once a beginner - you're on the right path!*

</div>
