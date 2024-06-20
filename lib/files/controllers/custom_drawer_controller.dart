import 'package:get/get.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/images.dart';
import 'package:you_yemen/main.dart';

class CustomDrawerController extends GetxController {
  RxList<DrawerModel> drawerMenu = <DrawerModel>[].obs;
  RxList<DrawerModel> loggedIndrawerMenuList = <DrawerModel>[
    DrawerModel(myAccountStr, profileRoute, profileSvg),
    DrawerModel(wishlistStr, wishlistRoute, wishlistSvg),
    DrawerModel(tunezStr, catDetailRoute, ""),
    DrawerModel(myTunesStr, myTunezRoute, myTuneSvg),
    DrawerModel(faqStr, faqRoute, ""),
    DrawerModel(logoutStr, logoutStr, logoutSvg),
  ].obs;
  RxList<DrawerModel> nonLoggedIndrawerMenuList = <DrawerModel>[
    DrawerModel(tunezStr, catDetailRoute, ""),
    DrawerModel(faqStr, faqRoute, ""),
    DrawerModel(loginStr, loginStr, logoutSvg),
  ].obs;

  RxBool isOpen = false.obs;
  createMenu() {
    drawerMenu.value = appCont.isLoggedIn.value
        ? loggedIndrawerMenuList
        : nonLoggedIndrawerMenuList;
  }
}

class DrawerModel {
  String title;
  String route;
  String iconName;
  DrawerModel(this.title, this.route, this.iconName);
}
