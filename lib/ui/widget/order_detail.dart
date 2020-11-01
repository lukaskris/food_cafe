import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/model/order/order.dart';
import 'package:food_cafe/resource/font.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/resource/value.dart';
import 'package:line_icons/line_icons.dart';

import 'popup_window.dart';

class OrderDetail extends StatelessWidget {
  final GlobalKey infoKey;
  final List<OrderList> orderList;
  final OrderMainList orderMainList;
  final List<OtherChargeList> otherChargeList;

  OrderDetail(
      {this.infoKey, this.orderList, this.orderMainList, this.otherChargeList});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(orderMainList.uniqueId, style: id),
        Text(orderMainList.dateTime, style: dateTime)
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(orderMainList.typeDelivery, style: deliveryType),
        Text('10 min ago', style: timeCalculation)
      ]),
      SizedBox(height: 5),
      Column(
          children: orderList
              .map((item) => Row(children: [
                    Flexible(
                        flex: 2500,
                        child: Row(children: [
                          Icon(LineIcons.check_circle_o,
                              color: item.orderType == fullOrderTypeApi
                                  ? Colors.green
                                  : Colors.red,
                              size: 14),
                          SizedBox(width: 5),
                          Text(item.recipeName, style: menuNameStyle),
                          SizedBox(width: 5),
                          Text(
                              item.orderType == fullOrderTypeApi
                                  ? fullOrderType
                                  : halfOrderType,
                              style: orderTypeStyle)
                        ])),
                    Flexible(
                        flex: 700,
                        child: Row(children: [
                          Text('X', style: quantitySymbol),
                          Text(item.quantity.toString(), style: quantity)
                        ])),
                    Flexible(
                        flex: 0,
                        child: Text('\u20B9 ' + item.price.toString(),
                            style: menuPriceStyle))
                  ]))
              .toList()),
      SizedBox(height: 3),
      Divider(color: Colors.grey.withOpacity(0.2)),
      Row(children: [
        Flexible(
            flex: 2500,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text(orderMainList.paymentType, style: paymentPaidStatus),
                    SizedBox(width: 3),
                    Text('(Collect)', style: paymentCollect)
                  ]),
                  Row(children: [
                    Text(labelTotal, style: totalQuantity),
                    SizedBox(width: 3),
                    GestureDetector(
                        key: infoKey,
                        onTap: () {
                          RenderBox renderBox =
                              infoKey.currentContext.findRenderObject();
                          Offset offset = renderBox.localToGlobal(Offset.zero);
                          showPopupWindow(
                              context: context,
                              fullWidth: false,
                              //isShowBg:true,
                              position: RelativeRect.fromLTRB(
                                  0, offset.dy + renderBox.size.height, 0, 0),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(children: [
                                    Column(
                                        children: otherChargeList
                                            .map((item) => Column(children: [
                                          Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(item.name,
                                                    style: TextStyle(
                                                        color:
                                                        Colors.grey,
                                                        fontSize: 12,
                                                        fontFamily:
                                                        regularFont)),
                                                Text('\u20B9 ' + item.chargeAmount.toString(),
                                                    style: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 14,
                                                        fontFamily:
                                                        regularFont))
                                              ]),
                                        ]))
                                            .toList()),
                                    Divider(),
                                    Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(labelTotalAmount,
                                              style: TextStyle(
                                                  color:
                                                  Colors.grey,
                                                  fontSize: 12,
                                                  fontFamily:
                                                  mediumFont)),
                                          Text('\u20B9 ' + orderMainList.otherCharge.toString(),
                                              style: TextStyle(
                                                  color:
                                                  Colors.black,
                                                  fontSize: 14,
                                                  fontFamily:
                                                  mediumFont))
                                        ]),
                                  ])));
                        },
                        child: Icon(LineIcons.info_circle,
                            size: 20, color: Colors.blue)),
                    SizedBox(width: 3)
                  ])
                ])),
        Flexible(
            flex: 700,
            child: Row(children: [
              Text('X', style: quantitySymbol),
              Text(orderMainList.totalQuantity.toString(), style: quantity)
            ])),
        Flexible(
            flex: 0,
            child: Text(
                '\u20B9 ' +
                    (orderMainList.totalAmount + orderMainList.otherCharge).toString(),
                style: totalAmount))
      ])
    ]);
  }
}
