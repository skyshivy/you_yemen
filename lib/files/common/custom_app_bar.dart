import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';

PreferredSizeWidget? customAppBar({String? title}) {
  return GetPlatform.isWeb
      ? null
      : AppBar(
          title: title != null
              ? UText(
                  title: title,
                  fontName: FontName.helveticaBold,
                )
              : null,
        );
}
