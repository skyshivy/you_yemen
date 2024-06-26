import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/reusable_widgets/decorations/card_decoration.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget cardMoreButton() {
  return ResponsiveBuilder(
    builder: (context, si) {
      return InkWell(
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => _popoverListView(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.bottom,
            width: 130,
            arrowHeight: 8,
            radius: 4,
            arrowWidth: 20,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Container(
            height: 36,
            width: 36,
            decoration: cardDecoration(radius: 18),
            child: const Icon(Icons.more_horiz),
          ),
        ),
      );
    },
  );
}

Widget _popoverListView() {
  List<String> titleList = [wishlistStr];
  List<IconData> iconList = [Icons.bookmark];
  return ClipRRect(
    borderRadius: BorderRadius.circular(6),
    child: ListView.builder(
      padding: const EdgeInsets.all(1),
      shrinkWrap: true,
      itemCount: titleList.length,
      itemBuilder: (context, index) {
        return menuCardCell(context, index, iconList, titleList);
      },
    ),
  );
}

Widget menuCardCell(BuildContext context, int index, List<IconData> iconList,
    List<String> titleList) {
  return InkWell(
    onTap: () {
      print("Tapped");
      Navigator.of(context).pop();
    },
    child: Padding(
      padding: EdgeInsets.only(top: index == 0 ? 0 : 1),
      child: Container(
        height: 30,
        color: lightGrey,
        child: Row(
          children: [
            Icon(iconList[index], size: 18),
            UText(title: titleList[index])
          ],
        ),
      ),
    ),
  );
}
