import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class PageChange extends ChangeNotifier{

  PageController MyPageController=PageController(initialPage: 0);
  NotchBottomBarController MyNotchController=NotchBottomBarController();

  int MyIndex=0;

  void ChangeMyPage({required int index}){

    MyPageController.animateToPage(index, duration: Duration(milliseconds: 600), curve: Curves.linear);
    MyIndex=index;
    notifyListeners();
  }

}