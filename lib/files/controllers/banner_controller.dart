import 'package:get/get.dart';

import 'package:you_yemen/files/api_self_care/get_banner_details_api.dart';
import 'package:you_yemen/files/api_self_care/get_banner_list_api.dart';
import 'package:you_yemen/files/models/banner_detail_model.dart';
import 'package:you_yemen/files/models/home_banner_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

class BannerController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingDetail = false.obs;
  RxInt selectedIndex = 0.obs;
  RxList<BannerList> banners = <BannerList>[].obs;
  RxList<TuneInfo> tuneList = <TuneInfo>[].obs;
  @override
  void onInit() {
    super.onInit();
    getBanners();
  }

  getBanners() async {
    isLoading.value = true;
    HomeBannerModel model = await scGetBannerlistApi();
    banners.value = model.responseMap?.bannerList ?? [];
    print("Banner list = ${banners.length}");
    isLoading.value = false;
  }

  getBannerDetail(String key, String type) async {
    if (isLoadingDetail.value) {
      return;
    }
    isLoadingDetail.value = true;
    BannerDetailModel model = await scGetBannerDetailsApi(key);

    tuneList.value = model.responseMap?.bannerDetails ?? [];
    isLoadingDetail.value = false;
  }

  updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
