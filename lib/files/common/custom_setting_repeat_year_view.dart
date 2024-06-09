import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_setting_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget customSettingRepeatYearView(MyTuneSettingController cont) {
  List<String> repeatYear = [
    noneStr,
    monthlyStr,
    yearlyStr,
  ];

  return Padding(
    padding: const EdgeInsets.only(left: 8, bottom: 14, top: 10),
    child: SizedBox(
        height: 40,
        child: ResponsiveBuilder(
          builder: (context, si) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: repeatYear.length,
              itemBuilder: (context, index) {
                return cell(cont, repeatYear, index, si);
              },
            );
          },
        )),
  );
}

Padding cell(MyTuneSettingController cont, List<String> dayFull, int index,
    SizingInformation si) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: () {
      cont.updateYearTab(index);

      print("selected days = ${cont.selectedDays}");
    }, child: Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: cont.yearRepeatindex.value == index ? red : white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Center(child: Obx(() {
            return UText(
              textColor: cont.yearRepeatindex.value == index ? white : black,
              title: dayFull[index],
              fontName: FontName.acMuna,
              fontSize: 12,
            );
          })),
        ),
      );
    })),
  );
}
