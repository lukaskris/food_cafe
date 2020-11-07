import 'package:get/get.dart';

class PauseMenuResponse {
  List<PauseMenu> pauseMenuList;

  PauseMenuResponse({this.pauseMenuList});
}

class PauseMenu {
  String title;
  int id;
  List<PauseOrderMenu> pauseOrderMenuList;

  PauseMenu({this.id, this.title, this.pauseOrderMenuList});
}

class PauseOrderMenu {
  PauseOrderMenu({int id, String menuName, String orderAvailableDateTime, bool switchCase}) {
    this.setId(id);
    this.setMenuName(menuName);
    this.setOrderAvailableDateTime(orderAvailableDateTime);
    this.setSwitchCase(switchCase);
  }

  RxInt id = RxInt(null);
  setId(int value) => id.value = value;

  RxString menuName = RxString(null);
  setMenuName(String value) => menuName.value = value;

  RxString orderAvailableDateTime = RxString(null);
  setOrderAvailableDateTime(String value) =>
      orderAvailableDateTime.value = value;

  RxBool switchCase = RxBool(false);
  setSwitchCase(bool value) => switchCase.value = value;
}
