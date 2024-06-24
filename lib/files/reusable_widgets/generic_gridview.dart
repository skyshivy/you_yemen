import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/number_pagination.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/tune_card.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';

class GenericGridView extends StatefulWidget {
  GenericGridView(
      {Key? key,

      // super.key,

      this.onTap,
      required this.list,
      this.scrollDirection = Axis.vertical,
      this.physics,
      this.maxDisplay,
      this.loadMore,
      this.isLoadingMore = false,
      this.gridPadding,
      this.pageNo,
      required this.totalCount,
      this.cardBuilder = null,
      this.scrollController,
      this.userScrollDirection,
      this.emptyListMessage = emptyToneListStr});

  final int? maxDisplay;
  final RxList<TuneInfo> list;
  final bool isLoadingMore;
  final Function()? onTap;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final String emptyListMessage;
  final EdgeInsetsGeometry? gridPadding;
  final Function()? loadMore;
  final Function(int)? pageNo;
  final Function(TuneInfo)? cardBuilder;
  final Function(ScrollDirection)? userScrollDirection;
  final int totalCount;
  final ScrollController? scrollController;

  @override
  State<GenericGridView> createState() => _GenericGridViewState();
}

class _GenericGridViewState extends State<GenericGridView> {
  //ScrollController _scroll1 = ScrollController();
  @override
  void initState() {
    widget.scrollController?.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (widget.scrollController?.position.pixels ==
        widget.scrollController?.position.maxScrollExtent) {
      if (widget.loadMore != null) {
        widget.loadMore!();
      }
    }
    if (widget.userScrollDirection != null) {
      if (widget.userScrollDirection != null) {
        widget.userScrollDirection!(
            widget.scrollController!.position.userScrollDirection);
      }
    }

    if (widget.scrollController?.position.userScrollDirection ==
        ScrollDirection.forward) {
      print("Scroll down");
    } else {
      print("Scroll UP");
    }
    // print(
    //     " ========= ${widget.scrollController?.position.pixels} == \n ${widget.scrollController?.position.userScrollDirection} +++++++++\n ${widget.scrollController?.position.userScrollDirection} ");
    if (((widget.scrollController?.position.pixels ?? 0)) ==
        widget.scrollController?.position.minScrollExtent) {
      print("reached to top");
    }
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(onScroll);
    print("scroll controller disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: (widget.maxDisplay != null)
                    ? wrapBuilder()
                    : (widget.list.length < 20)
                        ? widget.list.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: UText(
                                    title: widget.emptyListMessage,
                                    fontName: FontName.helveticaBold,
                                  ),
                                ),
                              )
                            : wrapBuilder()
                        : gridBuilder((p0) => widget.cardBuilder)
                // Obx(() {
                //   return
                // }),
                ),
          ],
        );
      },
    );
  }

  Widget wrapBuilder() {
    Rx<int> displayCellCount = 0.obs;
    displayCellCount.value = widget.maxDisplay ?? widget.list.length;
    return ResponsiveBuilder(
      builder: (context, si) {
        return Obx(() {
          return _alignedGridView(
              displayCellCount.value,
              widget.gridPadding,
              (index) => (widget.list.isEmpty
                  ? SizedBox()
                  : widget.cardBuilder != null
                      ? widget.cardBuilder!((widget.list[index]))
                      : TuneCard(info: widget.list[index])),
              widget.physics,
              si);
        });
      },
    );
  }

  Widget gridBuilder(Function(TuneInfo)? cardBuilder) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    physics: widget.physics,
                    padding: widget.gridPadding ?? const EdgeInsets.all(12),
                    itemCount: widget.maxDisplay ?? widget.list.length,
                    scrollDirection: widget.scrollDirection,
                    controller: widget.scrollController,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: si.isMobile ? 6 : 20,
                        crossAxisSpacing: si.isMobile ? 6 : 20,
                        maxCrossAxisExtent: 280,
                        childAspectRatio: 0.9),
                    itemBuilder: (context, index) {
                      return widget.cardBuilder != null
                          ? widget.cardBuilder!((widget.list[index]))
                          : TuneCard(
                              info: widget.list[index],
                            );
                    },
                  ),
                ),
                uVisibility(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loadingIndicator(radius: 16),
                  ),
                  !widget.isLoadingMore,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 14, right: 14),
              child: NumberPagination(
                totalItem: widget.totalCount,
                tappedIndex: (p0) {
                  if (widget.pageNo != null) {
                    widget.pageNo!(p0);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _alignedGridView(
    int count,
    EdgeInsetsGeometry? gridPadding,
    Widget Function(int index) cell,
    ScrollPhysics? physics,
    SizingInformation si) {
  double runSpacing = si.isMobile ? 8 : 20;
  double spacing = si.isMobile ? 8 : 20;
  ScrollController? controller;

  return ListView(
    controller: controller,
    physics: physics,
    padding: gridPadding ??
        EdgeInsets.symmetric(horizontal: si.isMobile ? 4 : 20, vertical: 20),
    shrinkWrap: true,
    children: [
      Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.center,
        children: List.generate(count, (index) {
          return SizedBox(
              height: si.isMobile ? 200 : 300,
              width: si.isMobile ? 180 : 250,
              child: cell(index));
        }),
      )
    ],
  );
}
