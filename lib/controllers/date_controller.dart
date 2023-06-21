import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDate extends ChangeNotifier{

  DateTime mydate=DateTime.now();
  TimeOfDay Mytime=TimeOfDay.fromDateTime(DateTime.now());
  DateTime mytime=DateTime.now();

 void changemydate ({required DateTime Date}){
    this.mydate=Date;
    notifyListeners();
}

 changemytime({required DateTime time}){
   Mytime=TimeOfDay.fromDateTime(time);
   notifyListeners();
}

  Changemytime({required DateTime time}){
    mytime=TimeOfDay.fromDateTime(time) as DateTime;
    notifyListeners();
  }

}