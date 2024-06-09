import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_yemen/files/common/show_positioned_popup.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/custom_calender_controller.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_setting_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/menu_model.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class TimeTypeButton extends StatelessWidget {
  MyTuneSettingController cont = Get.find();
  CustomCalenderController calCont = Get.find();
  TimeTypeButton({super.key});
  final GlobalKey _key = GlobalKey();
  List<MenuModel> menuList = [
    MenuModel(fullDayStr),
    MenuModel(selectTimeStr),
    MenuModel(selectTimeDateStr)
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: _key,
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          calCont.resetValue();
          print("On tap selectTimeDateStr");
          Get.dialog(showPositionedPopup(
            _key,
            menuList,
            onTap: (p0) {
              cont.updateWhen(p0);
            },
          ));
        },
        child: Container(
          width: 180,
          color: white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return UText(
                    title: cont.whenButtonTitle.value,
                    enfontName: FontName.acMuna,
                    enfontSize: 13,
                  );
                }),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
