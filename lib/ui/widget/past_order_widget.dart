import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe/resource/colors.dart';
import 'package:food_cafe/resource/style.dart';

class PastOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardRadius = 10.0;

    final _dottedLine = DottedBorder(
        color: Colors.grey,
        strokeWidth: 1,
        strokeCap: StrokeCap.round,
        dashPattern: [2, 2],
        customPath: (size) {
          return Path()
            ..moveTo(cardRadius, 0)
            ..lineTo(size.width - cardRadius, 0)
            ..arcToPoint(Offset(size.width, cardRadius),
                radius: Radius.circular(cardRadius))
            ..lineTo(size.width, size.height - cardRadius)
            ..arcToPoint(Offset(size.width - cardRadius, size.height),
                radius: Radius.circular(cardRadius))
            ..lineTo(cardRadius, size.height)
            ..arcToPoint(Offset(0, size.height - cardRadius),
                radius: Radius.circular(cardRadius))
            ..lineTo(0, cardRadius)
            ..arcToPoint(Offset(cardRadius, 0),
                radius: Radius.circular(cardRadius));
        },
        padding: EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("ECOM2002", style: id),
                Row(children: [
                  Text('Delivered', style: pastOrderStatusStyle(pastOrderDelivered))
                ])
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Home delivery", style: deliveryType),
                Text('08 Oct 2020 - 4:30 PM', style: timeCalculationStyle)
              ]),
              SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Text('Paid', style: paymentPaidStatusStyle),
                  SizedBox(width: 3),
                  Text('(Collect)', style: paymentCollectStyle)
                ]),
                Text('\u20B9 6000', style: totalAmountStyle)
              ]),
              SizedBox(height: 5),
              Text("Refundable", style: pastOrderRefundableStyle),
              Row(children: [
                Text("Remark", style: pastOrderRemarkStyle),
                SizedBox(width: 5),
                Text("Items are not available", style: pastOrderRemarkCommentStyle),
              ])
            ])));

    return Container(margin: EdgeInsets.all(10), child: _dottedLine);
  }
}
