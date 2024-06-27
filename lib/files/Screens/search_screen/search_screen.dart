import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
    _controller.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (cont.searchType != SearchType.artist) {
      return;
    }
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      print("SKY reached bottom");
    }
    cont.hideSearchBar.value =
        _controller.position.userScrollDirection == ScrollDirection.reverse;
    if (_controller.position.userScrollDirection == ScrollDirection.forward) {
      print("SKY Scroll down ${cont.searchType}");
    } else {
      print("SKY Scroll UP ${cont.searchType}");
    }
    // print(
    //     " ========= ${widget.scrollController?.position.pixels} == \n ${widget.scrollController?.position.userScrollDirection} +++++++++\n ${widget.scrollController?.position.userScrollDirection} ");
    if (((_controller.position.pixels ?? 0)) ==
        _controller.position.minScrollExtent) {
      print("reached to top");
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isMobile ? forMobileWidget() : forWebWidget();
  }

  Widget forWebWidget() {
    return Obx(() {
      return cont.isloading.value
          ? loadingIndicator(radius: 18)
          : cont.searchType == SearchType.artist
              ? artistGrid()
              : gridView();
    });
  }

  Widget artistGrid({EdgeInsetsGeometry? gridPadding}) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Obx(() {
          return cont.errorMessage.isNotEmpty
              ? Center(
                  child: UText(
                  title: cont.errorMessage.value,
                  fontName: FontName.helveticaBold,
                ))
              : GridView.builder(
                  controller: _controller,
                  padding: gridPadding ?? const EdgeInsets.all(12),
                  shrinkWrap: true,
                  itemCount: cont.artistList.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: si.isMobile ? 6 : 20,
                      crossAxisSpacing: si.isMobile ? 6 : 20,
                      maxCrossAxisExtent: 280,
                      childAspectRatio: 0.9),
                  itemBuilder: (context, index) {
                    return ArtistCard(
                      artistName: cont.artistList[index].val ?? '',
                    );
                  },
                );
        });
      },
    );
  }

  Widget forMobileWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Obx(() {
              return cont.isloading.value
                  ? loadingIndicator(radius: 18)
                  : cont.searchType == SearchType.artist
                      ? artistGrid(
                          gridPadding: EdgeInsets.only(
                              top: 146, left: 6, right: 6, bottom: 20))
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
        loadMore: () {
          cont.loadingMoreData();
        },
      );
    });
  }
}
