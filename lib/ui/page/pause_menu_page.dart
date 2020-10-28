import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/ui/widget/custom_switch.dart';
import 'package:food_cafe/ui/widget/search.dart';

class PauseMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF1F2F3),
        body: Column(children: [
          Search(),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: ListView(children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Column(children: [
                          Text('Order', style: pauseMenuTitleStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Online ordering',
                                    style: switchLabelStyle),
                                CustomSwitch(
                                    value: false,
                                    onChanged: (bool isOn) async {},
                                    activeColor: switchActiveColor,
                                    inactiveTrackColor: switchTrackColor,
                                    inactiveThumbColor: switchInActiveColor)
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Offline ordering',
                                    style: switchLabelStyle),
                                CustomSwitch(
                                    value: false,
                                    onChanged: (bool isOn) async {},
                                    activeColor: switchActiveColor,
                                    inactiveTrackColor: switchTrackColor,
                                    inactiveThumbColor: switchInActiveColor)
                              ]),
                          Text('Menu', style: pauseMenuTitleStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Chicken biryani',
                                          style: switchLabelStyle),
                                      Text(
                                          'Available on 1 - March - 2020 4:15 AM',
                                          style: menuAvailableStyle),
                                    ]),
                                CustomSwitch(
                                    value: false,
                                    onChanged: (bool isOn) async {},
                                    activeColor: switchActiveColor,
                                    inactiveTrackColor: switchTrackColor,
                                    inactiveThumbColor: switchInActiveColor)
                              ]),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Chicken biryani',
                                          style: switchLabelStyle),
                                      Text(
                                          'Available on 1 - March - 2020 4:15 AM',
                                          style: menuAvailableStyle),
                                    ]),
                                CustomSwitch(
                                    value: false,
                                    onChanged: (bool isOn) async {},
                                    activeColor: switchActiveColor,
                                    inactiveTrackColor: switchTrackColor,
                                    inactiveThumbColor: switchInActiveColor)
                              ]),
                        ]))
                  ]))),
        ]));
  }
}
