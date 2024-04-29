import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/auth_view/login_otp_view.dart';
import 'package:you_yemen/files/auth_view/login_popup_view.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget navLoginButton() {
  return genericButton(
    child: Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Icon(Icons.person, size: 18),
    ),
    title: loginStr,
    borderColor: grey,
    padding: EdgeInsets.symmetric(horizontal: 16),
    onTap: () {
      Get.dialog(Center(
        child: LoginPopupView(),
      ));
    },
  );
}
