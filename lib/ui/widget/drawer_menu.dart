import 'package:flutter/material.dart';
import 'package:food_cafe/controller/home_controller.dart';
import 'package:food_cafe/resource/images.dart';
import 'package:food_cafe/resource/routes.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:recase/recase.dart';

class DrawerMenu extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            backgroundImage: AssetImage(profileImage),
          ),
          title: Text(developerName.titleCase, style: drawerUserNameStyle),
          subtitle: Text(developerEmail.toLowerCase(), style: drawerEmailStyle),
          onTap: () => Get.back()),
      ListTile(
          leading: Icon(LineIcons.pause, size: 16),
          title: Text('Pause Menu', style: drawerMenuStyle),
          onTap: () {
            _homeController.currentPageIndex.value = 0;
            _homeController.drawerMenuChange(pauseMenuIndex);
            Get.back();
          }),
      ListTile(
          leading: Icon(LineIcons.close, size: 16),
          title: Text('Turn of Ordering', style: drawerMenuStyle)),
      ListTile(
          leading: Icon(LineIcons.list, size: 16),
          title: Text('Past Order', style: drawerMenuStyle),
          onTap: () {
            _homeController.currentPageIndex.value = 0;
            _homeController.drawerMenuChange(pastOrder);
            Get.back();
          }),
      ListTile(
          leading: Icon(LineIcons.bell, size: 16),
          title: Text('New Order', style: drawerMenuStyle),
          onTap: () {
            Get.back();
            Get.toNamed(newOrderRoute);
          }),
      ListTile(
          leading: Icon(LineIcons.street_view, size: 16),
          title: Text('KDS View', style: drawerMenuStyle),
          onTap: () {
            _homeController.currentPageIndex.value = 0;
            _homeController.drawerMenuChange(KDSView);
            Get.back();
          }),
      ListTile(
          leading: Icon(LineIcons.lock, size: 16),
          title: Text('Logout', style: drawerMenuStyle),
          onTap: () => Get.offAllNamed(loginRoute))
    ]));
  }
}
