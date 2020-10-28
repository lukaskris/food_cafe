import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app_module.dart';
import 'resource/colors.dart';
import 'resource/hex_color.dart';
import 'resource/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            brightness: Brightness.light,
            accentColor: Colors.deepOrange,
            primaryColor: HexColor('#FFFFFF'),
            primarySwatch: Colors.deepOrange),
        initialRoute: firstLaunchRoute,
        getPages: AppPages.pages);
  }
}
