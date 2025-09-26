# 📱 Flutter Basics - Your First Steps into Mobile Development

<div align="center">

![Flutter Basics](https://img.shields.io/badge/Flutter-Basics-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-Fundamentals-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Beginner](https://img.shields.io/badge/Level-Beginner-4ECDC4?style=for-the-badge)

**Welcome to the foundation of everything Flutter! 🏗️**

*Where your mobile development journey truly begins! ✨*

</div>

---

## 🎯 What You'll Learn in This Branch

This branch covers the essential building blocks of Flutter development:

- 🎨 **Widgets**: The building blocks of Flutter apps
- 🎭 **Dart Basics**: Variables, functions, classes, and more
- 📐 **Layouts**: How to arrange widgets on screen
- 🧭 **Navigation**: Moving between different screens
- 🎨 **Styling**: Making your apps look beautiful

---

## 📚 Lecture Notes

### 1. Introduction to Flutter & Dart 🚀

**Flutter** is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.

**Dart** is the programming language used by Flutter. It's:
- Object-oriented
- Strongly typed
- Garbage collected
- Fast and efficient

#### Key Concepts:
```dart
// Variables in Dart
String name = "Flutter Developer";
int age = 25;
bool isLearning = true;
double height = 5.9;

// Functions
void sayHello() {
  print("Hello, Flutter World!");
}

// Classes
class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void introduce() {
    print("Hi, I'm $name and I'm $age years old!");
  }
}
```

### 2. Understanding Widgets 🧩

In Flutter, **everything is a widget**! Think of widgets as LEGO blocks that you can combine to build your app.

#### Types of Widgets:
- **StatelessWidget**: Widgets that don't change over time
- **StatefulWidget**: Widgets that can change and rebuild

```dart
// Stateless Widget Example
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(
          child: Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
```

---

## 💻 Hands-On Projects

### Project 1: Hello World App 👋
**Difficulty**: ⭐  
**Time**: 15 minutes

Create your very first Flutter app that displays "Hello, World!" on the screen.

**Requirements**:
- Create a new Flutter project
- Display "Hello, World!" in the center of the screen
- Add some basic styling (color, font size)

**Learning Goals**:
- Understanding the basic Flutter project structure
- Working with Text widgets
- Basic styling with TextStyle

### Project 2: Personal Profile Card 🎭
**Difficulty**: ⭐⭐  
**Time**: 30 minutes

Build a profile card that displays your information.

**Requirements**:
- Display your name, age, and a short bio
- Use a Column layout
- Add an image (or placeholder)
- Style with colors and fonts
- Add some padding and margins

**Learning Goals**:
- Working with Column and Row layouts
- Image handling
- Padding and margin concepts
- Basic styling

---

## 🎯 Key Takeaways

After completing this branch, you should understand:

1. **Dart Fundamentals**: Variables, functions, classes, and basic syntax
2. **Widget Concept**: Everything is a widget in Flutter
3. **Layout Basics**: How to arrange widgets using Container, Column, Row, etc.
4. **Navigation**: Moving between screens
5. **State Management**: Basic state handling with StatefulWidget
6. **Styling**: Making your apps look good with colors, fonts, and spacing

---

<div align="center">

**Happy Learning! 🎯**

*Remember: Every Flutter expert started with "Hello, World!"*

</div>
