import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:you_yemen/files/common/custom_hover.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/menu_model.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

showPositionedPopup(GlobalKey key, List<MenuModel> menuList,
    {bool isLeft = false,
    double? width,
    bool isSvg = false,
    Function(MenuModel)? onTap}) {
  RenderBox renderbox = key.currentContext!.findRenderObject() as RenderBox;
  Size size = renderbox.size;

  RenderBox? box = key.currentContext!.findRenderObject() as RenderBox?;

  Offset position = box!.localToGlobal(Offset.zero);
  double xPosition = position.dx;
  double yPosition = position.dy;

  Get.dialog(
    Stack(
      children: [
        Positioned(
          left: isLeft ? (xPosition - (width ?? size.width) + 30) : xPosition,
          top: yPosition + size.height + 4,
          child: Material(
            color: transparent,
            child: SizedBox(
                width: width ?? size.width,
                child: _widgetDecoration(menuList, isSvg, onTap)),
          ),
        ),
      ],
    ),
  );
}

Widget _widgetDecoration(
    List<MenuModel> menuList, bool isSvg, Function(MenuModel)? onTap) {
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: mainContainerDecoration(menuList),
    child: _customMenuListView(menuList, isSvg, onTap),
  );
}

BoxDecoration mainContainerDecoration(List<MenuModel> menuList) {
  return BoxDecoration(
    border: Border.all(color: white),
    borderRadius: BorderRadius.circular(2),
    color: white,
  );
}

Widget _customMenuListView(
    List<MenuModel> menuList, bool isSvg, Function(MenuModel)? onTap) {
  return ListView.builder(
      itemCount: menuList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomHover(builder: (isHover) {
          return InkWell(
            onTap: () {
              //Get.back();
              Navigator.pop(context);
              onTap!(menuList[index]);
            },
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: isHover ? red : transparent,
                    ),
                    child: cell(menuList, index, isSvg, isHover)),
                (menuList.length - 1) == index
                    ? const SizedBox()
                    : const Divider(
                        height: 2,
                      )
              ],
            ),
          );
        });
      });
}

Padding cell(List<MenuModel> menuList, int index, bool isSvg, bool isHover) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        cellImage(menuList[index], isSvg, isHover),
        customSpacer(menuList, index),
        cellTitle(menuList[index], isHover),
      ],
    ),
  );
}

SizedBox customSpacer(List<MenuModel> menuList, int index) {
  return (menuList[index].imageName == null)
      ? const SizedBox()
      : const SizedBox(width: 6);
}

Widget cellTitle(MenuModel menu, bool isHover) {
  return UText(
    title: menu.title,
    textColor: isHover ? white : black,
    fontName: FontName.acMuna,
  );
}

Widget cellImage(MenuModel menu, bool isSvg, bool isHover) {
  return (menu.imageName == null)
      ? const SizedBox()
      : SizedBox(
          height: 15,
          width: 15,
          child: isSvg
              ? SvgPicture.asset(
                  menu.imageName ?? '',
                  color: isHover ? white : black,
                )
              : Image.asset(menu.imageName ?? '',
                  color: isHover ? white : black),
        );
}
