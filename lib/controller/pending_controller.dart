import 'package:food_cafe/model/peding/pending.dart';
import 'package:food_cafe/model/peding/pending_response.dart';
import 'package:get/get.dart';

class PendingController extends GetxController {
  RxList<PendingList> rxPendingList;
  RxBool isTimeSelect = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchPending();
  }

  void fetchPending() {
    List<PendingList> pendingList = [
      PendingList(
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
          preparationTimeDefault: PreparationTimeDefault(
              defaultTime: 5, selectTime: 0, isMinHour: 1),
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

    rxPendingList = PendingResponse(pendingList: pendingList).pendingList.obs;
  }

  void preparationTimeSelect(PreparationTimeList preparationTimeList,
      PreparationTimeDefault preparationTimeDefault, int index) {
    if (preparationTimeList.isSelect.value) {
      preparationTimeList.isSelect.value = false;
      isTimeSelect.value = false;
      preparationTimeDefault.selectTime.value = 0;
    } else {
      for (var preparationTime in rxPendingList[index].preparationTimeList) {
        preparationTime.isSelect.value = false;
      }

      preparationTimeList.isSelect.value = !preparationTimeList.isSelect.value;
      preparationTimeDefault.selectTime.value = preparationTimeList.time.value;
      isTimeSelect.value = preparationTimeList.isSelect.value;
    }
  }

  void timeSelectPlus(int time, List<PreparationTimeList> preparationTimeList,
      PreparationTimeDefault preparationTimeDefault) {
    isTimeSelect.value = true;
    preparationTimeDefault.selectTime.value = time + 5;

    if (preparationTimeDefault.selectTime.value % 10 == 0) {
      for (var preparationTime in preparationTimeList) {
        preparationTime.isSelect.value = false;
      }

      preparationTimeList[int.parse(
                  (preparationTimeDefault.selectTime.value / 10)
                      .toStringAsFixed(0)) -
              1]
          .isSelect
          .value = true;
    } else {
      for (var preparationTime in preparationTimeList) {
        preparationTime.isSelect.value = false;
      }
    }
  }

  void timeSelectMinus(
    int time,
    List<PreparationTimeList> preparationTimeList,
    PreparationTimeDefault preparationTimeDefault,
  ) {
    isTimeSelect.value = true;
    if (time != 0) {
      preparationTimeDefault.selectTime.value = time - 5;

      if (preparationTimeDefault.selectTime.value > 0)
        preparationTimeList[int.parse(
                    (preparationTimeDefault.selectTime.value / 10)
                        .toStringAsFixed(0)) -
                1]
            .isSelect
            .value = true;

      if (preparationTimeDefault.selectTime.value % 10 == 0) {
        for (var preparationTime in preparationTimeList) {
          preparationTime.isSelect.value = false;
        }
      } else {
        for (var preparationTime in preparationTimeList) {
          preparationTime.isSelect.value = false;
        }
      }
    }
  }
}
