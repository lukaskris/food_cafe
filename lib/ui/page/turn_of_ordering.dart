import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/images.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:get/get.dart';

class TurnOfOrderingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: cardViewElevation,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(backIcon, size: 18, color: appBarTitleColor)),
            title: Column(children: [
              Text(titleTurnOfOrdering, style: appBarTitleStyle)
            ])),
        body: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.all(0),
                  child: Card(
                  elevation: cardViewElevation,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Kamlesh',
                                      style: turnOfOrderingNameStyle),
                                  Text('11-7-2020 - 1:15 PM', style: dateTimeStyle),
                                ]),
                            Text('Chicken biryani',
                                style: turnOfOrderingMenuStyle),
                            Text(
                                'Available on 1 - March - 2020 4:15 AM',
                                style: menuAvailableStyle)
                          ]))));
            }));
  }
}
