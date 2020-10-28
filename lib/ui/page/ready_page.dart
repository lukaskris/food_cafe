import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/ready_controller.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/ui/widget/delivery_person_information.dart';
import 'package:food_cafe/ui/widget/order_detail.dart';
import 'package:food_cafe/ui/widget/order_status.dart';
import 'package:get/get.dart';

class ReadyPage extends StatelessWidget {
  final _infoKey = List<GlobalKey>();
  final _readyController = Get.put(ReadyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: _readyController.rxReadyList.length,
            itemBuilder: (context, index) {
              _infoKey.add(GlobalKey(debugLabel: index.toString()));

              return Card(
                  elevation: cardViewElevation,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrderDetail(
                                infoKey: _infoKey[index],
                                pending: _readyController.rxReadyList[index],
                                orderList: _readyController
                                    .rxReadyList[index].orderList,
                                otherChargeList: _readyController
                                    .rxReadyList[index].otherChargeList),
                            DeliveryPersonInformation(
                                deliveryPersonDetail: _readyController
                                    .rxReadyList[index].deliveryPersonDetail),
                            OrderStatus(
                                orderStatus: dispatchButton,
                                isRejectShow: false),
                          ])));
            }));
  }
}
