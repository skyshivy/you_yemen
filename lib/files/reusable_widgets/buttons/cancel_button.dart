import 'package:flutter/material.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget cancelButton(Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: buttonBorderColor),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: UText(
            title: cancelStr,
          ),
        )),
  );
}
