import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/category_controller.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';

class CategoryDetailScreen extends StatelessWidget {
  CategoryDetailScreen({super.key});
  final CategoryController cont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return cont.isLoading.value
          ? loadingIndicator(radius: 18)
          : GenericGridView(
              list: cont.toneList,
              isLoadingMore: cont.isLoadingMore.value,
              totalCount: 0,
              loadMore: () {
                cont.loadingMoreData();
              },
            );
    });
  }
}
