import 'package:food_cafe/resource/api.dart';
import 'package:food_cafe/resource/routes.dart';
import 'package:food_cafe/shared/repository/local_auth_repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  var _localAuthRepository = Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    super.onReady();
    _launchPage();
  }

  _launchPage() async {
    final requestToken =
        await _localAuthRepository.getSession(SECURE_STORAGE_USERNAME);
    Get.offNamed(requestToken != null ? homeRoute : loginRoute);
  }
}
