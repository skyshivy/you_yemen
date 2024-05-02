import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/screens/category_screen/category_popup_list.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

Widget navTunezButton() {
  return Column(
    children: [
      Expanded(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return genericButton(
              isLeftIcon: false,
              title: tunezStr.tr,
              child: Icon(Icons.arrow_drop_down),
              onTap: () {
                showPopover(
                  context: context,
                  radius: contanerCornerRadius / 2,
                  bodyBuilder: (context) {
                    return CategoryPopupListView();
                  },
                );
                print("navTunezButton tapped");
              },
            );
          },
        ),
      ),
    ],
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
