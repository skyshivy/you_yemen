import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/translation/strings.dart';

Widget faqButton() {
  return LayoutBuilder(
    builder: (context, constraints) {
      return genericButton(
        height: null,
        title: faqStr,
        onTap: () {
          print("faq tapped");
          context.goNamed(faqRoute);
        },
      );
    },
  );
  // genericButton(faqStr, () {
  //   print("faq tapped");
  // });
}
