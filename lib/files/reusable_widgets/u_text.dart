import 'package:flutter/material.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/colors.dart';

class UText extends StatelessWidget {
  const UText({
    super.key,
    this.enfontName = FontName.helvetica,
    this.arfontName = FontName.acMuna,
    this.enfontSize,
    this.arfontSize,
    this.textColor = black,
    this.maxLine = 1,
    this.alignment = TextAlign.start,
    required this.title,
  });
  final String title;
  final FontName enfontName;
  final FontName arfontName;
  final double? enfontSize;
  final double? arfontSize;
  final Color? textColor;
  final int maxLine;
  final TextAlign alignment;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine,
      textAlign: alignment,
      style: TextStyle(
          color: textColor,
          fontFamily:
              StoreManager().isEnglish ? enfontName.name : arfontName.name,
          fontSize: StoreManager().isEnglish
              ? (enfontSize ?? 14)
              : (arfontSize ?? 14)),
    );
  }
}
