import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class HomeController extends GetxController {
  final currentPageIndex = 0.obs;
  final drawerMenuIndex = 0.obs;
  PageController pageController;
  final LoginController _loginController = Get.put(LoginController());

  @override
  onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPageIndex.value);
    _loginController.getUserName();
  }

  onTabChange(int index) {
    currentPageIndex.value = index;

    if (drawerMenuIndex > 3) drawerMenuIndex.value = 0;
  }

  drawerMenuChange(int index) {
    drawerMenuIndex.value = index;
  }

  @override
  onClose() {
    pageController.dispose();
    super.onClose();
  }
}
