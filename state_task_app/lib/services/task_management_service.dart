import 'package:flutter/material.dart';

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

}