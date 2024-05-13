import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:you_yemen/files/api_calls/get_tune_price.dart';
import 'package:you_yemen/files/controllers/tell_a_friend_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';

import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/close_popup_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';

import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

import '../../reusable_widgets/u_text_field/u_msisdn_textfield.dart';

CustomPopupController cont = Get.put(CustomPopupController());

TextEditingController umsisdnTextController = TextEditingController();

class TellFriendPopupView extends StatelessWidget {
  final String msisdn;
  final TuneInfo info;

  const TellFriendPopupView({
    Key? key,
    required this.msisdn,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cont.resetValue();
    return Center(
      child: Material(
        color: transparent,
        child: Container(
          width: popupWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(contanerCornerRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              headerViewBuilder(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    toneImageBuilder(),
                    SizedBox(height: 10),
                    descriptionBuilder(),
                    SizedBox(height: 10),
                    msisdnBuilder(),
                    errorBuilder(),
                    SizedBox(height: 20),
                    confirmButtonBuilder(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget errorBuilder() {
    return Row(
      children: [
        Obx(() {
          return uVisibility(
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: UText(
                  title: cont.errorMessage.value,
                  textColor: red,
                ),
              ),
              cont.errorMessage.isEmpty);
        }),
      ],
    );
  }

  UText descriptionBuilder() {
    return UText(
      title: tellFriendDescriptionStr,
      enfontName: FontName.helvetica,
      textColor: Colors.grey,
      alignment: TextAlign.center,
    );
  }

  Widget toneImageBuilder() => uImage(url: info.toneIdpreviewImageUrl ?? '');

  Container headerViewBuilder() {
    return Container(
      color: lightGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 8),
          Expanded(
            child: Center(
              child: UText(
                title: tellFriendStr,
                textColor: black,
                enfontName: FontName.helveticaLight,
                arfontSize: 20,
              ),
            ),
          ),
          closePopupButton(btnColor: transparent)
        ],
      ),
    );
  }

  Widget confirmButtonBuilder() {
    return Obx(() {
      return cont.isLoading.value
          ? loadingIndicator()
          : confirmButton(
              onTap: () {
                cont.getTonePrice(info);
              },
            );
    });
  }

  UMsisdnTextField msisdnBuilder() {
    return UMsisdnTextField(
      enabled: true,
      hintText: enterFriendMobileNumberStr,
      textEditingController: TextEditingController(),
      onChanged: (p0) {
        cont.updateMsisdn(p0);
      },
      onSubmitted: (p0) {
        cont.getTonePrice(info);
      },
    );
  }
}


// Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Obx(() => confirmButton(
//                       onTap: () async {
//                         await controller.getTonePrice(msisdn, info);
//                       },