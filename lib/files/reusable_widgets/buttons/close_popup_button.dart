import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget closePopupButton({Color btnColor = white, Color iconColor = black}) {
  return ResponsiveBuilder(
    builder: (context, sizingInformation) {
      return genericButton(
        btnColor: btnColor,
        width: 40,
        child: Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Icon(
            Icons.close,
            size: 18,
            color: iconColor,
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      );
      // Container(
      //   height: 30,
      //   width: 30,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(15), color: white),
      //   child: Center(
      //     child: Icon(
      //       Icons.close,
      //       size: 18,
      //     ),
      //   ),
      // );
    },
  );
}
