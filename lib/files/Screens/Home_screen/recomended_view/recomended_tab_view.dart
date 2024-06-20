import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/controllers/recomended_controller.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

class RecomendedTabView extends StatelessWidget {
  RecomendedTabView({super.key});

  final RecomendedController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Obx(() {
          return con.isLoadingTab.value
              ? loadingIndicator(height: 200, radius: 20)
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: si.isMobile ? 8 : 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          decoration: mainDecoration(),
                          height: 40,
                          child: listBuilder(),
                        ),
                      ),
                    ],
                  ),
                );
        });
      },
    );
  }

  BoxDecoration mainDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: lightGrey,
    );
  }

  Widget listBuilder() {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(4),
        itemCount: con.tabTitleList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return listCell(index);
        },
      );
    });
  }

  Widget listCell(int index) {
    return InkWell(
      focusColor: transparent,
      hoverColor: transparent,
      splashColor: transparent,
      highlightColor: transparent,
      onTap: () {
        con.updateTabIndex(index);
      },
      child: Padding(
        padding: EdgeInsets.only(left: index == 0 ? 0 : 14),
        child: Obx(() {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: index == con.selectedTabIndex.value ? black : null,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                  child: UText(
                title: con.tabTitleList[index],
                textColor: index == con.selectedTabIndex.value ? white : null,
              )),
            ),
          );
        }),
      ),
    );
  }
}
