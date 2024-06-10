import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/controllers/player_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget playButton(TuneInfo info, Function()? onTap) {
  PlayerController cont = Get.find();
  return InkWell(onTap: () {
    cont.playUrl(info, 0);
    if (onTap != null) {
      onTap();
    }
  }, child: ResponsiveBuilder(
    builder: (context, si) {
      return Container(
        height: 40,
        decoration: BoxDecoration(
          color: transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: buttonBorderColor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: si.isMobile
              ? Center(
                  child: Obx(() {
                    return UText(
                      title: (cont.toneId.value == info.toneId)
                          ? pauseStr
                          : playStr,
                      fontName: FontName.helveticaBold,
                      fontSize: si.isMobile ? 10 : 12,
                    );
                  }),
                )
              : Obx(
                  () {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        cont.toneId.value == info.toneId
                            ? Icon(
                                Icons.pause,
                                size: 18,
                              )
                            : Icon(Icons.play_arrow_rounded),
                        SizedBox(width: 2),
                        UText(
                          title: (cont.toneId.value == info.toneId)
                              ? pauseStr
                              : playStr,
                          fontName: FontName.helveticaBold,
                          fontSize: si.isMobile ? 10 : 12,
                        ),
                      ],
                    );
                  },
                ),
        ),
      );
    },
  ));
}
