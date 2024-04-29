import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';

Widget navTunezButton() {
  return genericButton(
    isLeftIcon: false,
    title: tunezStr.tr,
    child: Icon(Icons.arrow_drop_down),
    onTap: () {
      print("navTunezButton tapped");
    },
  );

  // InkWell(
  //   onTap: () {
  //     print("navTunezButton tapped");
  //   },
  //   child: Column(
  //     children: [
  //       Expanded(
  //         child: Row(
  //           children: [
  //             UText(title: tunezStr.tr),
  //             Icon(Icons.arrow_drop_down),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}
