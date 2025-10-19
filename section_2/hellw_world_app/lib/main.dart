import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'COUNTER APP', testBool: true),
      // home: const TESThome(),
    );
  }
}

// class TESThome extends StatelessWidget {
//   const TESThome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hello World App XXXXX'),
//       ),
//       body: const Center(
//         child: Text(
//           'Hello, World!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           height: 50.0,
//           color: Colors.blueGrey,
//           child: const Center(
//             child: Text(
//               '© 2024 My Company',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  final String title;
  final bool testBool;

  const MyHomePage({super.key, required this.title, required this.testBool});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),

            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 150,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text('Click Me')),
          ],
        ),
      ),

      // ---
      // ---
      // --- button ---

      // --- --- ---
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
