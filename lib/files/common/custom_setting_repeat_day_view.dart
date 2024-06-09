import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_setting_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget customSettingRepeatDayView(MyTuneSettingController cont) {
  List<String> dayFull = [
    sundayStr,
    mondayStr,
    tuesdayStr,
    wednesdayStr,
    thusdayStr,
    fridayStr,
    saturdayStr
  ];
  List<String> days = [
    sundaySortStr,
    mondaySortStr,
    tuesdaySortStr,
    wednesdaySortStr,
    thusdaySortStr,
    fridaySortStr,
    saturdaySortStr
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
              itemCount: days.length,
              itemBuilder: (context, index) {
                return cell(cont, si.isMobile ? days : dayFull, index, si);
                // cell(
                //     (si.isMobile ? days : dayFull) as MyTuneSettingController,
                //     index as List<String>,
                //     si);
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
      bool isContain = cont.selectedDays.contains("${index + 1}");
      print("Tapped SKY");
      if (isContain) {
        cont.selectedDays[index] = '';
      } else {
        cont.selectedDays[index] = "${index + 1}";
      }
      print("selected days = ${cont.selectedDays}");
    }, child: Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: cont.selectedDays.contains('${index + 1}') ? red : white,
        ),
        width: si.isMobile ? 45 : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Center(child: Obx(() {
            return UText(
              textColor:
                  cont.selectedDays.contains("${index + 1}") ? white : black,
              title: dayFull[index],
              enfontName: FontName.acMuna,
              enfontSize: 12,
            );
          })),
        ),
      );
    })),
  );
}
