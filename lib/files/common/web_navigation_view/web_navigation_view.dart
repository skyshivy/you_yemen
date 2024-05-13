import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:you_yemen/files/common/web_navigation_view/widgets/faq_button.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/logo_widget.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/nav_login_button.dart';
import 'package:you_yemen/files/common/web_navigation_view/widgets/nav_tunez_button.dart';

import 'package:you_yemen/files/controllers/u_search_controller.dart';

import 'package:you_yemen/files/reusable_widgets/u_text_field/u_textfield.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class WebNavigationView extends StatelessWidget {
  WebNavigationView({super.key});
  final TextEditingController textEditingController = TextEditingController();
  
 
  
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: webNavHeight,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 4, color: shadowColor, spreadRadius: 2)
      ], color: white),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LogoWidget(),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        const SizedBox(width: 18),
                        navTunezButton(),
                        const SizedBox(width: 8),
                        faqButton(),
                      ],
                    ),
                  ),
                  Expanded(child: rightWidgets(context))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row rightWidgets(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(child: searchTextField(context)),
        const SizedBox(width: 12),
        navLoginButton(),
        const SizedBox(width: 12),
      ],
    );
  }

  SizedBox searchTextField(BuildContext context) {
    USearchController cont = Get.find();
    return SizedBox(
      width: 300,
      child: UTextField(
        hideSearchIcon: false,
        textEditingController: textEditingController,
        onChanged: (p0) {
          cont.updateSearchedText(p0);
        },
        onSubmitted: (p0) {
          cont.searchText(p0);
          context.goNamed(searchRoute, queryParameters: {"searchKey": p0});
        },
      ),
    );
  }
}




// class CategoryPopupListView extends StatelessWidget {
//   CategoryPopupListView({Key? key});

//   final CategoryController cont = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Flexible(
//           child: Container(
//             color: Colors.white,
//             height: 140,
//             child: Obx(() {
//               return ListView.builder(
//                 padding: EdgeInsets.all(2),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: cont.categoryList.length,
//                 itemBuilder: (context, index) {
//                   return _categoryCell(context, index);
//                 },
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _categoryCell(BuildContext context, int index) {
//     return InkWell(
//       onTap: () {
//         fetchCategoryData(cont.categoryList[index].categoryId as int, cont.categoryList[index].searchKey as String);
//         Navigator.of(context).pop();
//       },
//       child: Padding(
//         padding: EdgeInsets.only(left: index == 0 ? 0 : 2),
//         child: AspectRatio(
//           aspectRatio: 1,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(contanerCornerRadius / 2),
//               color: Colors.red,
//             ),
//             child: uImage(url: cont.categoryList[index].menuImagePath ?? ''),
//           ),
//         ),
//       ),
//     );
//   }
// }
