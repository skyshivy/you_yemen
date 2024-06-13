import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/get_home_banner_api.dart';
import 'package:you_yemen/files/models/home_banner_model.dart';

class BannerController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt selectedIndex = 0.obs;
  RxList<HomeBanner> banners = <HomeBanner>[].obs;
  @override
  void onInit() {
    super.onInit();
    getBanners();
  }

  getBanners() async {
    isLoading.value = true;
    HomeBannerModel model = await getHomeBannerApi();
    banners.value = model.responseMap?.banners ?? [];
    isLoading.value = false;
  }

  updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
