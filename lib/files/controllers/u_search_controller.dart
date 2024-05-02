import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/search_tone_api.dart';
import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

class USearchController extends GetxController {
  String searchedText = '';
  RxBool isloading = false.obs;
  RxList<TuneInfo> toneList = <TuneInfo>[].obs;
  updateSearchedText(String value) {
    searchedText = value;
  }

  searchText(String searchKey, {int pageNo = 0}) async {
    toneList.clear();
    isloading.value = true;
    SearchModel model = await searchToneApi(searchKey, pageNo: pageNo);
    isloading.value = false;
    if (model.statusCode == 'SC0000') {
      toneList.value = model.responseMap?.songList ?? [];
    }
  }
}
