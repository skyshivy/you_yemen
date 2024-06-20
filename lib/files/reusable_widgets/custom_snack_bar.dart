import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

customSnackBar(String message) {
  Get.snackbar(
    maxWidth: 400,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: black,
    "",
    messageText: Center(
      child: UText(
        title: message,
        textColor: white,
      ),
    ),
    "",
  );
}
