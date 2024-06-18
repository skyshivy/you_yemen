import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/banner_detail_api.dart';
import 'package:you_yemen/files/api_calls/get_home_banner_api.dart';
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
    HomeBannerModel model = await getHomeBannerApi();
    banners.value = model.bannerList ?? [];
    isLoading.value = false;
  }

  getBannerDetail(String key, String type) async {
    if (isLoadingDetail.value) {
      return;
    }
    isLoadingDetail.value = true;
    BannerDetailModel model = await bannerDetailApi(key, type);
    tuneList.value = model.responseMap?.searchList ?? [];
    isLoadingDetail.value = false;
  }

  updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
