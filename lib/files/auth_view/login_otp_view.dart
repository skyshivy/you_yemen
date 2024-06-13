//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_connect/http/src/request/request.dart';

import 'package:you_yemen/files/common/web_navigation_view/widgets/logo_widget.dart';
//import 'package:you_yemen/files/controllers/auth_controller/login_popup_controller.dart';
import 'package:you_yemen/files/controllers/auth_controller/otp_controller.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

import 'package:you_yemen/files/reusable_widgets/buttons/close_popup_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';

import 'package:you_yemen/files/reusable_widgets/u_text_field/u_password_textfield.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class LoginOtpView extends StatefulWidget {
  LoginOtpView({
    super.key,
    required this.msisdn,
    this.isBuyTune = false,
    this.info,
    required this.onSuccess,
    required this.otpResendTimeout,
  });
  final String msisdn;
  final isBuyTune;
  final int otpResendTimeout;
  final Function(String message) onSuccess;
  final TuneInfo? info;
  @override
  State<LoginOtpView> createState() => _LoginOtpViewState();
}

class _LoginOtpViewState extends State<LoginOtpView> {
  late OtpController otpCont;

  @override
  void initState() {
    otpCont = Get.put(OtpController());
    otpCont.msisdn = widget.msisdn;
    otpCont.isBuyTune = widget.isBuyTune;
    otpCont.onSuccess = widget.onSuccess;
    otpCont.info = widget.info;
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<OtpController>();
    super.dispose();
  }

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UText(
                            title: oneTimePasswordHasBeenSendToStr +
                                "\n${widget.msisdn}",
                            alignment: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      passwordTextField(),
                      errorMessage(),
                      const SizedBox(height: 20),
                      verifyButtonBuilder(),
                      const SizedBox(height: 20),
                      genericButton(
                          width: 180,
                          title: "${resendStr} : ${widget.otpResendTimeout}"),
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

  Widget errorMessage() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: uVisibility(
            UText(
              title: otpCont.errorMesssage.value,
              textColor: red,
              fontSize: 12,
            ),
            otpCont.errorMesssage.isEmpty),
      );
    });
  }

  Widget passwordTextField() {
    return Obx(
      () {
        return UPasswordTextField(
            enabled: !otpCont.isVerifying.value,
            onChanged: (p0) {
              otpCont.updateOpt(p0);
            },
            onSubmitted: (p0) {
              otpCont.onConfirmOtpButtonAction();
            },
            textEditingController: textEditingController);
      },
    );
  }

  Widget verifyButtonBuilder() {
    return Obx(() {
      return otpCont.isVerifying.value
          ? loadingIndicator()
          : genericButton(
              onTap: () {
                otpCont.onConfirmOtpButtonAction();
              },
              width: 180,
              title: verifyOtpStr,
              btnColor: lightGrey);
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
