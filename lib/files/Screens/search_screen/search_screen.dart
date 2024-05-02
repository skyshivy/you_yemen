import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  USearchController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return cont.isloading.value
          ? loadingIndicator(radius: 18)
          : GenericGridView(list: cont.toneList);
    });
  }
}
