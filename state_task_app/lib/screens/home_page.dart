import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_task_app/screens/screen_one.dart';
import 'package:state_task_app/screens/screen_two.dart';
import 'package:state_task_app/services/task_management_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),



      body: Consumer<TaskManagementService>(
        builder: (context,taskManagementService,_) {

             


          return ListView(
            children: [
              ListTile(
                title: Text('Counter Value: ${taskManagementService.counter}', style: TextStyle(fontSize: 30),),
              ),


              ElevatedButton(
                onPressed: () {
                  taskManagementService.addCount();
                },
                child: Text('Add Count'),
              ),



              ElevatedButton(
                onPressed: () {
                  taskManagementService.subtractCount();
                },
                child: Text('Subtract Count'),
              ),

              
              ElevatedButton(
                onPressed: () {
                  taskManagementService.clearCounter();
                },
                child: Text('Clear Counter'),
              ),
            ],
          );
        }
      ),





      bottomNavigationBar: Container(
        height: 100,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ScreenOne()));
              },
              child: Text("Go to Screen One"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ScreenTwo()));
              },
              child: Text("Go to Screen Two"),
            ),
          ],
        ),
      ),
    );
  }
}
