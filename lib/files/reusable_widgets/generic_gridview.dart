import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/tune_card.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_visibility.dart';
import 'package:you_yemen/files/translation/strings.dart';

class GenericGridView extends StatefulWidget {
  GenericGridView({
    Key? key,

    // super.key,
    this.child,
    this.onTap,
    required this.list,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.maxDisplay,
    this.loadMore,
    this.isLoadingMore = false,
    this.gridPadding,
  });

  final Widget? child;
  final int? maxDisplay;
  final RxList<TuneInfo> list;
  final bool isLoadingMore;
  final Function()? onTap;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final String emptyListMessage = emptyToneListStr;
  final EdgeInsetsGeometry? gridPadding;
  final Function()? loadMore;

  @override
  State<GenericGridView> createState() => _GenericGridViewState();
}

class _GenericGridViewState extends State<GenericGridView> {
  ScrollController _scroll1 = ScrollController();
  @override
  void initState() {
    _scroll1.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (_scroll1.position.pixels == _scroll1.position.maxScrollExtent) {
      if (widget.loadMore != null) {
        widget.loadMore!();
      }
    }
    if (_scroll1.position.pixels == _scroll1.position.minScrollExtent) {
      print("reached to top");
    }
  }

  @override
  void dispose() {
    _scroll1.removeListener(onScroll);
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
                            ? UText(
                                title: widget.emptyListMessage,
                                fontName: FontName.helveticaBold,
                              )
                            : wrapBuilder()
                        : gridBuilder()
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
              (index) =>
                  widget.child ??
                  (widget.list.isEmpty
                      ? SizedBox()
                      : TuneCard(info: widget.list[index])),
              widget.physics,
              si);
        });
      },
    );
  }

  Widget gridBuilder() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            physics: widget.physics,
            padding: widget.gridPadding ?? const EdgeInsets.all(12),
            itemCount: widget.maxDisplay ?? widget.list.length,
            scrollDirection: widget.scrollDirection,
            controller: _scroll1,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                maxCrossAxisExtent: 280,
                childAspectRatio: 0.9),
            itemBuilder: (context, index) {
              return widget.child ??
                  TuneCard(
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
    );
  }
}

Widget _alignedGridView(int count, Widget Function(int index) cell,
    ScrollPhysics? physics, SizingInformation si) {
  double runSpacing = si.isMobile ? 8 : 20;
  double spacing = si.isMobile ? 8 : 20;

  return ListView(
    physics: physics,
    padding:
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
      ),
    ],
  );
}
