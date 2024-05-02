import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/auth_view/login_otp_view.dart';
import 'package:you_yemen/files/common/success_view.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/logo_widget.dart';
import 'package:you_yemen/files/controllers/auth_controller/login_popup_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/close_popup_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_msisdn_textfield.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/reusable_widgets/u_animated_switcher.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class LoginPopupView extends StatefulWidget {
  const LoginPopupView({super.key});

  @override
  State<LoginPopupView> createState() => _LoginPopupViewState();
}

class _LoginPopupViewState extends State<LoginPopupView> {
  late LoginPopupController con;
  @override
  void initState() {
    con = Get.put(LoginPopupController());
    super.initState();
  }

  @override
  void dispose() {
    //Get.delete<LoginPopupController>();
    super.dispose();
  }

  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return UAnimatedSwitcher(
        popupView(),
        UAnimatedSwitcher(
            LoginOtpView(
              msisdn: con.msisdn,
              onSuccess: (message) {
                con.authTypes.value = AuthTypes.showSuccessScreen;
              },
            ),
            SuccessView(
              message: loggedInSuccessStr,
            ),
            con.authTypes.value == AuthTypes.showOtpScreen),
        con.authTypes.value == AuthTypes.showLoginPopup,
      );
    });
  }

  Widget popupView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Material(
          color: transparent,
          child: mainBuilder(),
        ),
      ),
    );
  }

  Container mainBuilder() {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: popupWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(contanerCornerRadius),
        color: white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          headerView(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoWidget(height: 40),
                const SizedBox(height: 20),
                UText(
                    title: signInToYourAccountStr,
                    enfontName: FontName.helveticaBold),
                UText(title: pleaseEnterMobileNoToAuthStr, enfontSize: 12),
                const SizedBox(height: 20),
                msisdnTextField(),
                errorMessage(),
                const SizedBox(height: 20),
                generateOtpButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget msisdnTextField() {
    return Obx(() {
      return UMsisdnTextField(
          enabled: !con.isVerifying.value,
          onChanged: (p0) {
            con.updateMsisdn(p0);
          },
          onSubmitted: (p0) {
            con.onSubmitButtonAction();
          },
          textEditingController: textEditingController);
    });
  }

  Widget generateOtpButton() {
    return Obx(() {
      return con.isVerifying.value
          ? loadingIndicator(height: 40)
          : genericButton(
              width: 150,
              title: requestOtpStr,
              btnColor: con.enableButton.value ? yellow : lightGrey,
              onTap: () {
                con.onSubmitButtonAction();
              },
            );
    });
  }

  Widget errorMessage() {
    return Obx(() {
      return uVisibility(
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: UText(
              title: con.errorMessage.value,
              enfontSize: 12,
              textColor: red,
            ),
          ),
          con.errorMessage.isEmpty);
    });
  }

  Widget headerView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: closePopupButton(),
        )
      ],
    );
  }
}
