import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_yemen/files/common/search_tune_text_field.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
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
              totalCount: cont.totalCount,
              cardBuilder: cont.searchType == SearchType.artist
                  ? (p0) {
                      return UText(title: "Artist Search");
                    }
                  : null,
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
                          top: 140, left: 12, right: 12, bottom: 20),
                      list: cont.toneList,
                      isLoadingMore: cont.isLoadingMore.value,
                      totalCount: 60,
                      // loadMore: () {
                      //   cont.loadingMoreData();
                      // },
                      pageNo: (p0) {
                        print("Page number tapped");
                      },
                    );
            }),
          ),
          Container(
              height: 140,
              color: black,
              child: searchTuneTextField(context, TextEditingController()))
        ],
      ),
    );
  }
}
