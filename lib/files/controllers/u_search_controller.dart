import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:you_yemen/files/api_calls/search_tone_api.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/translation/strings.dart';

class USearchController extends GetxController {
  String searchedText = '';
  RxBool isloading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxList<TuneInfo> toneList = <TuneInfo>[].obs;
  SearchType searchType = SearchType.tone;
  RxInt selectedIndex = 0.obs;
  RxList<String> searchTypeList = <String>[
    toneStr,
    toneCodeStr,
    artistStr,
    nameToneStr,
  ].obs;

  updateSearchedText(String value) {
    searchedText = value;
  }

  updateSearchType(int index) {
    selectedIndex.value = index;
    if (index == 0) {
      this.searchType = SearchType.tone;
    } else if (index == 1) {
      this.searchType = SearchType.toneId;
    } else if (index == 2) {
      this.searchType = SearchType.artist;
    } else if (index == 3) {
      this.searchType = SearchType.nameTone;
    } else {
      this.searchType = SearchType.tone;
    }
    this.searchType = searchType;
  }

  searchText(String searchKey, {int pageNo = 0}) async {
    if (isloading.value) {
      return;
    }
    searchedText = searchKey;
    toneList.clear();
    isloading.value = true;
    if (searchType == SearchType.tone) {
      await _searchTone();
    } else if (searchType == SearchType.toneId) {
      await _searchToneId();
    } else if (searchType == SearchType.artist) {
      await _searchArtist();
    } else if (searchType == SearchType.nameTone) {
      await _searchNameTone();
    } else {
      await _searchTone();
    }
    isloading.value = false;
  }

  Future<void> _searchTone() async {
    SearchModel model = await advanceTuneSearchToneApi([searchedText], 0);
    isloading.value = false;
    if (model.statusCode == 'SC0000') {
      toneList.value =
          model.responseMap?.toneList ?? model.responseMap?.songList ?? [];
    }
    return;
  }

  Future<void> _searchToneId() async {
    print("Search Tone id here");
    return;
  }

  Future<void> _searchArtist() async {
    print("Search Artist here");
    return;
  }

  Future<void> _searchNameTone() async {
    print("Search name tune here");
    return;
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
