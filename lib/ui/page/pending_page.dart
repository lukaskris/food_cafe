import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/controller/controller.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:food_cafe/ui/widget/order_detail.dart';
import 'package:food_cafe/ui/widget/order_status.dart';
import 'package:food_cafe/ui/widget/preparation_time.dart';
import 'package:get/get.dart';

class PendingPage extends StatelessWidget {
  final _infoKey = List<GlobalKey>();
  final _pendingController = Get.put(PendingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => ListView.builder(
            itemCount: _pendingController.rxPendingList.length,
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
                                orderMainList:
                                    _pendingController.rxPendingList[index],
                                orderList: _pendingController
                                    .rxPendingList[index].orderList,
                                otherChargeList: _pendingController
                                    .rxPendingList[index].otherChargeList),
                            PreparationTime(
                                index: index,
                                preparationTimeDefault: _pendingController
                                    .rxPendingList[index]
                                    .preparationTimeDefault,
                                preparationTimeList: _pendingController
                                    .rxPendingList[index].preparationTimeList),
                            OrderStatus(
                                orderStatus: acceptButton,
                                rejectCallBack: () => _pendingController
                                    .removeOrder(_pendingController
                                        .rxPendingList[index].uniqueId),
                                orderCallBack: () => _pendingController
                                    .removeOrder(_pendingController
                                        .rxPendingList[index].uniqueId))
                          ])));
            })));
  }
}
