import 'package:food_cafe/model/pausemenu/PauseMenuResponse.dart';
import 'package:get/get.dart';

class PauseMenuController extends GetxController {
  RxList<PauseMenu> rxPauseMenuList;

  @override
  onInit() {
    super.onInit();
    fetchPauseMenu();
  }

  void fetchPauseMenu() {
    var pauseMenuResponse = PauseMenuResponse(pauseMenuList: [
      PauseMenu(id: 1, title: 'Turn Of Ordering', pauseOrderMenuList: [
        PauseOrderMenu(
            id: 1001,
            menuName: 'Online ordering',
            switchCase: true,
            orderAvailableDateTime: '11-Sep.-2020 4:15 PM'),
        PauseOrderMenu(
            id: 1002,
            menuName: 'Offline ordering',
            switchCase: false,
            orderAvailableDateTime: '')
      ]),
      PauseMenu(id: 2, title: 'Menu', pauseOrderMenuList: [
        PauseOrderMenu(
            id: 1003,
            menuName: 'Chicken biryani',
            switchCase: true,
            orderAvailableDateTime: '11-Sep.-2020 4:15 PM'),
      ])
    ]);
    rxPauseMenuList = pauseMenuResponse.pauseMenuList.obs;
  }

  void isTurnOfOrdering(PauseOrderMenu pauseOrderMenu) {
    pauseOrderMenu.switchCase.value = !pauseOrderMenu.switchCase.value;
  }

  void search(String menuName) {

     for(PauseMenu pauseMenuList in rxPauseMenuList){
       for(PauseOrderMenu pauseOrderMenuList in pauseMenuList.pauseOrderMenuList){
         if(pauseOrderMenuList.menuName.value.contains('Chicken biryani')){

         }
       }

     }
  }
}
