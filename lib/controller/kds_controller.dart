import 'package:food_cafe/model/kdsview/KDSView.dart';
import 'package:get/get.dart';

class KDSViewController extends GetxController {
  RxList<KDSViewResponse> kdsViewList;

  @override
  onInit() {
    super.onInit();
    fetchKDSView();
  }

  void fetchKDSView() {

  }

}
