import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/tune_card.dart';

class GenericGridView extends StatelessWidget {
  const GenericGridView({
    Key? key,

    // super.key,
    this.child,
    this.onTap,
    required this.list,
    this.scroll,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.maxDisplay,
  });

  final Widget? child;
  final int? maxDisplay;
  final RxList<TuneInfo> list;
  final ScrollController? scroll;
  final Function()? onTap;
  final Axis scrollDirection;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Obx(() {
            return (maxDisplay != null) ? wrapBuilder() : gridBuilder();
          }),
        ),
      ],
    );
  }

  Widget wrapBuilder() {
    return _alignedGridView(
        maxDisplay ?? list.length,
        (index) =>
            child ?? (list.isEmpty ? SizedBox() : TuneCard(info: list[index])));
  }

  GridView gridBuilder() {
    return GridView.builder(
      physics: physics,
      padding: const EdgeInsets.all(12),
      itemCount: maxDisplay ?? list.length,
      scrollDirection: scrollDirection,
      controller: scroll,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 280,
          childAspectRatio: 0.9),
      itemBuilder: (context, index) {
        return child ??
            TuneCard(
              info: list[index],
            );
      },
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
