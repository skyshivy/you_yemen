import 'package:get/get.dart';
import 'package:you_yemen/files/api_gokul/delete_wishlist_api.dart';
import 'package:you_yemen/files/api_gokul/get_wishlist_api.dart';

import 'package:you_yemen/files/models/sc_wishlist_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

class WishListController extends GetxController{
  RxList<Wishlist> toneList=<Wishlist>[].obs;
 RxBool isLoadingg=false.obs;
  // @override 
  // void onInit(){
  //   super.onInit();
  //   //getWishListTones();
  // }

  getWishListTones() async {
    isLoadingg.value=true;
    await Future.delayed(Duration(seconds: 2));
    ScWishListModel model=await getWishlistApi();
     toneList.value=model.wishlist??[];
    //  List<TuneInfo> lst=model.responseMap?.toneDetailsList??[];
    //  toneList.value=lst;
    isLoadingg.value = false;
  }

  void deleteFromWishlist(Wishlist wishlist){
    deleteWishlistApi(wishlist);
  }

  void deleteWishlistItem(int index, Wishlist wishlist){
    toneList.remove(wishlist);
    //toneList.removeAt(index);
  }
  
}