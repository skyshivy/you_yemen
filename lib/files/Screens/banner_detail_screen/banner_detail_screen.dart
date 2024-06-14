import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/banner_controller.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';

class BannerDetailScreen extends StatelessWidget {
  BannerDetailScreen({super.key});
  final BannerController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return cont.isLoadingDetail.value
            ? loadingIndicator(radius: 20)
            : GenericGridView(list: cont.tuneList, totalCount: 0);
      }),
    );
  }
}
