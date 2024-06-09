import 'package:flutter/material.dart';

import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget popupCloseButton(Function() onTap) {
  return genericButton(
    height: 35,
    width: 35,
    btnColor: transparent,
    child: Center(
        child: Icon(
      Icons.close,
      color: red,
    )),
    onTap: onTap,
  );
}
