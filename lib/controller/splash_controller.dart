import 'package:food_cafe/resource/routes.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _init();
  }

  _init() async {
    Get.offNamed(loginRoute);
  }
}
