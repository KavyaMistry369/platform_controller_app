import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class PlatformController extends ChangeNotifier
{
    bool isAndroid = true;
    int navindex=0;
    String? FullName;
    String? Phone_Number;
    String?Chats;
    File? Image;
    bool IsDark=false;
    bool IsOpen=true;
    bool IsTheme=false;


    void platform({required bool val}){
      isAndroid=!isAndroid;
      notifyListeners();
    }

    void nav({required int index}){
        navindex=index;
        notifyListeners();
    }

    void ios_nav({required int index}){
        navindex=index;
        notifyListeners();
    }

    void SetImage({required File MyImage}){
        Image=MyImage;
        notifyListeners();
    }

    void ChangeMyTheme(){
        IsDark=!IsDark;
        notifyListeners();
    }

    void ChangemyProfile(){
        IsOpen=!IsOpen;
        notifyListeners();
    }

    void ChangeTheme(){
        IsTheme=!IsTheme;
        notifyListeners();
    }


}