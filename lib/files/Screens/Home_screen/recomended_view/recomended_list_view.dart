import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:you_yemen/files/controllers/recomended_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class RecomendedListView extends StatelessWidget {
  RecomendedListView({super.key});
  final RecomendedController cont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return cont.isLoading.value
          ? loadingIndicator(height: 200, radius: 20)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GenericGridView(
                  physics: const NeverScrollableScrollPhysics(),
                  list: cont.displayList,
                  maxDisplay: 6,
                  totalCount: 0,
                ),
                cont.displayList.length <= 6
                    ? SizedBox()
                    : genericButton(
                        borderColor: grey,
                        fontName: FontName.helveticaBold,
                        width: 200,
                        btnColor: transparent,
                        title: seeAllStr,
                        onTap: () {
                          print("Total count ${cont.displayList.length}");
                          context.push(seeAllRoute, extra: cont.displayList);

                          //context.goNamed(seeAllStr,queryParameters: );
                        },
                      ),
              ],
            );
    });
  }
}
