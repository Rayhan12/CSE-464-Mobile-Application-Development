import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_task_app/models/task.dart';
import 'package:state_task_app/screens/add_task.dart';
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
  void initState() {
 
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),



      body: Consumer<TaskManagementService>(
        builder: (context,taskManagementService,_) {

          if(taskManagementService.tasks.isEmpty){
            
            return Center(
              child: Text('No Tasks Added Yet!'),
            );
          }



          return ListView.builder(
            itemCount: taskManagementService.tasks.length,
            itemBuilder: (context,index){

              final localTask = taskManagementService.tasks[index];

              return ListTile(
                title: Text(localTask.title),

                subtitle: Text(localTask.description),


                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){
                    taskManagementService.removeTask(task: localTask);
                  },
                ),
              );

            },

            // children: [
            //   ListTile(
            //     title: Text('Counter Value: ${taskManagementService.counter}', style: TextStyle(fontSize: 30),),
            //   ),


            //   ElevatedButton(
            //     onPressed: () {
            //       taskManagementService.addCount();
            //     },
            //     child: Text('Add Count'),
            //   ),



            //   ElevatedButton(
            //     onPressed: () {
            //       taskManagementService.subtractCount();
            //     },
            //     child: Text('Subtract Count'),
            //   ),

              
            //   ElevatedButton(
            //     onPressed: () {
            //       taskManagementService.clearCounter();
            //     },
            //     child: Text('Clear Counter'),
            //   ),
            // ],
          );
        }
      ),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTaskPage()));
          
          
          // final taskManagementService = Provider.of<TaskManagementService>(context,listen: false);
          
          // taskManagementService.addTask(task: 
          
          // Task(
          //   id: taskManagementService.tasks.length + 1,
          //   title: 'This is a task title ${taskManagementService.tasks.length + 1}',
          //   description: 'Easy task description',
          //   )
          //   );
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
