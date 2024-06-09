import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/tell_friend_popup/buy_a_friend_popup.dart';

import 'package:you_yemen/files/common/tell_friend_popup/popup.dart';

import 'package:you_yemen/files/controllers/tell_a_friend_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/screens/home_screen/success_popup.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

CustomPopupController cont = Get.put(CustomPopupController());
Widget buyButton(TuneInfo info, Function()? onTap) {
  return ResponsiveBuilder(
    builder: (context, sizingInformation) {
      return GestureDetector(
        onTap: onTap != null
            ? () => Get.dialog(
/////////////////           for buy/gift

                  Obx(() {
                    return cont.isSuccess.value
                        ? SuccessPopupView()
                        : Buy_a_friend_PopupView(
                            msisdn: StoreManager().msisdn,
                            info: info,
                          );
                  }),

///////////////          for tell a friend

                  // Obx(() {
                  //   return cont.isSuccess.value
                  //       ? SuccessPopupView()
                  //       : TellFriendPopupView(
                  //           msisdn: StoreManager().msisdn,
                  //           info: info,
                  //         );
                  // }),

                  barrierDismissible: false,
                )
            :
            // Get.dialog(Center(
            //       child: BuyPopupView(info: info),
            //     ))
            null,
        child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: transparent),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.card_travel,
                    size: 16,
                    color: white,
                  ),
                  SizedBox(width: 4),
                  UText(
                    textColor: white,
                    title: buyStr,
                    enfontName: FontName.helveticaBold,
                  ),
                ],
              ),
            )),
      );
    },
  );
}
