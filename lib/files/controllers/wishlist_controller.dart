import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/api_gokul/delete_wishlist_api.dart';
import 'package:you_yemen/files/api_gokul/get_wishlist_api.dart';
import 'package:you_yemen/files/models/generic_model.dart';

import 'package:you_yemen/files/models/sc_wishlist_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/custom_snack_bar.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';

class WishListController extends GetxController {
  RxList<Wishlist> toneList = <Wishlist>[].obs;
  RxBool isLoadingg = false.obs;
  // @override
  // void onInit(){
  //   super.onInit();
  //   //getWishListTones();
  // }

  getWishListTones() async {
    isLoadingg.value = true;
    await Future.delayed(Duration(milliseconds: 200));
    ScWishListModel model = await getWishlistApi();
    toneList.value = model.wishlist ?? [];
    //  List<TuneInfo> lst=model.responseMap?.toneDetailsList??[];
    //  toneList.value=lst;
    isLoadingg.value = false;
  }

  void deleteFromWishlist(Wishlist wishlist) async {
    GenericModel model = await deleteWishlistApi(wishlist);

    if (model.respCode == 0) {
      toneList.remove(wishlist);
    }
    String? name = StoreManager().isEnglish
        ? wishlist.contentNameL1
        : wishlist.contentNameL2;
    customSnackBar("${model.message ?? ''}");
  }
}
