import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_yemen/files/controllers/app_controller.dart';
import 'package:you_yemen/files/controllers/auth_controller/login_popup_controller.dart';
import 'package:you_yemen/files/controllers/auth_controller/otp_controller.dart';
import 'package:you_yemen/files/controllers/buy_controller.dart';
import 'package:you_yemen/files/controllers/category_controller.dart';
import 'package:you_yemen/files/controllers/player_controller.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/screens/home_screen/home_screen.dart';
import 'package:you_yemen/files/api_calls/setting_api.dart';
import 'package:you_yemen/files/controllers/recomended_controller.dart';
import 'package:you_yemen/files/router/app_router.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';

late SharedPreferences prefs;
late AppController appCont;
void main() {
  initialLoads();
  _initController();
  runApp(const MyApp());
}

initialLoads() async {
  getAppSetting();
}

_initController() async {
  prefs = await SharedPreferences.getInstance();
  appCont = Get.put(AppController());
  CategoryController catCont = Get.put(CategoryController());
  USearchController searchCont = Get.put(USearchController());
  PlayerController playCont = Get.put(PlayerController());
  StoreManager().initStoreManager();
  Get.lazyPut(() => RecomendedController());
  Get.lazyPut(() => LoginPopupController());
  Get.lazyPut(() => OtpController());
  Get.lazyPut(() => BuyController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'You Yemen',
      routerConfig: router,
    );
  }
}
