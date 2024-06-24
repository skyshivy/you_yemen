import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:you_yemen/files/common/search_tune_text_field.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/artist_card.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/utility/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.isMobile = false});
  final bool isMobile;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  USearchController cont = Get.find();
  final ScrollController _controller = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isMobile ? forMobileWidget() : forWebWidget();
  }

  Widget forWebWidget() {
    return Obx(() {
      return cont.isloading.value ? loadingIndicator(radius: 18) : gridView();
    });
  }

  Widget forMobileWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Obx(() {
              return cont.isloading.value
                  ? loadingIndicator(radius: 18)
                  : gridView(
                      gridPadding: EdgeInsets.only(
                          top: 146, left: 6, right: 6, bottom: 20));
            }),
          ),
          Obx(() {
            return uVisibility(
                Container(
                    height: 140,
                    color: black,
                    child: searchTuneTextField(context, textEditingController)),
                cont.hideSearchBar.value);
          })
        ],
      ),
    );
  }

  Widget gridView({EdgeInsetsGeometry? gridPadding}) {
    return Obx(() {
      return GenericGridView(
        userScrollDirection: (p0) {
          cont.hideSearchBar.value = (p0 == ScrollDirection.reverse);
          // if (p0 == ScrollDirection.forward) {
          // } else {
          //   cont.hideSearchBar.value = true;
          // }
          print("User scroll direction =$p0");
        },
        scrollController: _controller,
        emptyListMessage: cont.errorMessage.value,
        gridPadding: gridPadding,
        list: cont.toneList,
        isLoadingMore: cont.isLoadingMore.value,
        totalCount: cont.totalCount,
        cardBuilder: cont.searchType == SearchType.artist
            ? (p0) {
                return ArtistCard(info: p0);
              }
            : null,
        loadMore: () {
          cont.loadingMoreData();
        },
      );
    });
  }
}
