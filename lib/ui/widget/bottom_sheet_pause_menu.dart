import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/font.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:get/get.dart';

import 'pause_menu_order_on_off_timer.dart';

class BottomSheetPauseMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(height: 20),
      Text('Chicken Biryani', style: bottomSheetPauseMenuTitle),
      SizedBox(height: 10),
      Text(
          'You will not receive orders for \n this item till day end from now.',
          textAlign: TextAlign.center,
          style: bottomSheetPauseMenuDescription),
      SizedBox(height: 30),
      PauseMenuOrderOffTimer(),
      SizedBox(height: 30),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FlatButton(
            minWidth: Get.width / 3,
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10, bottom: 10),
            textColor: Colors.black,
            color: btnCancelColor,
            onPressed: () => Get.back(),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(cancelButton,
                style: TextStyle(fontFamily: mediumFont, fontSize: 15))),
        SizedBox(width: 30),
        FlatButton(
            minWidth: Get.width / 3,
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10, bottom: 10),
            textColor: Colors.white,
            color: btnOkColor,
            onPressed: () => Get.back(),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(okButton,
                style: TextStyle(fontFamily: mediumFont, fontSize: 15))),
        SizedBox(height: 20)
      ])
    ]));
  }
}
