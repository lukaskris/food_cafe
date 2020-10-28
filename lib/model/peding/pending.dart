import 'package:get/get.dart';

class PendingList {
  String uniqueId, dateTime, typeDelivery, paymentType;
  int totalQuantity;
  double totalAmount, otherCharge;

  List<OrderList> orderList;
  List<PreparationTimeList> preparationTimeList;
  List<OtherChargeList> otherChargeList;
  DeliveryPersonDetail deliveryPersonDetail;

  PendingList(
      {this.uniqueId,
      this.dateTime,
      this.typeDelivery,
      this.paymentType,
      this.totalQuantity,
      this.totalAmount,
      this.otherCharge,
      this.orderList,
      this.preparationTimeList,
      this.otherChargeList,
      this.deliveryPersonDetail});
}

class OrderList {
  String uniqueId, recipeName;
  int quantity;
  double price;
  int orderType;

  OrderList(
      {this.uniqueId,
      this.recipeName,
      this.quantity,
      this.price,
      this.orderType});
}

class PreparationTimeList extends GetxController {
  PreparationTimeList({int time, bool isSelect}) {
    this.setSelect(isSelect);
    this.setTime(time);
  }

  RxInt time = RxInt(null);
  setTime(int value) => time.value = value;

  RxBool isSelect = RxBool(null);
  setSelect(bool value) => isSelect.value = value;
}

class DeliveryPersonDetail {
  String uniqueId, name, arrivingDateTime, mobileNo, otp;

  DeliveryPersonDetail(
      {this.uniqueId,
      this.name,
      this.arrivingDateTime,
      this.mobileNo,
      this.otp});
}

class OtherChargeList {
  String name;
  double chargeAmount;

  OtherChargeList({this.name, this.chargeAmount});
}