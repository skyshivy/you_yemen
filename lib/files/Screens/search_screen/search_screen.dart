import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/utility/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.isMobile = false});
  final bool isMobile;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  USearchController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return widget.isMobile ? forMobileWidget() : forWebWidget();
  }

  Widget forWebWidget() {
    return Obx(() {
      return cont.isloading.value
          ? loadingIndicator(radius: 18)
          : GenericGridView(
              list: cont.toneList,
              isLoadingMore: cont.isLoadingMore.value,
              loadMore: () {
                cont.loadingMoreData();
              },
            );
    });
  }

  Widget forMobileWidget() {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Expanded(
            child: Obx(() {
              return cont.isloading.value
                  ? loadingIndicator(radius: 18)
                  : GenericGridView(
                      gridPadding: EdgeInsets.only(
                          top: 60, left: 12, right: 12, bottom: 20),
                      list: cont.toneList,
                      isLoadingMore: cont.isLoadingMore.value,
                      loadMore: () {
                        cont.loadingMoreData();
                      },
                    );
            }),
          ),
          Container(
            color: white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: UTextField(
                textEditingController: TextEditingController(),
                onSubmitted: (p0) {
                  cont.searchText(p0);
                },
                onChanged: (p0) {
                  cont.updateSearchedText(p0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
