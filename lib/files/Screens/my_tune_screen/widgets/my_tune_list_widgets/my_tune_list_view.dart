//import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/grid_delegate.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/tune_card.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/screens/my_tune_screen/widgets/my_tune_list_widgets/my_tune_header_view.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class MyTuneListView extends StatelessWidget {
  MyTuneListView({super.key});
  final MyTuneController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Obx(() {
          return cont.isLoadingMyTuneList.value
              ? loadingIndicator(height: 300, radius: 20)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: si.isMobile ? 8 : 30),
                      child: myTuneHeaderView(),
                    ),
                    const SizedBox(height: 20),
                    gridView(),
                  ],
                );
        });
      },
    );
  }

  Widget gridView() {
    return Obx(() {
      return cont.myTuneError.isEmpty
          ? GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              gridDelegate: gridDelegate(),
              shrinkWrap: true,
              itemCount: cont.myTuneList.length,
              itemBuilder: (context, index) {
                TuneInfo inf = cont.myTuneList[index].toneDetails ?? TuneInfo();
                return TuneCard(
                  info: inf, //TuneInfo(artistName: "gfgfghf"),
                  rightButton: settingWidget(context, inf),
                  moreButton: Container(
                    height: 30,
                    width: 30,
                    color: red,
                  ),
                );
              },
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 200,
                    child: Center(child: UText(title: cont.myTuneError.value)))
              ],
            );
    });
  }

  ListView listViewBuilder(TuneInfo info) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SizedBox(
            width: 220,
            child: TuneCard(
              info: info,
              rightButton: settingWidget(context, info),
              moreButton: UText(title: "More button Here"),
            ),
          ),
        );
      },
    );
  }

  settingWidget(BuildContext context, TuneInfo info) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return genericButton(
          borderColor: black,
          onTap: () {
            context.push(tuneSettingRoute, extra: info);
            print("Move to tune setting");
          },
          title: settingStr.tr,
          fontSize: si.isMobile ? 10 : 12,
          fontName: FontName.helveticaBold,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 2),
            child: const Icon(
              Icons.settings,
              size: 18,
            ),
          ),
        );
      },
    );
  }
}
