import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/common/custom_day_list_view.dart';
import 'package:you_yemen/files/common/custom_repeat_monthly_view.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/playint_tune_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
//import 'package:you_yemen/files/reusable_widgets/buttons/play_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/play_icon.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/images.dart';

Widget playingTuneCell(ToneDetail info) {
  MyTuneController con = Get.find();
  return SizedBox(
    //width: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child: _tuneImage(info)),
        const SizedBox(height: 12),
        _tuneInfoView(info),
        dividerWidget(),
        statusView(info),
        dividerWidget(),
        timeWidget(info),
        dividerWidget(),
        con.isHideRepeatView(info)
            ? repeatView(info)
            : customRepeatMonthlyView(info),
        const SizedBox(height: 8),
      ],
    ),
  );
}

Widget repeatView(ToneDetail info) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UText(
        title: repeatStr,
        textColor: grey,
        //fontName: FontName.regular,
      ),
      const SizedBox(height: 6),
      customDayListView(info),
    ],
  );
}

Widget dividerWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Container(
      height: 1,
      color: grey,
    ),
  );
}

Widget timeWidget(ToneDetail info) {
  MyTuneController con = Get.find();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      titleSubtitle(fromStr, con.fromDate(info)),
      titleSubtitle(toStr, con.toDate(info)),
    ],
  );
}

Widget statusView(ToneDetail info) {
  MyTuneController con = Get.find();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      titleSubtitle(statusStr.tr, con.statusType(info)),
      titleSubtitle(
        callersStr.tr,
        con.getCallersType(info),
      ),
      titleSubtitle(timeStr.tr, con.timeType(info)),
    ],
  );
}

Widget titleSubtitle(String title, String subtitle) {
  return Column(
    children: [
      UText(
        title: title,
        fontName: FontName.acMuna,
        textColor: grey,
        fontSize: 12,
      ),
      UText(
        title: subtitle,
        fontName: FontName.acMuna,
        fontSize: 12,
      )
    ],
  );
}

_tuneInfoView(ToneDetail info) {
  TuneInfo inf = TuneInfo(
      toneId: info.toneId ?? '',
      toneName: info.toneName ?? '',
      artistName: info.artistName ?? '',
      toneIdStreamingUrl: info.toneIdStreamingUrl ?? '');
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: tuneNameWidget(info),
      ),
      // playButton(

      // ),

      playIcon(inf, () => null),
      //UText(title: "Add play button herre"),
      deleteButton(),
    ],
  );
}

Widget tuneNameWidget(ToneDetail info) {
  ToneDetail? info1 = info; //.toneDetails?.first;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UText(
        maxLine: 1,
        title: info1.toneName ?? '',
        fontName: FontName.acMuna,
      ),
      UText(
        maxLine: 1,
        title: info1.artistName ?? '',
        fontName: FontName.acMuna,
        textColor: grey,
      )
    ],
  );
}

Widget deleteButton() {
  return genericButton(
    height: 40,
    width: 40,
    btnColor: transparent,
    child: SvgPicture.asset(
      deleteSvg,
      height: 20,
    ),
  );
}

Widget _tuneImage(ToneDetail info) {
  return Container(
    child: uImage(url: info.toneIdpreviewImageUrl ?? ''),
  );
}

// BoxDecoration _cardDecoration() {
//   return const BoxDecoration(
//     color: white,
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(50),
//       bottomRight: Radius.circular(50),
//     ),
//   );
// }
