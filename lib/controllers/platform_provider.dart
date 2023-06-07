import 'package:flutter/foundation.dart';

class PlatformController extends ChangeNotifier
{
    bool isAndroid = true;
    int navindex=0;

    void platform({required bool val}){
      isAndroid=!isAndroid;
      notifyListeners();
    }

    void nav({required int index}){
        navindex=index;
        notifyListeners();
    }
}