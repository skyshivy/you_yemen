import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_setting_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_msisdn_textfield.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget dedicatedView(TextEditingController textEditingController) {
  MyTuneSettingController cont = Get.find();
  return Obx(() {
    return AnimatedSizeAndFade(
      child: cont.whomIndex.value == 1
          ? SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleWidget(),
                    const SizedBox(height: 4),
                    textFieldContainerWidget(textEditingController),
                    const SizedBox(height: 2),
                    msisdnExampleWidget(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  });
}

Widget titleWidget() {
  return ResponsiveBuilder(
    builder: (context, si) {
      return UText(
        title: addNumberStr.tr,
        textColor: grey,
        fontSize: si.isMobile ? 12 : null,
        fontName: FontName.acMuna,
      );
    },
  );
}

Widget msisdnExampleWidget() {
  return ResponsiveBuilder(
    builder: (context, si) {
      return UText(
        title: exampleMsisdnTextStr.tr,
        textColor: grey,
        fontName: FontName.helvetica,
        fontSize: si.isMobile ? 12 : null,
      );
    },
  );
}

Widget textFieldContainerWidget(TextEditingController textEditingController) {
  MyTuneSettingController cont = Get.find();
  return Container(
      color: white,
      child: UMsisdnTextField(
        hintText: enterFriendMobileNumberStr,
        textEditingController: textEditingController,
        onChanged: (p0) {
          cont.updateBparty(p0);
        },
        onSubmitted: (p0) {
          cont.confirmButtonTap();
        },
        borderColor: transparent,
      )
      // UTextField(
      //   textEditingController: TextEditingController(),
      // ),
      );
}
