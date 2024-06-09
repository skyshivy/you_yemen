import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:you_yemen/files/common/custom_number_picker.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/custom_calender_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/cancel_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/translation/strings.dart';

openTimePicker(BuildContext context,
    {bool isFrom = true, Function(String)? onConfirm}) {
  CustomCalenderController cont = Get.find();
  showPopover(
    context: context,
    bodyBuilder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [_hourColumn(cont, isFrom), _minuteColumn(cont, isFrom)],
          ),
          const SizedBox(height: 8),
          cancelConfirmButton(isFrom, context, cont, onConfirm),
        ],
      );
    },
    onPop: () => print('Popover was popped!'),
    direction: PopoverDirection.top,
    width: 300,
    arrowHeight: 8,
    arrowWidth: 20,
  );
}

Widget cancelConfirmButton(bool isFrom, BuildContext context,
    CustomCalenderController cont, Function(String)? onConfirm) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 100,
            child: cancelButton(onTap: () {
              Navigator.of(context).pop();
            })),
        SizedBox(
            width: 100,
            child: confirmButton(onTap: () {
              if (isFrom) {
                cont.confirmFromTimeButtonAction();
              } else {
                cont.confirmToTimeButtonAction();
              }
              if (onConfirm != null) {
                if (isFrom) {
                  onConfirm(cont.fromTime);
                } else {
                  onConfirm(cont.toTime);
                }
              }

              Navigator.of(context).pop();
            }))
      ],
    ),
  );
}

Expanded _minuteColumn(CustomCalenderController cont, bool isFrom) {
  return Expanded(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(height: 10),
      UText(title: minutesStr, enfontName: FontName.acMuna),
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
            //       if (isFrom) {
            //         cont.updateFromTempMin(59);
            //       } else {
            //         cont.updateToTempMin(59);
            //       }
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

Expanded _hourColumn(CustomCalenderController cont, bool isFrom) {
  return Expanded(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(height: 10),
      UText(title: hourStr.tr, enfontName: FontName.acMuna),
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
          //       if (isFrom) {
          //         cont.updateFromTempHour(23);
          //       } else {
          //         cont.updateToTempHour(23);
          //       }
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
