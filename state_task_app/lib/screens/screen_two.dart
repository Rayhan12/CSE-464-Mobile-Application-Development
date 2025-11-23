
import 'package:flutter/material.dart';
import 'package:state_task_app/screens/home_page.dart';
import 'package:state_task_app/screens/screen_one.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: ListView(), 

      bottomNavigationBar: Row(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
          }, child: Text("Go to Home Page")),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenOne()));
          }, child: Text("Go to Screen One")),
        ],
      ),



    );
  }
}
