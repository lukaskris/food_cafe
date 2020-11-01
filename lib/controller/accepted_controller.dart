import 'package:food_cafe/model/peding/pending.dart';
import 'package:food_cafe/model/peding/pending_response.dart';
import 'package:get/get.dart';

class AcceptedController extends GetxController {
  RxList<PendingList> rxAcceptedList;

  @override
  onInit() {
    super.onInit();
    fetchAccepted();
  }

  void fetchAccepted() {
    List<PendingList> pendingList = [
      PendingList(
          uniqueId: 'FCO2021',
          dateTime: '15-10-2020 - 3:17 PM',
          typeDelivery: 'Home delivery',
          paymentType: 'Paid',
          totalQuantity: 2,
          totalAmount: 4000,
          otherCharge: 500,
          deliveryPersonDetail: DeliveryPersonDetail(uniqueId: '1', name: 'Lakhani Kamlesh',arrivingDateTime: '5 min', mobileNo: '9586331823', otp: '123456'),
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
                quantity: 2,
                price: 2000,
                orderType: 1)
          ])
    ];

    rxAcceptedList = PendingResponse(pendingList: pendingList).pendingList.obs;
  }

  void removeOrder(String orderId) {
    int indexGet =
    rxAcceptedList.indexWhere((element) => element.uniqueId == orderId);
    rxAcceptedList.removeAt(indexGet);
  }
}
