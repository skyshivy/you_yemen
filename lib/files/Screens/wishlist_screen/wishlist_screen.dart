import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/common/tell_friend_popup/buy_a_friend_popup.dart';
import 'package:you_yemen/files/controllers/wishlist_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/sc_wishlist_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/buy_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/card_more_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/card_more_button_wishlist.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/play_button.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/tune_card.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    super.key,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  WishListController contt = Get.put(WishListController());

  @override
  void initState() {
    contt.getWishListTones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return contt.isLoadingg.value
          ? loadingIndicator(height: 200, radius: 20)
          : contt.toneList.isEmpty
              ? Center(
                  child: UText(
                  title: emptyToneListStr,
                  fontName: FontName.helveticaBold,
                ))
              : Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: GridView.builder(
                    itemCount: contt.toneList.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      maxCrossAxisExtent: 280,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      Wishlist data = contt.toneList[index];

                      return wishlistCard(data, index);
                    },
                  ),
                );
    });
  }

  Container wishlistCard(Wishlist data, int index) {
    TuneInfo inf = TuneInfo(
      toneId: "${data.contentId ?? 0}",
      toneUrl: data.contentPath,
      toneIdStreamingUrl: data.contentPath,
    );
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: lightGrey //const Color.fromRGBO(224, 224, 224, 1),
              ),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Stack(
            alignment: Alignment.topRight,
            children: [
              uImage(
                url: data.previewImage.toString(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              cardMoreButtonWishlist(index, data),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UText(
                  title: StoreManager().isEnglish
                      ? data.albumL1.toString()
                      : data.albumL2.toString(),
                  fontName: FontName.helveticaBold,
                  maxLine: 1,
                ),
                UText(
                  title: StoreManager().isEnglish
                      ? data.artistL1.toString()
                      : data.artistL2.toString(), //data.artistL1.toString(),
                  textColor: grey,
                  maxLine: 1,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: playButton(inf, () => null),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: buyButton(TuneInfo(), () => null),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
