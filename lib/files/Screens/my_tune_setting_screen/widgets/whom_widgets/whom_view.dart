import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_setting_controller.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget whomView() {
  MyTuneSettingController cont = Get.find();
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: ResponsiveBuilder(
        builder: (context, si) {
          return si.isMobile
              ? Column(
                  children: [
                    _radioButton(cont, 0, allCallerStr.tr, si),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: _radioButton(cont, 1, specialCallerStr.tr, si),
                    ),
                    _radioButton(cont, 2, addToSuffleStr.tr, si),
                  ],
                )
              : Row(
                  children: [
                    _radioButton(cont, 0, allCallerStr.tr, si),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _radioButton(cont, 1, specialCallerStr.tr, si),
                    ),
                    _radioButton(cont, 2, addToSuffleStr.tr, si),
                  ],
                );
        },
      ));
}

Widget _radioButton(MyTuneSettingController cont, int index, String title,
    SizingInformation si) {
  return Row(
    children: [
      Obx(() {
        return genericButton(
          onTap: () {
            cont.updateWhom(index);
          },
          btnColor: transparent,
          child: cont.whomIndex.value == index
              ? Icon(
                  Icons.radio_button_checked,
                  size: si.isMobile ? 18 : 20,
                )
              : Icon(
                  Icons.radio_button_unchecked,
                  size: si.isMobile ? 18 : 20,
                ),
          title: title,
        );
      }),
    ],
  );
}
