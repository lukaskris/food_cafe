import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/controller.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/ui/widget/delivery_person_information.dart';
import 'package:food_cafe/ui/widget/order_detail.dart';
import 'package:get/get.dart';

class DispatchedPage extends StatelessWidget {
  final _infoKey = List<GlobalKey>();
  final _dispatchedController = Get.put(DispatchedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => ListView.builder(
            itemCount: _dispatchedController.rxDispatchedList.length,
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
                                orderMainList: _dispatchedController
                                    .rxDispatchedList[index],
                                orderList: _dispatchedController
                                    .rxDispatchedList[index].orderList,
                                otherChargeList: _dispatchedController
                                    .rxDispatchedList[index].otherChargeList),
                            DeliveryPersonInformation(
                                deliveryPersonDetail: _dispatchedController
                                    .rxDispatchedList[index]
                                    .deliveryPersonDetail),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                    onTap: () => _dispatchedController
                                        .removeOrder(_dispatchedController
                                            .rxDispatchedList[index].uniqueId),
                                    child: Container(
                                        decoration: new BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        padding: EdgeInsets.all(3),
                                        child: Text(settleOrderButton,
                                            style: orderStatusStyle))))
                          ])));
            })));
  }
}
