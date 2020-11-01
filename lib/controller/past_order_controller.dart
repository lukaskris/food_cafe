import 'package:get/get.dart';

class PastOrderController extends GetxController {
  final RxList<String> pastOrderList =
      <String>["All", "Settled", "Rejected", "Canceled"].obs;
  RxString selectOrder = "All".obs;

  @override
  void onInit() {
    super.onInit();
    selectOrder.value = pastOrderList[0];
  }
}
