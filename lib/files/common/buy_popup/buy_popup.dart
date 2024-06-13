//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
//import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/auth_view/login_otp_view.dart';
import 'package:you_yemen/files/common/success_view.dart';
import 'package:you_yemen/files/controllers/buy_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/cancel_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/close_popup_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_animated_switcher.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_msisdn_textfield.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class BuyPopupView extends StatefulWidget {
  const BuyPopupView({super.key, required this.info});
  final TuneInfo info;
  @override
  State<BuyPopupView> createState() => _BuyPopupViewState();
}

class _BuyPopupViewState extends State<BuyPopupView> {
  late BuyController con;
  @override
  void initState() {
    con = Get.put(BuyController());
    con.info = widget.info;
    super.initState();
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Material(
          color: transparent,
          child: Obx(() {
            return UAnimatedSwitcher(
                mainContainer(),
                UAnimatedSwitcher(
                    LoginOtpView(
                      msisdn: con.msisdn,
                      isBuyTune: true,
                      info: widget.info,
                      otpResendTimeout: con.otpResendTimeout,
                      onSuccess: (message) {
                        con.successMessage = message;
                        con.authTypes.value = AuthTypes.showSuccessScreen;
                      },
                    ),
                    SuccessView(message: con.successMessage),
                    con.authTypes.value == AuthTypes.showOtpScreen),
                con.authTypes.value == AuthTypes.showLoginPopup);
          }),
        ),
      ),
    );
  }

// con.authTypes.value == AuthTypes.showLoginPopup
//                 ? mainContainer()
//                 : LoginOtpView(msisdn: con.msisdn);

  Container mainContainer() {
    return Container(
      width: popupWidth,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(contanerCornerRadius),
        color: white,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          headerView(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: infoContainer(),
          ),
        ],
      ),
    );
  }

  Widget infoContainer() {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Column(
          mainAxisAlignment:
              si.isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: si.isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            tuneImage(),
            const SizedBox(height: 12),
            tuneInfo(si),
            const SizedBox(height: 12),
            tuneCharge(si),
            const SizedBox(height: 12),
            textfieldInfo(),
            errorMessage(),
            const SizedBox(height: 12),
            Obx(() {
              return con.isVerifying.value
                  ? loadingIndicator()
                  : buttonsWidget(si, context);
            })
          ],
        );
      },
    );
  }

  Widget errorMessage() {
    return Obx(() {
      return uVisibility(
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: UText(
              title: con.errorMessage.value,
              fontSize: 12,
              textColor: red,
            ),
          ),
          con.errorMessage.isEmpty);
    });
  }

  Widget headerView() {
    return Container(
      height: 40,
      color: lightGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //SizedBox(width: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: UText(
              title: buyTuneStr,
              fontName: FontName.helveticaBold,
            ),
          ),
          closePopupButton(btnColor: transparent),
        ],
      ),
    );
  }

  Widget tuneImage() {
    return SizedBox(
      height: 200,
      child: uImage(
        url: widget.info.toneIdpreviewImageUrl ?? '',
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(contanerCornerRadius),
          topRight: Radius.circular(contanerCornerRadius),
        ),
      ),
    );
  }

  Widget tuneInfo(SizingInformation si) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          si.isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        UText(
          title: widget.info.toneName ?? '',
          fontName: FontName.helveticaBold,
          fontSize: 18,
        ),
        UText(title: widget.info.artistName ?? '', textColor: grey)
      ],
    );
  }

  Widget tuneCharge(SizingInformation si) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          si.isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        UText(
          title: tuneChargeStr,
          fontName: FontName.helveticaBold,
          fontSize: 18,
        ),
        UText(title: "Rs:20/Month", textColor: grey)
      ],
    );
  }

  Widget textfieldInfo() {
    return uVisibility(
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UText(title: enterMobileNumberStr),
            UMsisdnTextField(
              textEditingController: textEditingController,
              hintText: enterMobileNumberStr,
              onChanged: (p0) {
                con.updateMsisdn(p0);
              },
              onSubmitted: (p0) {
                con.onConfirmButtonAction();
              },
            )
          ],
        ),
        StoreManager().isLoggedIn);
  }

  Widget buttonsWidget(SizingInformation si, BuildContext context) {
    return si.isMobile
        ? Column(
            children: [
              confirmButton(onTap: () {
                con.onConfirmButtonAction();
              }),
              const SizedBox(height: 10),
              cancelButton(onTap: () {
                Navigator.of(context).pop();
              })
            ],
          )
        : Row(
            children: [
              Expanded(child: confirmButton(onTap: () {
                con.onConfirmButtonAction();
              })),
              const SizedBox(width: 20),
              Expanded(child: cancelButton(onTap: () {
                Navigator.of(context).pop();
              })),
            ],
          );
  }
}
