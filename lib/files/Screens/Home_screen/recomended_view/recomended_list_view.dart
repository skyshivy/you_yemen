import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/recomended_controller.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';

class RecomendedListView extends StatelessWidget {
  RecomendedListView({super.key});
  final RecomendedController cont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return cont.isLoading.value
          ? loadingIndicator(height: 200, radius: 20)
          : GenericGridView(
              physics: const NeverScrollableScrollPhysics(),
              list: cont.displayList,
              maxDisplay: 6,
              totalCount: 0,
            );
    });
  }
}
