import 'package:flutter/material.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget genericButton({
  double? height = 40,
  double? width,
  double? radius,
  Color borderColor = transparent,
  EdgeInsetsGeometry? padding,
  Color btnColor = white,
  bool isLeftIcon = true,
  String? title,
  FontName? fontName,
  double? fontSize,
  BorderRadiusGeometry? borderRadius,
  Widget? child,
  Function()? onTap,
}) {
  return InkWell(
    focusColor: transparent,
    hoverColor: transparent,
    splashColor: transparent,
    highlightColor: transparent,
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius:
            borderRadius ?? BorderRadius.circular(radius ?? (height ?? 0) / 2),
        color: btnColor,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
        child: (title != null && child != null)
            ? _buttonWithTitleAndIcon(
                child, title, isLeftIcon, fontName, fontSize)
            : _otherCase(title, child, fontName, fontSize),
      ),
    ),
  );
}

Widget? _otherCase(
    String? title, Widget? child, FontName? fontName, double? fontSize) {
  return title != null
      ? Center(
          child: UText(
          title: title,
          fontName: fontName,
          fontSize: fontSize,
        ))
      : Center(child: child);
}

Row _buttonWithTitleAndIcon(Widget child, String title, isLeftIcon,
    FontName? fontName, double? fontSize) {
  return Row(
    children: [
      isLeftIcon ? child : SizedBox(),
      UText(title: title, fontName: fontName, fontSize: fontSize),
      isLeftIcon ? SizedBox() : child,
    ],
  );
}
