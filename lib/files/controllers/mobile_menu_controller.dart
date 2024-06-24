import 'package:get/get.dart';
import 'package:you_yemen/files/models/mobile_menu_model.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/translation/strings.dart';

class MobileMenuController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<MobileMenuModel> menuList = [
    MobileMenuModel(myWishListStr, "imageName", wishlistRoute),
    MobileMenuModel(historyStr, "imageName", transactionRoute),
    MobileMenuModel(faqStr, "imageName", faqRoute),
    MobileMenuModel(logoutStr, "imageName", logoutStr),
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
