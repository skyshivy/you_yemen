import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/playint_tune_model.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget customRepeatMonthlyView(PlayingToneDetail info) {
  MyTuneController co = Get.find();
  return SizedBox(
    height: 50,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        UText(
          title: repeatStr,
          textColor: grey,
          //fontName: FontName.regular,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              _button(noneStr, co.repeatYearlySelectedType(info) == 0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child:
                    _button(monthlyStr, co.repeatYearlySelectedType(info) == 1),
              ),
              _button(yearlyStr, co.repeatYearlySelectedType(info) == 2),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _button(String title, bool isSelected) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: isSelected ? red : grey,
      width: 2.0, // Underline thickness
    ))),
    child: Center(
      child: UText(
        title: title,
        fontSize: 12,
        fontName: FontName.acMuna,
        textColor: isSelected ? red : grey,
      ),
    ),
  );
}
