import 'package:food_cafe/controller/turn_of_ordering_controller.dart';
import 'package:get/get.dart';

class TurnOfOrderingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TurnOfOrderingController());
  }
}
