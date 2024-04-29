import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_yemen/files/controllers/auth_controller/login_popup_controller.dart';
import 'package:you_yemen/files/controllers/auth_controller/otp_controller.dart';
import 'package:you_yemen/files/screens/home_screen/home_screen.dart';
import 'package:you_yemen/files/api_calls/setting_api.dart';
import 'package:you_yemen/files/controllers/recomended_controller.dart';
import 'package:you_yemen/files/router/app_router.dart';

late SharedPreferences prefs;
void main() {
  initialLoads();
  _initController();
  runApp(const MyApp());
}

initialLoads() async {
  getAppSetting();
}

_initController() async {
  Get.lazyPut(() => RecomendedController());
  Get.lazyPut(() => LoginPopupController());
  Get.lazyPut(() => OtpController());
  prefs = await SharedPreferences.getInstance();
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
