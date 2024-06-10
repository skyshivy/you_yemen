import 'package:flutter/material.dart';
import 'package:you_yemen/files/common/popup_closeButton.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget popupHeaderView(
    {Function()? onTap, String title = confirmStr, Color? hearBgColor}) {
  return Material(
    color: transparent,
    child: Container(
      height: 45,
      color: hearBgColor ?? lightGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 40),
            _titleWidget(title),
            popupCloseButton(() {
              if (onTap != null) {
                onTap();
              }
            })
          ],
        ),
      ),
    ),
  );
}

Widget _titleWidget(String title) {
  return UText(
    title: title,
    fontSize: 16,
    fontName: FontName.acMuna,
  );
}
