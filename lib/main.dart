import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_yemen/files/controllers/app_controller.dart';
import 'package:you_yemen/files/controllers/artist_tunes_controller.dart';
import 'package:you_yemen/files/controllers/auth_controller/login_popup_controller.dart';
import 'package:you_yemen/files/controllers/auth_controller/otp_controller.dart';
import 'package:you_yemen/files/controllers/banner_controller.dart';
import 'package:you_yemen/files/controllers/buy_controller.dart';
import 'package:you_yemen/files/controllers/category_controller.dart';
import 'package:you_yemen/files/controllers/custom_drawer_controller.dart';
import 'package:you_yemen/files/controllers/mobile_menu_controller.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/custom_calender_controller.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';

import 'package:you_yemen/files/controllers/player_controller.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';

import 'package:you_yemen/files/api_self_care/sc_setting_api.dart';
import 'package:you_yemen/files/controllers/recomended_controller.dart';
import 'package:you_yemen/files/controllers/wishlist_controller.dart';
import 'package:you_yemen/files/router/app_router.dart';
import 'package:you_yemen/files/screens/mobile_app/bottom_tab_view/mobile_botton_tab_view.dart';
import 'package:you_yemen/files/screens/mobile_app/mobile_login_screen.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';

late SharedPreferences prefs;
late AppController appCont;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  appCont = Get.put(AppController());
  _initController();
  initialLoads();
  runApp(const MyApp());
}

initialLoads() async {
  scGetAppSetting();
}

_initController() async {
  Get.lazyPut(() => ArtistTunesController());
  Get.lazyPut(() => MobileMenuController());
  Get.lazyPut(() => CategoryController());
  Get.lazyPut(() => USearchController());
  Get.lazyPut(() => PlayerController());
  Get.lazyPut(() => CustomCalenderController());
  Get.lazyPut(() => BannerController());

  StoreManager().initStoreManager();
  Get.lazyPut(() => RecomendedController());
  Get.lazyPut(() => LoginPopupController());
  Get.lazyPut(() => OtpController());
  Get.lazyPut(() => BuyController());
  Get.lazyPut(() => CustomDrawerController());

  Get.lazyPut(() => MyTuneController());
  Get.lazyPut(() => WishListController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetPlatform.isWeb
        ? MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'You Yemen',
            routerConfig: router,
          )
        : GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Obx(
                () {
                  return appCont.isLoggedIn.value
                      ? MobileTabContainer()
                      : MobileLoginScreen();
                },
              ),
            ),
          );
  }
}
