import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/common/tell_friend_popup/buy_a_friend_popup.dart';
import 'package:you_yemen/files/controllers/wishlist_controller.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/tune_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final contt=Get.put(WishListController);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return cont.isLoading.value
          ? loadingIndicator(height: 200, radius: 20)
          // :GenericGridView(
          //     physics: const NeverScrollableScrollPhysics(),
          //     list: contt.displayList,
          //     maxDisplay: 6,
          //     child: TuneCard(
          //   info:widget.list[index],
          // );

          //   );
          :Container(child:Text('wishlist screen'));
    });
  }
}