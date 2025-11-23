import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_task_app/screens/home_page.dart';
import 'package:state_task_app/screens/screen_two.dart' show ScreenTwo;
import 'package:state_task_app/services/task_management_service.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
      ),


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


      bottomNavigationBar: Row(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
          }, child: Text("Go to Home Page")),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenTwo()));
          }, child: Text("Go to Screen Two")),
        ],
      ),


    );
  }
}
