import 'package:flutter/cupertino.dart';

class MyDate extends ChangeNotifier{

  DateTime mydate=DateTime.now();

 void  changemydate ({required DateTime Date}){
    this.mydate=Date;
    notifyListeners();
}

}