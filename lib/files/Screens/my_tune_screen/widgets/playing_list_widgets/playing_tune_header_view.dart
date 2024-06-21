import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/generic_popup.dart/generic_popup.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/images.dart';

Widget playingTuneHeaderView() {
  return ResponsiveBuilder(
    builder: (context, si) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: _leftContainer(si)), _toggelButton(si)],
      );
    },
  );
}

Widget _leftContainer(SizingInformation si) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UText(
        title: currentlyPlayingToMyCallersStr.tr,
        fontName: FontName.helveticaBold,
        fontSize: si.isMobile ? 14 : 24,
      ),
      const SizedBox(height: 2),
      RichText(
        text: TextSpan(children: [
          TextSpan(
              text: wantToEditYourPlayingListStr.tr, style: _textStyle(si)),
          const TextSpan(text: "  "),
          TextSpan(
              style: _textStyle(si, color: red),
              text: learnMoreStr.tr,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  genericPopup(
                    Container(child: ResponsiveBuilder(
                      builder: (context, si) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            rowText(
                                SvgPicture.asset(
                                  deleteSvg,
                                  height: 20,
                                  width: 10,
                                ),
                                clickDeleteIconStr,
                                ''),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: rowText(null, clickDelete1Str, '2'),
                            ),
                            rowText(null, clickDelete2Str, '3'),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                confirmButton(
                                  title: okStr,
                                  titlePadding: 40,
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                                // customConfirmButton(okStr, () {
                                //   Navigator.of(context).pop();
                                // }),
                              ],
                            )
                          ],
                        );
                      },
                    )),
                    headerTitle: infoStr.tr,
                  );
                  print("Learn more tapped 123");
                })
        ]),
      ),
    ],
  );
}

Widget rowText(Widget? child, String info, String count) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      child ??
          UText(
            title: count,
            fontSize: 13,
            fontName: FontName.helvetica,
          ),
      const SizedBox(width: 4),
      Expanded(
          child: UText(
        title: info.tr,
        fontSize: 13,
        fontName: FontName.helvetica,
      )),
    ],
  );
}

TextStyle _textStyle(SizingInformation si, {Color color = grey}) => TextStyle(
      fontFamily: FontName.helvetica.name,
      color: color,
      fontSize: si.isMobile ? 12 : 16,
    );

_toggelButton(SizingInformation si) {
  MyTuneController con = Get.find();
  return Row(
    children: [
      UText(
        title: shuffleStr.tr,
        textColor: grey,
        fontName: si.isMobile ? FontName.acMuna : FontName.helveticaBold,
        fontSize: si.isMobile ? 14.0 : 14.0,
        //font: FontName.helveticaBold,
      ),
      const SizedBox(width: 4),
      Obx(() {
        return con.isChangeSuffleStatus.value
            ? loadingIndicator(
                radius: 10,
                width: 60,
              ) //customLoadingIndicator(isIos: true, radius: 10, width: 60)
            : CupertinoSwitch(
                value: con.isShuffle.value,
                onChanged: (v) {
                  con.changeSuffleStatus();
                  print("v=== $v");
                });
      })
    ],
  );
}
