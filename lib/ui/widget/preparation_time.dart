import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/pending_controller.dart';
import 'package:food_cafe/model/peding/pending.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class PreparationTime extends StatelessWidget {
  final List<PreparationTimeList> preparationTimeList;
  final PreparationTimeDefault preparationTimeDefault;
  final int index;

  final _pendingController = Get.put(PendingController());

  PreparationTime(
      {this.preparationTimeList, this.preparationTimeDefault, this.index});

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 1),
        Text('Preparation Time', style: preparationTime),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
              children: preparationTimeList
                  .map((item) => GestureDetector(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Obx(() => Text(item.time.toString(),
                              style: item.isSelect.value
                                  ? preparationTimeSelect
                                  : preparationTimeUnSelect))),
                      onTap: () {
                        _pendingController.preparationTimeSelect(
                            item, preparationTimeDefault, index);
                      }))
                  .toList()),
          Row(children: [
            GestureDetector(
                onTap: () {
                  _pendingController.timeSelectMinus(
                      _pendingController.isTimeSelect.value
                          ? preparationTimeDefault.selectTime.value
                          : preparationTimeDefault.defaultTime.value,
                      preparationTimeList,
                      preparationTimeDefault);
                },
                child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: preparationTimeDecoration,
                    child: Icon(LineIcons.minus, color: Colors.red, size: 12))),
            SizedBox(width: 10),
            Obx(() => Text(
                _pendingController.isTimeSelect.value
                    ? preparationTimeDefault.selectTime.toString()
                    : preparationTimeDefault.defaultTime.toString(),
                style: preparationTimeUnSelect)),
            SizedBox(width: 2),
             Text(
                'Min', style: preparationTimeMinHour),
            SizedBox(width: 10),
            GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: preparationTimeDecoration,
                    child: Icon(LineIcons.plus, color: Colors.red, size: 12)),
                onTap: () {
                  _pendingController.timeSelectPlus(
                      _pendingController.isTimeSelect.value
                          ? preparationTimeDefault.selectTime.value
                          : preparationTimeDefault.defaultTime.value,
                      preparationTimeList,
                      preparationTimeDefault);
                })
          ])
        ]),
        SizedBox(height: 20)
      ]);
}
