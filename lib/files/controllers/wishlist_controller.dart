import 'package:get/get.dart';
import 'package:you_yemen/files/models/get_wish_list_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

class WishListController extends GetxController{
  RxList<TuneInfo> toneList=<TuneInfo>[].obs;
 final isLoadingg=true.obs;
  @override 
  void onInit(){
    super.onInit();
    getWishListTones();
  }

  getWishListTones() async {
    GetWishlistModel model=await GetWishlistModel();
    //  List<TuneInfo> lst=model.responseMap?.toneDetailsList??[];
    //  toneList.value=lst;
    isLoadingg.value = false;
  }

}