import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/models/playint_tune_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget customDayListView(PlayingToneDetail info) {
  List<String> dayArray = (info.weeklyDays ?? '').split(',');
  return SizedBox(
    height: 24,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        _dayCell(sundaySortStr.tr, dayArray.contains('1')),
        _dayCell(mondaySortStr.tr, dayArray.contains('2')),
        _dayCell(tuesdaySortStr.tr, dayArray.contains('3')),
        _dayCell(wednesdaySortStr.tr, dayArray.contains('4')),
        _dayCell(thusdaySortStr.tr, dayArray.contains('5')),
        _dayCell(fridaySortStr.tr, dayArray.contains('6')),
        _dayCell(saturdaySortStr.tr, dayArray.contains('7')),
      ],
    ),
  );
}

Widget _dayCell(String title, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.only(right: 4),
    child: genericButton(
      height: 25,
      width: 25,
      btnColor: white,
      borderColor: isSelected ? red : grey,
      title: title,
    ),
  );
}
