import 'package:get/get.dart';
import 'package:you_yemen/files/models/mobile_menu_model.dart';
import 'package:you_yemen/files/translation/strings.dart';

class MobileMenuController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<MobileMenuModel> menuList = [
    MobileMenuModel(callerGroupStr, "imageName"),
    MobileMenuModel(myWishListStr, "imageName"),
    MobileMenuModel(blackListStr, "imageName"),
    MobileMenuModel(historyStr, "imageName"),
    MobileMenuModel(changePasswordStr, "imageName"),
    MobileMenuModel(logoutStr, "imageName"),
  ];
  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = -1;
  }

  updateOnSelection(int index) {
    selectedIndex.value = -1;
  }
}
