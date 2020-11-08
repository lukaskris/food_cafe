import 'package:flutter/material.dart';
import 'package:food_cafe/controller/controller.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/images.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/ui/widget/bottom_sheet_custom.dart';
import 'package:food_cafe/ui/widget/drawer_menu.dart';
import 'package:get/get.dart';
import 'accepted_page.dart';
import 'dispatched_page.dart';
import 'kds_view_page.dart';
import 'past_order_page.dart';
import 'pause_menu_page.dart';
import 'pending_page.dart';
import 'ready_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final HomeController _homeController = Get.put(HomeController());
  final LoginController _loginController = Get.put(LoginController());

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _renderBody(context);

  _renderBody(BuildContext context) {
    return Obx(() => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            elevation: 0.3,
            actions: [
              _homeController.drawerMenuIndex.value == 0
                  ? Container(
                      margin: EdgeInsets.only(right: 10),
                      child:
                          Icon(searchIcon, size: 18, color: appBarTitleColor))
                  : Container()
            ],
            leading: IconButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  bottomSheetCustom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      isScrollControlled: true,
                      isDismissible: true,
                      backgroundColor: backgroundColor,
                      context: context,
                      builder: (context) => Obx(() => DrawerMenu(
                            userName:
                                _loginController.secureStorageUserName.value,
                            email: _loginController.secureStorageEmail.value,
                            profileURL:
                                _loginController.secureStorageProfileURL.value,
                          )));
                },
                icon: Icon(navigationIcon, size: 18, color: appBarTitleColor)),
            title: Column(children: [Text(appName, style: appBarTitleStyle)])),
        body: PageView(
            physics: new NeverScrollableScrollPhysics(),
            children: [
              _redirectPage(),
              _redirectPage(),
              _redirectPage(),
              _redirectPage()
            ],
            controller: _homeController.pageController),
        bottomNavigationBar: _bottomBar()));
  }

  _redirectPage() {
    if (_homeController.drawerMenuIndex.value == pauseMenuIndex) {
      return PauseMenuPage();
    } else if (_homeController.drawerMenuIndex.value == pastOrder) {
      return PastOrderPage();
    } else if (_homeController.drawerMenuIndex.value == pastOrder) {
      return PastOrderPage();
    } else if (_homeController.drawerMenuIndex.value == KDSView) {
      return KDSViewPage();
    } else {
      return _tabPages(_homeController.currentPageIndex.value);
    }
  }

  _tabPages(int index) {
    switch (index) {
      case pendingIndex:
        return PendingPage();
        break;
      case acceptedIndex:
        return AcceptedPage();
        break;
      case readyIndex:
        return ReadyPage();
        break;
      case dispatchedIndex:
        return DispatchedPage();
        break;
    }
  }

  _bottomBar() => BottomNavigationBar(
          elevation: 2,
          backgroundColor: tabBackgroundColor,
          fixedColor: tabSelectColor,
          unselectedItemColor: tabUnSelectColor,
          type: BottomNavigationBarType.fixed,
          onTap: _homeController.onTabChange,
          selectedLabelStyle: tabSelectStyle,
          unselectedLabelStyle: tabUnSelectStyle,
          currentIndex: _homeController.currentPageIndex.value,
          items: [
            BottomNavigationBarItem(
                icon: _renderTabBar(iconData: tabPendingIcon),
                label: drawerMenuPending),
            BottomNavigationBarItem(
                icon: _renderTabBar(iconData: tabAcceptedIcon),
                label: drawerMenuAccepted),
            BottomNavigationBarItem(
                icon: _renderTabBar(iconData: tabReadyIcon),
                label: drawerMenuReady),
            BottomNavigationBarItem(
                icon: _renderTabBar(iconData: tabDispatchedIcon),
                label: drawerMenuDispatched)
          ]);

  _renderTabBar({@required IconData iconData}) => Stack(children: <Widget>[
        Container(
            width: 30,
            height: 25,
            padding: const EdgeInsets.only(right: 0.0, top: 4),
            child: Icon(iconData)),
        Positioned(
            right: 0,
            top: 0,
            child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: countBackgroundColor,
                    borderRadius: BorderRadius.circular(8)),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child:
                    Text('00', style: countStyle, textAlign: TextAlign.center)))
      ]);
}
