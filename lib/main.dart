import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/Screens/Home_screen/home_screen.dart';
import 'package:you_yemen/files/controllers/recomended_controller.dart';

void main() {
  _initController();
  runApp(const MyApp());
}

_initController() {
  Get.lazyPut(() => RecomendedController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Material(child: const HomeScreen()),
    );
  }
}
