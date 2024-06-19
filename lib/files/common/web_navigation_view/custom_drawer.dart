import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:you_yemen/files/auth_view/login_popup_view.dart';
import 'package:you_yemen/files/controllers/category_controller.dart';
import 'package:you_yemen/files/controllers/custom_drawer_controller.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/main.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final CustomDrawerController con = Get.find();
  CategoryController categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    print("Drawer repainted");
    con.createMenu();

    return Container(
      child: Column(
        children: [
          SizedBox(height: 50),
          Container(
            height: 1,
            color: lightGrey,
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: con.drawerMenu.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      con.drawerMenu[index].route == catDetailRoute
                          ? subList(context, index)
                          : _drawerCell(context, index),
                      Container(
                        height: 1,
                        color: lightGrey,
                      ),
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _drawerCell(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        print("Route tapped ${con.drawerMenu[index].route}");
        if (con.drawerMenu[index].route == catDetailRoute) {
          con.isOpen.value = !con.isOpen.value;
          return;
        }
        if (con.drawerMenu[index].route == loginStr) {
          Get.dialog(
              barrierDismissible: false,
              Center(
                child: LoginPopupView(),
              ));
          Navigator.of(context).pop();
          return;
        }
        if (con.drawerMenu[index].route == logoutStr) {
          print("Route tapped ${con.drawerMenu[index].route}");
          StoreManager().logout();
          context.go(homeRoute);
          Navigator.of(context).pop();
          return;
        }
        context.goNamed(con.drawerMenu[index].route);
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              children: [
                con.drawerMenu[index].iconName.isEmpty
                    ? SizedBox(width: 14)
                    : SvgPicture.asset(
                        con.drawerMenu[index].iconName,
                        width: 14,
                        height: 14,
                      ),
                SizedBox(width: 8),
                UText(title: con.drawerMenu[index].title),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget subList(BuildContext context, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: _drawerCell(context, index)),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Obx(() {
                return RotatedBox(
                  quarterTurns: con.isOpen.value ? 1 : 0,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                );
              }),
            ),
          ],
        ),
        Obx(() {
          return con.isOpen.value
              ? Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: categoryController.categoryList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: lightGrey,
                            height: 1,
                          ),
                          subMenuCell(context, index),
                        ],
                      );
                    },
                  ),
                )
              : SizedBox();
        }),
      ],
    );
  }

  Widget subMenuCell(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).goNamed(catDetailRoute, queryParameters: {
          'categoryId': categoryController.categoryList[index].categoryId ?? '',
          'categoryName':
              categoryController.categoryList[index].categoryName ?? ''
        });
        Navigator.of(context).pop();
        //context.goNamed(con.drawerMenuList[index].route);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: UText(
                title:
                    categoryController.categoryList[index].categoryName ?? ''),
          ),
        ],
      ),
    );
  }
}
