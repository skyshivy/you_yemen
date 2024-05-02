import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/auth_view/login_otp_view.dart';
import 'package:you_yemen/files/auth_view/login_popup_view.dart';
import 'package:you_yemen/files/common/buy_popup/buy_popup.dart';
import 'package:you_yemen/files/common/custom_hover.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/main.dart';

Widget navLoginButton() {
  List<String> titleList = [myProfileStr, myTunezStr, myWishListStr, logoutStr];
  List<IconData> imageList = [
    Icons.person,
    Icons.music_note_sharp,
    Icons.favorite_outline,
    Icons.logout
  ];

  return ResponsiveBuilder(
    builder: (context, si) {
      return Obx(
        () {
          return genericButton(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(Icons.person, size: 18),
            ),
            title: appCont.isLoggedIn.value ? myAccountStr : loginStr,
            borderColor: grey,
            padding: EdgeInsets.symmetric(horizontal: 16),
            onTap: () {
              if (StoreManager().isLoggedIn) {
                _popoverMyAccountMenu(context, titleList, imageList);
              } else {
                Get.dialog(Center(
                  child: LoginPopupView(),
                ));
              }
            },
          );
        },
      );
    },
  );
}

Widget _profileImage() {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: grey,
      ),
    ),
  );
}

_popoverMyAccountMenu(
    BuildContext context, List<String> titleList, List<IconData> imageList) {
  showPopover(
    context: context,
    width: 150,
    arrowHeight: 8,
    arrowWidth: 20,
    radius: 4,
    bodyBuilder: (context) {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: ListView.builder(
          padding: EdgeInsets.all(1),
          shrinkWrap: true,
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pop();
                if (index == 0) {
                  context.goNamed(profileRoute);
                } else if (index == 1) {
                  context.goNamed(myTunezRoute);
                } else if (index == 2) {
                  context.goNamed(wishlistRoute);
                } else {
                  StoreManager().logout();
                  GoRouter.of(context).go(homeRoute);
                }
              },
              child: _listCell(index, imageList, titleList),
            );
          },
        ),
      );
    },
  );
}

Widget _listCell(int index, List<IconData> imageList, List<String> titleList) {
  return Padding(
      padding: EdgeInsets.only(top: index == 0 ? 0 : 1),
      child: CustomHover(
        builder: (isHovered) {
          return Container(
            color: isHovered ? black : lightGrey,
            height: 30,
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      imageList[index],
                      size: 18,
                      color: isHovered ? white : black,
                    ),
                  ),
                  UText(
                    title: titleList[index],
                    enfontName: FontName.helvetica,
                    textColor: isHovered ? white : black,
                  ),
                ],
              ),
            ),
          );
        },
      ));
}
