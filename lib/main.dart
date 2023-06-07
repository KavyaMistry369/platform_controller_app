import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_controller/controllers/date_controller.dart';
import 'package:platform_controller/controllers/platform_provider.dart';
import 'package:platform_controller/utils/route_utils.dart';
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
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurpleAccent,
        useMaterial3: true,
      ),

      routes: {
        '/':(context) => Homeandro(),

      },
    ):CupertinoApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routes: {
      '/':(p0) => Homeios(),
      },
    ),
    );
  }
}


