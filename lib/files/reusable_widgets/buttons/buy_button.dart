import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/auth_view/login_popup_view.dart';
import 'package:you_yemen/files/common/buy_popup/buy_popup.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

// Widget buyButton(
//   Function()? onTap ) {
//   return InkWell(
//     onTap: onTap,
//      //!=null ?()=> showBuyPopup(context):null,

//     child: Container(
//         height: 40,
//         decoration: BoxDecoration(
//           color: yellow,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: transparent),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 Icons.card_travel,
//                 size: 20,
//               ),
//               SizedBox(width: 4),
//               UText(
//                 title: buyStr,
//                 enfontName: FontName.helveticaBold,
//               ),
//             ],
//           ),
//         )),
//   );
// }

Widget buyButton(TuneInfo info, Function()? onTap) {
  return ResponsiveBuilder(
    builder: (context, sizingInformation) {
      return GestureDetector(
        onTap: onTap != null
            ? () => Get.dialog(Center(
                  child: BuyPopupView(info: info),
                ))
            : null,
        child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: yellow,
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
                  ),
                  SizedBox(width: 4),
                  UText(
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
