import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:food_cafe/resource/style.dart';
import 'package:food_cafe/ui/widget/custom_slidable/slidable.dart';
import 'package:food_cafe/ui/widget/custom_slidable/slidable_action_pane.dart';
import 'package:food_cafe/ui/widget/custom_slidable/slide_action.dart';
import 'package:get/get.dart';

class KDSViewPage extends StatelessWidget {
  KDSViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
      Expanded(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: itemMenuPause('Chicken Biryani'),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                                caption: 'Pause',
                                color: Colors.deepOrange,
                                onTap: () {})
                          ]),
                      Container(
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Dash(
                              length: Get.width - 35,
                              dashColor: Colors.grey,
                              dashThickness: 1,
                              dashLength: 2))
                    ]);
                  })))
    ])));
  }

  Widget itemMenuPause(String menu) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 0.0, right: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(children: [
                          SizedBox(width: 10),
                          Text(menu,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kdsViewTitleStyle)
                        ]),
                        Text('X 15', style: kdsViewAmountStyle)
                      ]))
            ]));
  }
}
