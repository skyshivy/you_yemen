import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:you_yemen/files/api_calls/wishlist_api.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/models/wishlist_modal.dart';

class WishlistController extends GetxController {
  RxList<TuneInfo> toneList = <TuneInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    getWishlistTunes();
  }

  getWishlistTunes() async {
    WishlistModal model = await wishlistDetailsApi();
    List<TuneInfo> lst = model.responseMap?.toneDetailsList ?? [];
    toneList.value = lst;
  }
}
