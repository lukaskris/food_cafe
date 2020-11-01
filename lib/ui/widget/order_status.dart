import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/resource/style.dart';
class OrderStatus extends StatelessWidget {
  final String orderStatus;
  final bool isBillShow, isRejectShow;
  final VoidCallback rejectCallBack, orderCallBack;

  OrderStatus(
      {this.orderStatus,
      this.isRejectShow = true,
      this.isBillShow = true,
      this.rejectCallBack,
      this.orderCallBack});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        isRejectShow
            ? IntrinsicWidth(
                child: GestureDetector(
                    onTap: rejectCallBack,
                    child: Column(children: [
                      Text('REJECT', style: orderStatusLink),
                      Container(color: Colors.blue, height: 1)
                    ])))
            : Container(),
        SizedBox(width: isRejectShow ? 20 : 0),
        isBillShow
            ? IntrinsicWidth(
                child: Column(children: [
                Text('BILL', style: orderStatusLink),
                Container(color: Colors.blue, height: 1)
              ]))
            : Container()
      ]),
      GestureDetector(
          child: Container(
              decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5.0)),
              padding: EdgeInsets.all(3),
              child: Text(' $orderStatus ', style: orderStatusStyle)),
          onTap: orderCallBack)
    ]);
  }
}
