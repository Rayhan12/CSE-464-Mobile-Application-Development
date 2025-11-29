import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_app_2/screens/home_page.dart';
import 'package:task_list_app_2/screens/screen_two.dart';
import 'package:task_list_app_2/services/task_management_service.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen One Page')),

      body: Consumer<TaskManagementService>(
        builder: (context, tms, _) {
          return ListView.builder(
            itemCount: tms.tasks.length,
            itemBuilder: (context, index) {
              final localTask = tms.tasks[index];

              return ListTile(
                title: Text(localTask.title),
                subtitle: Text(localTask.description),
                trailing: Icon(
                  localTask.isCompleted
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color: localTask.isCompleted ? Colors.green : null,
                ),
              );
            },
          );

          // return ListView(
          //   children: [

          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(tms.counter.toString(), style: TextStyle(fontSize: 30),),
          //       ],
          //     ),

          //     ElevatedButton(onPressed: (){tms.addCount();}, child: Text('Add Value')),
          //     ElevatedButton(onPressed: (){tms.removeCount();}, child: Text('Remove Value')),
          //     ElevatedButton(onPressed: (){tms.resetCount();}, child: Text('Reset Value')),
          //   ],

          // );
        },
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Home Page'),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ScreenTwo()));
              },
              child: Text('Screen Two'),
            ),
          ],
        ),
      ),
    );
  }
}
