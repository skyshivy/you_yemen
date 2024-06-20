import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/api_gokul/delete_wishlist_api.dart';
import 'package:you_yemen/files/controllers/wishlist_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/sc_wishlist_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/decorations/card_decoration.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/images.dart';

Widget cardMoreButtonWishlist(int index, Wishlist wishinfo) {
  return ResponsiveBuilder(
    builder: (context, si) {
      return InkWell(
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) =>
                _popoverListView(context, index, wishinfo),
            direction: PopoverDirection.bottom,
            width: 80,
            height: 30,
            arrowHeight: 8,
            radius: 4,
            arrowWidth: 20,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Container(
            height: 36,
            width: 36,
            decoration: cardDecoration(radius: 18),
            child: const Icon(Icons.more_horiz),
          ),
        ),
      );
    },
  );
}

Widget _popoverListView(BuildContext context, int index, Wishlist wishinfo) {
  WishListController contt = Get.put(WishListController());
  return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: () {
          contt.deleteFromWishlist(wishinfo);
          Navigator.pop(context);
        },
        child: Row(
          children: [
            // SvgPicture.asset(
            //   deleteSvg,
            //   height: 14,
            //   width: 14,
            //   color: red,
            // ),
            Icon(
              Icons.delete,
              color: red,
              size: 18,
            ),
            UText(
              title: deleteStr,
              fontName: FontName.acMuna,
            ),
          ],
        ),
      ));
}
