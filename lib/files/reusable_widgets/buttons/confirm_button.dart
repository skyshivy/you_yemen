import 'package:flutter/material.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget confirmButton(Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: yellow,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: transparent),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Center(
            child: UText(
              title: confirmStr,
            ),
          ),
        )),
  );
}
