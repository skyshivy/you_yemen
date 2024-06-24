import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_yemen/files/Screens/wishlist_screen/wishlist_screen.dart';
import 'package:you_yemen/files/common/mobile_navigation.dart';
import 'package:you_yemen/files/controllers/mobile_menu_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';

import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/screens/profile_screen/faq_screen.dart';
import 'package:you_yemen/files/screens/profile_screen/transaction_screen.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';

import 'package:you_yemen/files/utility/colors.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});
  MobileMenuController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GetPlatform.isWeb
            ? Container(
                height: 50,
              )
            : SizedBox(),
        Container(
          height: 1,
          color: lightGrey,
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: con.menuList.length,
          itemBuilder: (context, index) {
            return cell(index, context);
          },
        ),
      ],
    );
  }

  Widget cell(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(onTap: () {
        if (con.menuList[index].routeName == wishlistRoute) {
          mobileNavigation(context, WishListScreen(), title: wishlistStr);
        } else if (con.menuList[index].routeName == faqRoute) {
          mobileNavigation(context, FaqScreen(), title: faqStr);
        } else if (con.menuList[index].routeName == transactionRoute) {
          mobileNavigation(context, TransactionScreen(), title: historyStr);
        } else if (con.menuList[index].routeName == logoutStr) {
          StoreManager().logout();
        }

        con.updateOnSelection(index);
      }, child: Obx(() {
        return Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: con.selectedIndex.value == index ? green : transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  UText(
                    title: con.menuList[index].title,
                    fontName: FontName.helveticaBold,
                    textColor: con.selectedIndex.value == index ? white : black,
                  ),
                ],
              ),
            ));
      })),
    );
  }
}
