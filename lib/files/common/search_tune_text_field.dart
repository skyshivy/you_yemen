import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/controllers/u_search_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget searchTuneTextField(
    BuildContext context, TextEditingController textEditingController,
    {double? height}) {
  USearchController cont = Get.find();
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height ?? 40,
            width: 400,
            child: UTextField(
              hideSearchIcon: false,
              textEditingController: textEditingController,
              onChanged: (p0) {
                cont.updateSearchedText(p0);
              },
              onSubmitted: (p0) {
                cont.searchText(p0);
                context
                    .goNamed(searchRoute, queryParameters: {"searchKey": p0});
              },
            ),
          ),
          _searchTypeView(cont),
        ],
      ),
    ),
  );
}

Widget _searchTypeView(USearchController cont) {
  return Container(
    height: 50,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: cont.searchTypeList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return _searchTypeButton(cont.searchTypeList[index], index, cont);
      },
    ),
  );
}

Widget _searchTypeButton(String title, int index, USearchController cont) {
  return InkWell(
    onTap: () {
      cont.updateSearchType(index);
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return Icon(
              (index == cont.selectedIndex.value)
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: white,
              size: 20,
            );
          }),
          SizedBox(width: 2),
          Flexible(child: _titleWidget(title))
        ],
      ),
    ),
  );
}

Widget _titleWidget(String title) {
  return ResponsiveBuilder(
    builder: (context, si) {
      return Padding(
        padding: const EdgeInsets.only(top: 2),
        child: UText(
          title: title,
          fontSize: si.isMobile ? 12 : 14,
          fontName: si.isMobile ? FontName.acMuna : FontName.helvetica,
          textColor: white,
        ),
      );
    },
  );
}
