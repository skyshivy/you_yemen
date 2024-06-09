import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:you_yemen/files/common/custom_number_picker.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/custom_calender_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/cancel_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

openTimeAndDatePicker(BuildContext context,
    {bool isFrom = true, Function()? onConfirm}) {
  CustomCalenderController cont = Get.find();
  //cont.resetTimeValue();
  showPopover(
    context: context,
    bodyBuilder: (context) {
      return ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              sizingInformation.isMobile
                  ? mobileCalenderAndTimeColumn(cont, isFrom)
                  : deskTopCalenderAndTimeColumn(cont, isFrom),
              SizedBox(
                height: 45,
                child: cancelConfirmButton(context, cont, isFrom, onConfirm),
              )
            ],
          );
        },
      );
    },
    onPop: () => print('Popover was popped!'),
    direction: PopoverDirection.top,
    width: Get.width < 400 ? 360 : 450,
    height: Get.width < 700 ? null : 320,
    arrowHeight: 8,
    arrowWidth: 20,
  );
}

Widget cancelConfirmButton(BuildContext context, CustomCalenderController cont,
    bool isFrom, Function()? onConfirm) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 2, right: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
            width: 100,
            child: cancelButton(
              onTap: () {
                Navigator.of(context).pop();
              },
            )),
        const SizedBox(width: 20),
        SizedBox(
            width: 100,
            child: confirmButton(onTap: () {
              if (isFrom) {
                cont.confirmFromDateButtonAction();
              } else {
                cont.confirmToDateButtonAction();
              }
              if (onConfirm != null) {
                onConfirm();
              }
              Navigator.of(context).pop();
            }))
      ],
    ),
  );
}

Column mobileCalenderAndTimeColumn(CustomCalenderController cont, bool isFrom) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(height: 260, child: _calenderWidget(cont, isFrom)),
      SizedBox(
        //height: 200,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            hourColumn(cont, isFrom),
            minuteColumn(cont, isFrom),
          ],
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}

Row deskTopCalenderAndTimeColumn(CustomCalenderController cont, bool isFrom) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(height: 250, width: 230, child: _calenderWidget(cont, isFrom)),
      Flexible(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            hourColumn(cont, isFrom),
            minuteColumn(cont, isFrom),
          ],
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}

Expanded minuteColumn(CustomCalenderController cont, bool isFrom) {
  return Expanded(
      child: Column(
    children: [
      const SizedBox(height: 10),
      UText(title: minutesStr, enfontName: FontName.helveticaBold),
      //customNumberPicker(1, (p0) => null),
      Obx(() {
        return customNumberPicker(
            isFrom ? cont.tempfromMin.value : cont.temptoMin.value, (p0) {
          print("selected value ${cont.tempfromMin.value}");
          if (isFrom) {
            cont.updateFromTempMin(p0);
          } else {
            cont.updateToTempMin(p0);
          }
        }, max: 59);
      }),
      SizedBox(
          height: 40,
          width: 60,
          child: Obx(() {
            return UTextField(textEditingController: TextEditingController());
            // CustomTextField(
            //   fontName: FontName.bold,
            //   fontSize: 16,
            //   keyboardType: TextInputType.number,
            //   textAlign: TextAlign.center,
            //   addBorder: true,
            //   radius: 4,
            //   text: isFrom
            //       ? "${cont.tempfromMin.value}"
            //       : "${cont.temptoMin.value}",
            //   hint: minutesStr.tr,
            //   onSubmit: (text) {
            //     if (int.parse(text) >= 60) {
            //       return;
            //     }
            //     if (isFrom) {
            //       cont.updateFromTempMin(int.parse(text));
            //     } else {
            //       cont.updateToTempMin(int.parse(text));
            //     }
            //   },
            //   padding: EdgeInsets.all(0),
            // );
          }))
    ],
  ));
}

Expanded hourColumn(CustomCalenderController cont, bool isFrom) {
  return Expanded(
      child: Column(
    children: [
      const SizedBox(height: 10),
      UText(title: hourStr.tr, enfontName: FontName.helveticaBold),
      Obx(() {
        return customNumberPicker(
            isFrom ? cont.tempfromHour.value : cont.temptoHour.value, (p0) {
          if (isFrom) {
            cont.updateFromTempHour(p0);
          } else {
            cont.updateToTempHour(p0);
          }
        });
      }),
      SizedBox(
        width: 60,
        height: 40,
        child: Obx(() {
          return UTextField(textEditingController: TextEditingController());
          // CustomTextField(
          //   fontName: FontName.bold,
          //   fontSize: 16,
          //   textAlign: TextAlign.center,
          //   addBorder: true,
          //   radius: 4,
          //   text: isFrom
          //       ? "${cont.tempfromHour.value}"
          //       : "${cont.temptoHour.value}",
          //   hint: hourStr.tr,
          //   onSubmit: (text) {
          //     if (int.parse(text) >= 24) {
          //       return;
          //     }
          //     if (isFrom) {
          //       cont.updateFromTempHour(int.parse(text));
          //     } else {
          //       cont.updateToTempHour(int.parse(text));
          //     }
          //   },
          //   padding: EdgeInsets.all(0),
          // );
        }),
      )
    ],
  ));
}

Widget _calenderWidget(CustomCalenderController cont, bool isFrom) {
  return Scaffold(
    body: SizedBox(
      child: SfCalendar(
        cellBorderColor: grey,
        headerStyle: CalendarHeaderStyle(
          textStyle: TextStyle(
              color: red,
              fontSize: 16,
              fontFamily: FontName.helveticaBold.name),
          textAlign: TextAlign.center,
        ),
        viewHeaderStyle: ViewHeaderStyle(
            dayTextStyle: TextStyle(fontFamily: FontName.helveticaBold.name)),
        monthViewSettings: _monthCellDecoration(),
        selectionDecoration: BoxDecoration(
            border: Border.all(color: red, width: 2),
            borderRadius: BorderRadius.circular(4)),
        initialSelectedDate:
            isFrom ? cont.fromDate : cont.toDate, //DateTime.now(),
        onSelectionChanged: (calendarSelectionDetails) {
          if (isFrom) {
            cont.updateFromTempAction(calendarSelectionDetails.date);
          } else {
            cont.updateToTempAction(calendarSelectionDetails.date);
          }
        },

        firstDayOfWeek: 7,
        view: CalendarView.month,
        initialDisplayDate: isFrom ? cont.fromDate : cont.toDate,

        todayHighlightColor: red,
        showDatePickerButton: true,
        showCurrentTimeIndicator: true,
        showNavigationArrow: true,
        minDate: DateTime(2021, 03, 05, 10, 0, 0),
        maxDate: DateTime(2080, 03, 05, 10, 0, 0),
      ),
    ),
  );
}

MonthViewSettings _monthCellDecoration() {
  return MonthViewSettings(
    showAgenda: false,
    monthCellStyle: MonthCellStyle(
        textStyle:
            TextStyle(fontFamily: FontName.acMuna.name, color: Colors.black),
        leadingDatesTextStyle:
            TextStyle(fontFamily: FontName.acMuna.name, color: Colors.grey),
        trailingDatesTextStyle:
            TextStyle(fontFamily: FontName.acMuna.name, color: Colors.grey)),
  );
}
