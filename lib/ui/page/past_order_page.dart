import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/past_order_controller.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/ui/widget/past_order_widget.dart';

class PastOrderPage extends StatelessWidget {
  final _pastOrderController = new PastOrderController();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Container(
            margin: EdgeInsets.all(10),
            height: 40,
            width: 140,
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                border: Border.all(
                    color: borderDeliveryPersonInformationColor,
                    style: BorderStyle.solid,
                    width: 0.80)),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: _pastOrderController.selectOrder.value == null
                        ? _pastOrderController.pastOrderList[0]
                        : _pastOrderController.selectOrder.value,
                    onChanged: (String newValue) {},
                    items: _pastOrderController.pastOrderList
                        .map((String selectValue) {
                      return new DropdownMenuItem<String>(
                          value: selectValue,
                          child: Text(selectValue, style: dropDownTextStyle));
                    }).toList()))),
        Text('Total', style: totalStyle),
        SizedBox(width: 3),
        Text('0', style: totalCountStyle)
      ]),
      Expanded(child: ListView(children: [PastOrderWidget()]))
    ]);
  }
}
