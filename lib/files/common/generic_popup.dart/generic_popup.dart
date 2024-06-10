import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/popup_header_view.dart';
import 'package:you_yemen/files/utility/colors.dart';

genericPopup(Widget widget,
    {String? headerTitle,
    Widget? headerWidget,
    Widget? footerWidget,
    Color? color,
    Color? headerBgColor,
    double width = 440}) {
  print("Title $headerTitle");
  Get.dialog(Center(
      child: _genericContainer(widget, headerTitle, headerWidget, footerWidget,
          color, headerBgColor, width)));
}

Widget _genericContainer(
    Widget widget,
    String? headerTitle,
    Widget? headerWidget,
    Widget? footerWidget,
    Color? color,
    Color? headerBgColor,
    double width) {
  print("headerTitle = $headerTitle");
  return ResponsiveBuilder(
    builder: (context, sizingInformation) {
      return ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: color ?? white),
                  width: width,
                  child: Column(
                    children: [
                      Material(
                        color: color ?? white,
                        child: headerWidget ??
                            popupHeaderView(
                                title: headerTitle ?? '',
                                onTap: () {
                                  print("CLose buton tapped");
                                  Navigator.of(context).pop();
                                },
                                hearBgColor: headerBgColor),
                      ), // const SizedBox(),
                      Material(
                        color: transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          child: widget,
                        ),
                      ),
                      Material(
                          color: transparent,
                          child: footerWidget ?? const SizedBox()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
