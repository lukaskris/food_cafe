import 'package:food_cafe/controller/past_order_controller.dart';
import 'package:get/get.dart';

class PastOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PastOrderController());
  }
}
