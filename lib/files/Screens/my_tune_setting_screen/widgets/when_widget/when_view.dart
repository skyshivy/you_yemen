import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/custom_setting_repeat_day_view.dart';
import 'package:you_yemen/files/common/custom_setting_repeat_year_view.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/custom_calender_controller.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_setting_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/screens/my_tune_setting_screen/widgets/calender_popup/open_calender_time_popup.dart';
import 'package:you_yemen/files/screens/my_tune_setting_screen/widgets/calender_popup/open_time_picker.dart';
import 'package:you_yemen/files/screens/my_tune_setting_screen/widgets/when_widget/time_type_button.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class WhenView extends StatelessWidget {
  WhenView({super.key});
  final MyTuneSettingController cont = Get.find();
  CustomCalenderController calCont = Get.find();
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: UText(
                    title: whenYouWantToPlayItStr.tr,
                    fontName: FontName.acMuna,
                    fontSize: si.isMobile ? 14 : 16,
                  ),
                ),
                buttonsWidget(),
                repeatWidget(),
                hideDaysView()
              ],
            ),
          ],
        );
      },
    );
  }

  Widget hideDaysView() {
    return Obx(() {
      return AnimatedSizeAndFade(
        fadeDuration: const Duration(milliseconds: 200),
        sizeDuration: const Duration(milliseconds: 200),
        child: (cont.whenIndex.value == 2)
            ? customSettingRepeatYearView(cont)
            : customSettingRepeatDayView(cont),
      );
    });
  }

  Widget repeatWidget() {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, top: 30),
          child: UText(
            title: repeatStr.tr,
            fontName: FontName.acMuna,
            fontSize: si.isMobile ? 12 : null,
          ),
        );
      },
    );
  }

  Widget buttonsWidget() {
    return ResponsiveBuilder(
      builder: (context, si) {
        return (si.isMobile)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [selectTimeTypeButton(), timeAndDateButton()],
              )
            : Row(
                children: [
                  selectTimeTypeButton(),
                  timeAndDateButton(),
                ],
              );
      },
    );
  }

  Widget timeAndDateButton() {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Obx(() {
          return AnimatedSizeAndFade(
            child: (cont.whenIndex.value == 0)
                ? const SizedBox()
                : Row(
                    children: [
                      fromButtonWidget(context),
                      toButtonWidget(context)
                    ],
                  ),
          );
        });
      },
    );
  }

  Widget selectTimeTypeButton() {
    return TimeTypeButton();
  }

  Widget fromButtonWidget(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              if (cont.whenIndex.value == 1) {
                print("Tapped on from time");
                openTimePicker(
                  context,
                  isFrom: true,
                  onConfirm: (p0) {
                    cont.fromTimeValue.value = p0;
                  },
                );
                //cont.openFromTime();
              } else {
                print("Tapped on from time and date");
                openTimeAndDatePicker(
                  context,
                  isFrom: true,
                  onConfirm: () {
                    cont.fromTimeValue.value = calCont.fromDateTime;
                    print("openTimeAndDatePicker from");
                  },
                );
                // cont.openFromTimeDate(context);
              }
            },
            child: Container(
              color: white,
              width: 155,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Obx(() {
                  return timeTextWidget(
                      cont.fromTimeTitle.value, cont.fromTimeValue.value);
                }),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget toButtonWidget(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              if (cont.whenIndex.value == 1) {
                print("Tapped on to time");
                openTimePicker(context, isFrom: false, onConfirm: (p0) {
                  cont.toTimeValue.value = p0;
                });
              } else {
                print("Tapped on to time and date");
                openTimeAndDatePicker(
                  context,
                  isFrom: false,
                  onConfirm: () {
                    cont.toTimeValue.value = calCont.toDateTime;
                    print("openTimeAndDatePicker to");
                  },
                );
                //cont.openToTimeDate(context);
              }
            },
            child: Container(
              color: white,
              width: 155,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Obx(() {
                  return timeTextWidget(
                      cont.toTimeTitle.value, cont.toTimeValue.value);
                }),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget timeTextWidget(String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UText(
          title: title,
          textColor: grey,
          fontName: FontName.acMuna,
          fontSize: 12,
        ),
        const SizedBox(height: 4),
        UText(title: subtitle, fontName: FontName.acMuna),
      ],
    );
  }
}
