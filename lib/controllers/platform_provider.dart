import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_controller/utils/route_utils.dart';

class PlatformController extends ChangeNotifier
{
    bool isAndroid = true;
    int navindex=0;
    String? FullName;
    String? Phone_Number;
    String?Chats;
    String? Image;
    bool IsDark=false;
    bool IsOpen=false;
    bool IsTheme=false;


    void platform({required bool val}){
      isAndroid=!isAndroid;
      notifyListeners();
    }

    void nav({required int index}){
        navindex=index;
        notifyListeners();
    }

    void SetImage({required File MyImage}){
        Image=MyImage as String?;
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