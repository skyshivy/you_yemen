import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:you_yemen/files/api_self_care/sc_search_artist_api.dart';
import 'package:you_yemen/files/api_self_care/sc_search_name_tone_api.dart';
import 'package:you_yemen/files/api_self_care/sc_search_tone_api.dart';
import 'package:you_yemen/files/api_self_care/sc_search_toneid_api.dart';

import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/app_setting_model.dart';
import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';

class USearchController extends GetxController {
  String searchedText = '';
  RxBool isloading = false.obs;
  RxBool hideSearchBar = false.obs;
  RxBool isLoadingMore = false.obs;
  RxString errorMessage = ''.obs;
  RxList<TuneInfo> toneList = <TuneInfo>[].obs;
  SearchType searchType = SearchType.tone;
  RxInt selectedIndex = 0.obs;
  int totalCount = 0;
  RxList<ArtistList> artistList = <ArtistList>[].obs;
  RxList<String> searchTypeList = <String>[
    toneStr,
    toneCodeStr,
    artistStr,
    nameToneStr,
  ].obs;

  updateSearchedText(String value) {
    searchedText = value;
    print("searchedText ======= ${searchedText}");
    toneList.clear();
    artistList.clear();
    if (value.isEmpty) {
      errorMessage.value = searchHintStr;
    }
  }

  updateSearchType(int index) {
    selectedIndex.value = index;
    toneList.clear();
    artistList.clear();
    errorMessage.value = searchHintStr;

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

  searchText(String searchKey, {String? type, int pageNo = 0}) async {
    if (searchKey.isEmpty) {
      return;
    }
    if (type != null) {
      //searchType = type;
      updateSearchType(int.parse(type));
    }
    if (isloading.value) {
      return;
    }
    searchedText = searchKey;
    toneList.clear();
    artistList.clear();
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
          model.responseMap?.toneList ?? model.responseMap?.toneList ?? [];
      if (toneList.isEmpty) {
        errorMessage.value = emptyToneListStr;
      } else {
        errorMessage.value = '';
      }
    }

    return;
  }

  Future<void> _searchToneId() async {
    print("Search Tone id here");
    SearchModel model = await searchToneIdApi(searchedText);
    toneList.value = model.responseMap?.toneList ?? [];
    if (toneList.isEmpty) {
      errorMessage.value = emptyToneListStr;
    } else {
      errorMessage.value = '';
    }
    return;
  }

  Future<void> _searchArtist() async {
    print("Search Artist here");
    SearchModel model = await scSearchArtistApi([searchedText]);
    await Future.delayed(Duration(seconds: 2));
    artistList.value = model.responseMap?.artistList ?? [];
    if (artistList.isEmpty) {
      errorMessage.value = emptyToneListStr;
    } else {
      errorMessage.value = '';
    }
    return;
  }

  Future<void> _searchNameTone() async {
    print("Search name tune here");
    AppSettingModel? others = StoreManager().appSetting;
    String catId = others?.nameTuneCategoryId?.attribute ?? '0';
    SearchModel model = await scSearchNameToneApi([searchedText], catId);
    toneList.value = model.responseMap?.toneList ?? [];
    if (toneList.isEmpty) {
      errorMessage.value = emptyToneListStr;
    } else {
      errorMessage.value = '';
    }
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
      if (((model.responseMap?.toneList ?? []).isEmpty)) {
        return;
      }
      toneList.value += model.responseMap?.toneList ?? [];
    }
    isLoadingMore.value = false;
  }
}
