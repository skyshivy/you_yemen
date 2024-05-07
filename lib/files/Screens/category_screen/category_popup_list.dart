import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';
import 'package:you_yemen/files/api_calls/catrgory_api.dart';
import 'package:you_yemen/files/models/category_list_model.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/controllers/category_controller.dart';
void showCategoryPopup(BuildContext context) {
  showPopover(
    context: context,
    radius: contanerCornerRadius / 2,
    bodyBuilder: (context) {
      return CategoryPopupListView();
    },
  );
}
////////////bhavya

class CategoryPopupListView extends StatelessWidget {
  CategoryPopupListView({super.key});
  final CategoryController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            color: white,
            height: 140,
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.all(2),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cont.categoryList.length,
                itemBuilder: (context, index) {
                  return _categoryCell(context, index);
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _categoryCell(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).goNamed(catDetailRoute, queryParameters: {
          'categoryId': cont.categoryList[index].categoryId ?? '',
          'categoryName': cont.categoryList[index].categoryName ?? ''
        });
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: EdgeInsets.only(left: index == 0 ? 0 : 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(contanerCornerRadius / 2),
              color: red,
            ),
            child: uImage(url: cont.categoryList[index].menuImagePath ?? ''),
            //width: 150,
          ),
        ),
      ),
    );
  }
}



