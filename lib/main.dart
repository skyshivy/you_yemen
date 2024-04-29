import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

_initController() {
  Get.lazyPut(() => RecomendedController());
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
