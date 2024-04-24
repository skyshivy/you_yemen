import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/tune_card.dart';

class GenericGridView extends StatelessWidget {
  const GenericGridView({
    super.key,
    this.child,
    this.onTap,
    required this.list,
    this.scroll,
    this.scrollDirection = Axis.vertical,
  });
  final Widget? child;
  final List<TuneInfo> list;
  final ScrollController? scroll;
  final Function()? onTap;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: list.length < 20 ? wrapBuilder() : gridBuilder(),
        ),
      ],
    );
  }

  Widget wrapBuilder() {
    return _alignedGridView(list.length, (index) => child ?? const TuneCard());
  }

  GridView gridBuilder() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: list.length,
      scrollDirection: scrollDirection,
      controller: scroll,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 280,
          childAspectRatio: 0.9),
      itemBuilder: (context, index) {
        return child ?? const TuneCard();
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
