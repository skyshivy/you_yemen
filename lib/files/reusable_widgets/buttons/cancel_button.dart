import 'package:flutter/material.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget cancelButton({double titlePadding = 12, Function()? onTap}) {
  return InkWell(
    focusColor: transparent,
    hoverColor: transparent,
    splashColor: transparent,
    highlightColor: transparent,
    onTap: onTap,
    child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: buttonBorderColor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: titlePadding, vertical: 4),
          child: Center(
            child: UText(
              title: cancelStr,
            ),
          ),
        )),
  );
}
