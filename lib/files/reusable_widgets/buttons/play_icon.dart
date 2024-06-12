import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/controllers/player_controller.dart';
//import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
//import 'package:you_yemen/files/reusable_widgets/u_text.dart';
//import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget playIcon(TuneInfo info, Function()? onTap, {double size = 30}) {
  PlayerController cont = Get.find();

  return InkWell(
      focusColor: transparent,
      hoverColor: transparent,
      splashColor: transparent,
      highlightColor: transparent,
      onTap: () {
        cont.playUrl(info, 0);
        if (onTap != null) {
          onTap();
        }
      },
      child: ResponsiveBuilder(
        builder: (context, si) {
          return Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: transparent,
              borderRadius: BorderRadius.circular(size / 2),
              border: Border.all(color: buttonBorderColor),
            ),
            child: Center(child: Obx(() {
              return Icon(
                cont.toneId.value == info.toneId
                    ? Icons.pause
                    : Icons.play_arrow_rounded,
                size: 18,
              );
            })),
          );
        },
      ));
}
