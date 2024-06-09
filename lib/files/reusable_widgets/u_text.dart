import 'package:flutter/material.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/colors.dart';

class UText extends StatelessWidget {
  const UText({
    super.key,
    this.fontName = FontName.helvetica,
    this.fontSize,
    this.textColor = black,
    this.maxLine,
    this.alignment = TextAlign.start,
    required this.title,

    // required String Title, //bhavya
  });
  final String title;
  final FontName fontName;
  final double? fontSize;
  final Color? textColor;
  final int? maxLine;
  final TextAlign alignment;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine,
      textAlign: alignment,
      style: TextStyle(
        color: textColor,
        fontFamily: fontName.name,
        fontSize: (fontSize ?? 14),
      ),
    );
  }
}
