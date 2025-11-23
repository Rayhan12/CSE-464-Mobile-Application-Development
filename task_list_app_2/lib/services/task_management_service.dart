import 'package:flutter/material.dart';

class TaskManagementService extends ChangeNotifier{

  int counter = 0;


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