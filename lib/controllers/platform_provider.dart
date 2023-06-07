import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformController extends ChangeNotifier
{
    bool isAndroid = true;
    int navindex=0;
    String? FullName;
    String? Phone_Number;
    String?Chats;
    File? Image;
    bool IsDark=false;

    void platform({required bool val}){
      isAndroid=!isAndroid;
      notifyListeners();
    }

    void nav({required int index}){
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
}