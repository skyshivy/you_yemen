import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/search_tone_api.dart';
import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

class USearchController extends GetxController {
  String searchedText = '';
  RxBool isloading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxList<TuneInfo> toneList = <TuneInfo>[].obs;
  updateSearchedText(String value) {
    searchedText = value;
  }

  searchText(String searchKey, {int pageNo = 0}) async {
    searchedText = searchKey;
    toneList.clear();
    isloading.value = true;
    SearchModel model = await advanceTuneSearchToneApi([searchKey], pageNo);
    isloading.value = false;
    if (model.statusCode == 'SC0000') {
      toneList.value =
          model.responseMap?.toneList ?? model.responseMap?.songList ?? [];
    }
    isloading.value = false;
  }

  loadingMoreData() async {
    if (isLoadingMore.value) {
      return;
    }
    print("testLoadingMore called");
    isLoadingMore.value = true;

    SearchModel model =
        await advanceTuneSearchToneApi([searchedText], toneList.length);

    if (model.statusCode == 'SC0000') {
      if (((model.responseMap?.toneList ?? model.responseMap?.songList ?? [])
          .isEmpty)) {
        return;
      }
      toneList.value +=
          model.responseMap?.toneList ?? model.responseMap?.songList ?? [];
    }
    isLoadingMore.value = false;
  }
}
