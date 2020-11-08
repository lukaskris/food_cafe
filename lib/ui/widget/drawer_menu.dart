import 'package:flutter/material.dart';
import 'package:food_cafe/controller/home_controller.dart';
import 'package:food_cafe/controller/login_controller.dart';
import 'package:food_cafe/resource/images.dart';
import 'package:food_cafe/resource/routes.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:get/get.dart';
import 'package:recase/recase.dart';

class DrawerMenu extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  final LoginController _loginController = Get.put(LoginController());

  final String userName, email, profileURL;
  DrawerMenu(
      {@required this.userName,
      @required this.email,
      @required this.profileURL,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.1),
              backgroundImage: profileURL.isEmpty
                  ? ExactAssetImage(profileImage)
                  : NetworkImage(profileURL)),
          title: Text(userName.titleCase, style: drawerUserNameStyle),
          subtitle: Text(email.toLowerCase(), style: drawerEmailStyle),
          onTap: () => Get.back()),
      ListTile(
          leading: Icon(pauseMenuIcon, size: 16),
          title: Text(titlePauseMenu, style: drawerMenuStyle),
          onTap: () {
            _homeController.currentPageIndex.value = 0;
            _homeController.drawerMenuChange(pauseMenuIndex);
            Get.back();
          }),
      ListTile(
          leading: Icon(turnOfOrderingIcon, size: 16),
          title: Text(titleTurnOfOrdering, style: drawerMenuStyle),
          onTap: () {
            Get.back();
            Get.toNamed(turnOfOrderingRoute);
          }),
      ListTile(
          leading: Icon(pastOrderIcon, size: 16),
          title: Text(titlePastOrder, style: drawerMenuStyle),
          onTap: () {
            _homeController.currentPageIndex.value = 0;
            _homeController.drawerMenuChange(pastOrder);
            Get.back();
          }),
      ListTile(
          leading: Icon(newOrderIcon, size: 16),
          title: Text(titleNewOrder, style: drawerMenuStyle),
          onTap: () {
            Get.back();
            Get.toNamed(newOrderRoute);
          }),
      ListTile(
          leading: Icon(kdsViewIcon, size: 16),
          title: Text(titleKDSView, style: drawerMenuStyle),
          onTap: () {
            _homeController.currentPageIndex.value = 0;
            _homeController.drawerMenuChange(KDSView);
            Get.back();
          }),
      ListTile(
          leading: Icon(profileIcon, size: 16),
          title: Text(titleProfile, style: drawerMenuStyle),
          onTap: () =>  Get.back()),
          ListTile(
              leading: Icon(changePasswordIcon, size: 16),
              title: Text(titleChangePassword, style: drawerMenuStyle),
              onTap: () =>  Get.back()),
      ListTile(
          leading: Icon(logoutIcon, size: 16),
          title: Text(titleLogout, style: drawerMenuStyle),
          onTap: () => _loginController.logout())
    ]));
  }
}
