import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget confirmButton(
    {String? title, double titlePadding = 12, Function()? onTap}) {
  return InkWell(
      focusColor: transparent,
      hoverColor: transparent,
      splashColor: transparent,
      highlightColor: transparent,
      onTap: onTap,
      child: ResponsiveBuilder(
        builder: (context, si) {
          return Container(
            height: 40,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: transparent),
            ),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: titlePadding, vertical: 4),
              child: Center(
                child: UText(
                  title: title ?? confirmStr,
                  textColor: white,
                  fontSize: si.isMobile ? 10 : 12,
                ),
              ),
            ),
          );
        },
      ));
}
