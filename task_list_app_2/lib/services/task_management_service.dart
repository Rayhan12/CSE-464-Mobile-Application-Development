import 'package:flutter/material.dart';
import 'package:task_list_app_2/models/task_model.dart';

class TaskManagementService extends ChangeNotifier{

  int counter = 0;

  List<TaskModel> tasks = [];


  void addTask(TaskModel task){
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(TaskModel task){
    tasks.remove(task);
    notifyListeners();
  }

  void completeTask(TaskModel task){
    tasks.where((t) => t == task).forEach((t) => t.isCompleted = true);
    notifyListeners();
  }




  void addCount(){
    counter++;
    notifyListeners();
  }

  void removeCount(){
    if(counter>0){
      counter--;
    }
    notifyListeners();
  }

  void resetCount(){
    counter=0;
    notifyListeners();
  }

}