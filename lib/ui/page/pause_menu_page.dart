import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/pause_menu_controller.dart';
import 'package:food_cafe/model/pausemenu/PauseMenuResponse.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/ui/widget/bottom_sheet_custom.dart';
import 'package:food_cafe/ui/widget/bottom_sheet_pause_menu.dart';
import 'package:food_cafe/ui/widget/custom_switch.dart';
import 'package:food_cafe/ui/widget/search.dart';
import 'package:get/get.dart';

class PauseMenuPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  final PauseMenuController _pauseMenuController =
      Get.put(PauseMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundPauseMenuColor,
        body: Column(children: [
          TextFieldSearch(
              textEditingController: _searchController,
              callBack: () => _searchController.clear(),
              onChanged: (value) {}),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: ListView.builder(
                      itemCount: _pauseMenuController.rxPauseMenuList.length,
                      itemBuilder: (context, index) {
                        PauseMenu pauseMenu =
                            _pauseMenuController.rxPauseMenuList[index];
                        return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(children: [
                              Text(pauseMenu.title, style: pauseMenuTitleStyle),
                              Column(
                                  children: pauseMenu.pauseOrderMenuList
                                      .map((item) => Column(children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            item.menuName.value,
                                                            style:
                                                                switchLabelStyle),
                                                        Text(
                                                            item.orderAvailableDateTime
                                                                .value,
                                                            style:
                                                                menuAvailableStyle)
                                                      ]),
                                                  Obx(() => CustomSwitch(
                                                      value:
                                                          item.switchCase.value,
                                                      onChanged: (bool value) {
                                                        bottomSheetCustom(
                                                            isScrollControlled:
                                                                true,
                                                            isDismissible:
                                                                false,
                                                            backgroundColor:
                                                                Colors.white,
                                                            context:
                                                                Get.context,
                                                            builder: (context) =>
                                                                BottomSheetPauseMenu(
                                                                    voidCallbackOk:
                                                                        () {
                                                                  _pauseMenuController
                                                                      .isTurnOfOrdering(
                                                                          item);
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  Get.back();
                                                                }));
                                                      },
                                                      activeColor:
                                                          switchActiveColor,
                                                      inactiveTrackColor:
                                                          switchTrackColor,
                                                      inactiveThumbColor:
                                                          switchInActiveColor))
                                                ]),
                                            SizedBox(height: 10)
                                          ]))
                                      .toList())
                            ]));
                      })))
        ]));
  }
}
