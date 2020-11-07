import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/style.dart';

class PauseMenuOrderOffTimer extends StatefulWidget {
  @override
  RadioListBuilderState createState() {
    return RadioListBuilderState();
  }
}

class RadioListBuilderState extends State<PauseMenuOrderOffTimer> {
  int pos = 0;
  List<String> timeSlotList = ["Day End", "2 Hours", "6 Hours", "Custom"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              setState(() {
                pos = index;
              });
            },
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                child: Row(children: [
                  pos == index
                      ? Icon(Icons.radio_button_checked, color: radioSelectColor)
                      : Icon(Icons.radio_button_off_sharp,
                          color: radioUnselectColor),
                  SizedBox(width: 10),
                  Text(timeSlotList[index],
                      style: bottomSheetPauseMenuOrderOnOffTimerLabelStyle)
                ])));
      },
      itemCount: timeSlotList.length,
    );
  }
}
