import 'package:food_cafe/model/order/order.dart';
import 'package:food_cafe/model/order/order_response.dart';
import 'package:get/get.dart';

class NewOrderController extends GetxController {
  RxList<OrderMainList> rxNewOrderList;

  @override
  onInit() {
    super.onInit();
    fetchPending();
  }

  void fetchPending() {
    List<OrderMainList> orderMainList = [
      OrderMainList(
          uniqueId: 'FCO2021',
          dateTime: '15-10-2020 - 3:17 PM',
          typeDelivery: 'Home delivery',
          paymentType: 'Paid',
          totalQuantity: 3,
          totalAmount: 6000,
          otherCharge: 500,
          preparationTimeList: [
            PreparationTimeList(time: 10, isSelect: false),
            PreparationTimeList(time: 20, isSelect: false),
            PreparationTimeList(time: 30, isSelect: false),
            PreparationTimeList(time: 40, isSelect: false),
            PreparationTimeList(time: 50, isSelect: false),
            PreparationTimeList(time: 60, isSelect: false),
          ],
          otherChargeList: [
            OtherChargeList(name: 'GST', chargeAmount: 200),
            OtherChargeList(name: 'Delivery charge', chargeAmount: 100),
            OtherChargeList(name: 'Discount', chargeAmount: 100),
            OtherChargeList(name: 'CGST', chargeAmount: 50),
            OtherChargeList(name: 'SGST', chargeAmount: 50)
          ],
          orderList: [
            OrderList(
                uniqueId: 'FCO2021OR',
                recipeName: 'Chicken biryani',
                quantity: 1,
                price: 2000,
                orderType: 1),
            OrderList(
                uniqueId: 'FCO2021OR',
                recipeName: 'Chicken biryani',
                quantity: 2,
                price: 2000,
                orderType: 2)
          ])
    ];

    rxNewOrderList = PendingResponse(orderMainList: orderMainList).orderMainList.obs;
  }

  void preparationTimeSelect(
      PreparationTimeList preparationTimeList, int index) {
    if (preparationTimeList.isSelect.value) {
      preparationTimeList.isSelect.value = false;
    } else {
      for (var preparationTime in rxNewOrderList[index].preparationTimeList) {
        preparationTime.isSelect.value = false;
      }

      preparationTimeList.isSelect.value = !preparationTimeList.isSelect.value;
    }
  }
}
