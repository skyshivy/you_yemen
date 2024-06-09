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
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [_leftContainer(), _toggelButton()],
  );
}

Widget _leftContainer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UText(
        title: currentlyPlayingToMyCallersStr.tr,
        enfontName: FontName.acMuna,
        enfontSize: 24,
      ),
      const SizedBox(height: 12),
      RichText(
        text: TextSpan(children: [
          TextSpan(text: wantToEditYourPlayingListStr.tr, style: _textStyle()),
          const TextSpan(text: "  "),
          TextSpan(
              style: _textStyle(color: red),
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
            enfontSize: 13,
            enfontName: FontName.acMuna,
          ),
      const SizedBox(width: 4),
      Expanded(
          child: UText(
        title: info.tr,
        enfontSize: 13,
        enfontName: FontName.acMuna,
      )),
    ],
  );
}

TextStyle _textStyle({Color color = grey}) =>
    TextStyle(fontFamily: FontName.helveticaBold.name, color: color);

_toggelButton() {
  MyTuneController con = Get.find();
  return Row(
    children: [
      UText(
          title: shuffleStr.tr,
          textColor: grey,
          enfontName: FontName.helveticaBold
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
