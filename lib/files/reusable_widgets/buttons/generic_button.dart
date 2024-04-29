import 'package:flutter/material.dart';
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
            ? _buttonWithTitleAndIcon(child, title, isLeftIcon)
            : _otherCase(title, child),
      ),
    ),
  );
}

Widget? _otherCase(String? title, Widget? child) {
  return title != null
      ? Center(child: UText(title: title))
      : Center(child: child);
}

Row _buttonWithTitleAndIcon(Widget child, String title, isLeftIcon) {
  return Row(
    children: [
      isLeftIcon ? child : SizedBox(),
      UText(title: title),
      isLeftIcon ? SizedBox() : child,
    ],
  );
}
