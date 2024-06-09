import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/generic_popup.dart/generic_popup.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/screens/my_tune_screen/widgets/playing_list_widgets/playing_tune_header_view.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget myTuneHeaderView() {
  return _leftContainer();
}

Widget _leftContainer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UText(
        title: myTunesStr.tr,
        fontName: FontName.helveticaBold,
        fontSize: 28,
      ),
      const SizedBox(height: 12),
      RichText(
        text: TextSpan(children: [
          TextSpan(
              text: howToPlaySelectedTunesToYourCallersStr.tr,
              style: _textStyle()),
          const TextSpan(text: "  "),
          TextSpan(
              style: _textStyle(color: red),
              text: learnMoreStr.tr,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("Learn more tapped");
                  genericPopup(
                    Container(child: ResponsiveBuilder(
                      builder: (context, si) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            rowText(const Icon(Icons.settings),
                                tuneSettingInfo1Str, ''),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: rowText(null, tuneSettingInfo2Str, '2'),
                            ),
                            rowText(null, tuneSettingInfo3Str, '3'),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                confirmButton(
                                    title: okStr,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            )
                          ],
                        );
                      },
                    )),
                    headerTitle: infoStr.tr,
                  );
                })
        ]),
      ),
    ],
  );
}

TextStyle _textStyle({Color color = grey}) =>
    TextStyle(fontFamily: FontName.helveticaBold.name, color: color);
