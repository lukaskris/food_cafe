import 'package:food_cafe/model/peding/pending.dart';
import 'package:food_cafe/model/peding/pending_response.dart';
import 'package:get/get.dart';

class ReadyController extends GetxController {
  RxList<PendingList> rxReadyList;

  @override
  onInit() {
    super.onInit();
    fetchReady();
  }

  void fetchReady() {
    List<PendingList> pendingList = [
      PendingList(
          uniqueId: 'FCO2021',
          dateTime: '15-10-2020 - 3:17 PM',
          typeDelivery: 'Home delivery',
          paymentType: 'Paid',
          totalQuantity: 1,
          otherCharge: 500,
          totalAmount: 2000,
          deliveryPersonDetail: DeliveryPersonDetail(
              uniqueId: '1',
              name: 'Lakhani Kamlesh',
              arrivingDateTime: '5 min',
              mobileNo: '9586331823',
              otp: '123456'),
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
                orderType: 1)
          ])
    ];

    rxReadyList = PendingResponse(pendingList: pendingList).pendingList.obs;
  }
}
