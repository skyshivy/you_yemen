import 'package:flutter/material.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

PreferredSizeWidget? customAppBar({String? title, bool? inCenter = true}) {
  return AppBar(
    centerTitle: inCenter,
    elevation: 2,
    backgroundColor: white,
    title: UText(
      title: title ?? '',
      fontName: FontName.helveticaBold,
      fontSize: 18,
    ),
  );
}
