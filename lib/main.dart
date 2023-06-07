import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:platform_controller/utils/route_utils.dart';
import 'package:platform_controller/views/screens/Ios_add_page.dart';
import 'package:platform_controller/views/screens/andro_add_page.dart';
import 'package:platform_controller/views/screens/android_home_page.dart';
import 'package:platform_controller/views/screens/ios_call_page.dart';
import 'package:platform_controller/views/screens/ios_home_page.dart';
import 'package:provider/provider.dart';
import'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      builder:(context) => MultiProvider(providers:[
        ChangeNotifierProvider(create: (context) => PlatformController(),),
        ChangeNotifierProvider(create: (context) => MyDate(),)
      ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlatformController>(builder: (context,provider, child) => (provider.isAndroid)?MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: provider.IsDark?ThemeData(
          brightness: Brightness.light,
          colorSchemeSeed: Colors.blue,
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontSize: 25,
              color: Colors.black
            ),
          ),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            color: Colors.blue,
            foregroundColor: Colors.white,
            toolbarHeight: 100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30),),),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          )
      ): ThemeData(
        colorSchemeSeed: Colors.deepPurple,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple,
            foregroundColor: Colors.white,
            toolbarHeight: 100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30),),),
          ),
          useMaterial3: true,

          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.black,
            backgroundColor: Colors.deepPurple.shade200,
          )
      ),

      routes: {
        '/':(context) => Homeandro(),
        Myroutes.andro_add:(context) => Andro_Add(),

      },
    ):CupertinoApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routes: {
      '/':(p0) => Homeios(),
        Myroutes.ios_add:(p0) => Ios_Add(),
      },
    ),
    );
  }
}


