import 'package:flutter/material.dart';

import 'package:you_yemen/files/common/web_navigation_view/widgets/logo_widget.dart';

import 'package:you_yemen/files/reusable_widgets/buttons/close_popup_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';

import 'package:you_yemen/files/reusable_widgets/u_text_field/u_password_textfield.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class LoginOtpView extends StatelessWidget {
  LoginOtpView({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Material(
          color: transparent,
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: popupWidth - 100,
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
                      UText(title: oneTimePasswordHasBeenSendToStr),
                      const SizedBox(height: 8),
                      UPasswordTextField(
                          textEditingController: textEditingController),
                      const SizedBox(height: 20),
                      genericButton(
                          width: 180, title: verifyOtpStr, btnColor: lightGrey),
                      const SizedBox(height: 20),
                      genericButton(width: 180, title: resendStr),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
