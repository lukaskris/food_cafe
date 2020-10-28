import 'package:flutter/material.dart';
import 'package:food_cafe/controller/splash_controller.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Scaffold(
            body: Center(child: Text(appName, style: splashTitleStyle))));
  }
}
