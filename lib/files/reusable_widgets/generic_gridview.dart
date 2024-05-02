import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
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
  });

  final Widget? child;
  final int? maxDisplay;
  final RxList<TuneInfo> list;
  final bool isLoadingMore;
  final Function()? onTap;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final String emptyListMessage = emptyToneListStr;
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Obx(() {
            return (widget.maxDisplay != null)
                ? wrapBuilder()
                : (widget.list.length < 20)
                    ? widget.list.isEmpty
                        ? UText(
                            title: widget.emptyListMessage,
                            enfontName: FontName.helveticaBold,
                          )
                        : wrapBuilder()
                    : gridBuilder();
          }),
        ),
      ],
    );
  }

  Widget wrapBuilder() {
    return _alignedGridView(
        widget.maxDisplay ?? widget.list.length,
        (index) =>
            widget.child ??
            (widget.list.isEmpty
                ? SizedBox()
                : TuneCard(info: widget.list[index])));
  }

  Widget gridBuilder() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            physics: widget.physics,
            padding: const EdgeInsets.all(12),
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

Widget _alignedGridView(int count, Widget Function(int index) cell) {
  const double runSpacing = 20;
  const double spacing = 20;

  return ListView(
    padding: EdgeInsets.all(20),
    shrinkWrap: true,
    children: [
      Wrap(
        runSpacing: runSpacing,
        spacing: spacing,
        alignment: WrapAlignment.center,
        children: List.generate(count, (index) {
          return SizedBox(height: 300, width: 250, child: cell(index));
        }),
      ),
    ],
  );
}
