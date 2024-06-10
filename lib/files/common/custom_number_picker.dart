import 'package:flutter/cupertino.dart';

import 'package:numberpicker/numberpicker.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget customNumberPicker(int value, Function(int) onSelected, {int max = 23}) {
  return NumberPicker(
      textStyle: TextStyle(fontFamily: FontName.acMuna.name, color: black),
      selectedTextStyle: TextStyle(
          fontFamily: FontName.acMunaBlack.name, color: red, fontSize: 18),
      itemHeight: 35,
      itemCount: 3,
      value: value,
      minValue: 0,
      maxValue: max,
      onChanged: (value) {
        onSelected(value);
      });
}
