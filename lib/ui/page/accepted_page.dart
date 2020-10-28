import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/accepted_controller.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/ui/widget/delivery_person_information.dart';
import 'package:food_cafe/ui/widget/order_detail.dart';
import 'package:food_cafe/ui/widget/order_status.dart';
import 'package:get/get.dart';

class AcceptedPage extends StatelessWidget {
  final _infoKey = List<GlobalKey>();
  final _acceptedController = Get.put(AcceptedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<AcceptedController>(
        builder: (controller) => ListView.builder(
            itemCount: _acceptedController.rxAcceptedList.length,
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
                                pending: _acceptedController.rxAcceptedList[index],
                                orderList: _acceptedController.rxAcceptedList[index].orderList,
                                otherChargeList: _acceptedController.rxAcceptedList[index].otherChargeList),
                            DeliveryPersonInformation(deliveryPersonDetail : _acceptedController.rxAcceptedList[index].deliveryPersonDetail),
                            OrderStatus(orderStatus: foodReadyButton),
                          ])));
            })));
  }
}
