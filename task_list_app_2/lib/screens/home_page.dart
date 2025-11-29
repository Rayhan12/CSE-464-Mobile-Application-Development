import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_app_2/models/task_model.dart';
import 'package:task_list_app_2/screens/add_task_page.dart';
import 'package:task_list_app_2/screens/screen_one.dart';
import 'package:task_list_app_2/screens/screen_two.dart';
import 'package:task_list_app_2/services/task_management_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {

      final taskManagementService = Provider.of<TaskManagementService>(context, listen: false);


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
        builder: (context,tms,_) {
          
          if(tms.tasks.isEmpty){
            return Center(
              child: Text('No tasks available. Please add tasks.'),
            );
          }


          return ListView.builder(
            itemCount: tms.tasks.length,
            itemBuilder: (context, index){
              final localTask = tms.tasks[index];

              return ListTile(
                title: Text(localTask.title),
                subtitle: Text(localTask.description),
                // trailing: Icon(
                //   localTask.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                //   color: localTask.isCompleted ? Colors.green : null,
                // ),
                trailing: IconButton(onPressed: (){
                  tms.removeTask(localTask);
                }, icon: Icon(Icons.delete)),


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
        }
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){

           Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTaskPage()));

          // final tms = Provider.of<TaskManagementService>(context , listen: false);

          // final TaskModel newtask = TaskModel(
          //   index: tms.tasks.length+1,
          //    title: "This is a tesk title ${tms.tasks.length+1}",
          //     description: "SOME DATA IS HERE AS INFO"
          //     );


          // tms.addTask(newtask);
        },
        child: Icon(Icons.add),
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
                ).push(MaterialPageRoute(builder: (context) => ScreenOne()));
              },
              child: Text('Screen One'),
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
