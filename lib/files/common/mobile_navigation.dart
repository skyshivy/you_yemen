import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

mobileNavigation(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  // Get.to(
  //   duration: Duration(seconds: 3),
  //   () => widget,
  //   transition: Transition.rightToLeft,
  // );
}
