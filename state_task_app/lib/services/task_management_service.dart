import 'package:flutter/material.dart';
import 'package:state_task_app/models/task.dart';

class TaskManagementService with ChangeNotifier{

  int counter = 0;

  void addCount(){
    counter++;
    notifyListeners();
  }

  void subtractCount(){
    counter--;
    notifyListeners();
  }

  void clearCounter(){
    counter = 0;
    notifyListeners();
  }



  List<Task> tasks = [];


  void addTask({required Task task}){
    tasks.add(task);
    notifyListeners();
  }


  void removeTask({required Task task}){
    tasks.remove(task);
    notifyListeners();


    // tasks.removeWhere((task) => task.id == task.id);
    // notifyListeners();
  }

}