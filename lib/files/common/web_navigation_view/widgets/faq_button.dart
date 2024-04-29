import 'package:flutter/material.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/translation/strings.dart';

Widget faqButton() {
  return genericButton(
    height: null,
    title: faqStr,
    onTap: () {
      print("faq tapped");
    },
  );
  // genericButton(faqStr, () {
  //   print("faq tapped");
  // });
}
