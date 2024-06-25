import 'package:get/get.dart';
import 'package:you_yemen/files/api_self_care/artist_tunes_api.dart';

import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

class ArtistTunesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<TuneInfo> list = <TuneInfo>[].obs;
  getArtistTunes(String artistKey) async {
    if (isLoading.value) {
      return;
    }
    isLoading.value = true;
    CategoryDetailModel model = await scArtistTunesApi(artistKey);
    list.value = model.responseMap?.toneList ?? [];
    isLoading.value = false;
  }
}
