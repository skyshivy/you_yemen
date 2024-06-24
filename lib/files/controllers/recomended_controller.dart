import 'dart:math';

//import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:you_yemen/files/api_calls/setting_api.dart';
import 'package:you_yemen/files/api_self_care/get_recommendation_songs_api.dart';

import 'package:you_yemen/files/models/home_feature_category.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

class RecomendedController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  RxList<String> tabTitleList = <String>[].obs;
  RxList<String> tabValueList = <String>[].obs;
  RxList<String> tabIdList = <String>[].obs;
  RxBool isLoadingTab = false.obs;
  RxBool isLoading = false.obs;
  List<List<TuneInfo>> _recoList = [[]];
  RxList<TuneInfo> displayList = <TuneInfo>[].obs;
  @override
  void onInit() {
    super.onInit();
    _createTabList();
  }

  _createTabList() async {
    isLoadingTab.value = true;
    if (StoreManager().appSetting == null) {
      bool status = await scGetAppSetting();
      if (!status) {
        isLoadingTab.value = false;
        return;
      }
    }
    tabTitleList.clear();
    tabIdList.clear();
    tabValueList.clear();
    String? featureCats = StoreManager().isEnglish
        ? StoreManager().appSetting?.featuredCatEnglish?.attribute
        : StoreManager().appSetting?.featuredCatArabic?.attribute;
    if (featureCats?.isNotEmpty ?? true) {
      List<String> pipeSeparatedList = featureCats!.split("|");
      List<String> lst1 = [];
      List<String> lst2 = [];
      List<String> lst3 = [];
      for (var element in pipeSeparatedList) {
        _recoList.add([]);
        try {
          lst1.add(element.split(',')[0]);
        } catch (e) {}
        try {
          lst2.add(element.split(',')[1]);
        } catch (e) {}
        try {
          lst3.add(element.split(',')[2]);
        } catch (e) {}
      }
      tabTitleList.value = lst1;
      tabValueList.value = lst2;
      tabIdList.value = lst3;
      isLoadingTab.value = false;
    }
    getRecomendedItems(tabValueList[0]);
  }

  updateTabIndex(int index) {
    selectedTabIndex.value = index;
    getRecomendedItems(tabValueList[index]);
  }

  getRecomendedItems(String id) async {
    print("Items are ${_recoList[selectedTabIndex.value].length}");
    if (_recoList[selectedTabIndex.value].isNotEmpty) {
      //isLoading.value = true;
      //await Future.delayed(Duration(milliseconds: 200));
      displayList.value = _recoList[selectedTabIndex.value];
      print("Item name is ${_recoList[selectedTabIndex.value][0].toneName}");
      isLoading.value = false;
      return;
    }
    isLoading.value = true;
    HomeFeatureModel model = await scGetRecommendationSongApi(id);

    if (_recoList[selectedTabIndex.value].isEmpty) {
      _recoList[selectedTabIndex.value] =
          model.responseMap?.recommendationList ?? [];
      displayList.value = _recoList[selectedTabIndex.value];
    } else {
      displayList.value = _recoList[selectedTabIndex.value];
    }
    // Random random = Random();
    // int randomNumber = random.nextInt(1000000000);
    // var trailUrl =
    //     "language=${StoreManager().language}&msisdn=${StoreManager().msisdn}&clientTxnId=$randomNumber&identifier=$id";
    // Map<String, dynamic> map = await NetworkManager().get(recomurl + trailUrl);
    // HomeFeatureModel model = HomeFeatureModel.fromJson(map);
    // if (model.respCode == 'SC0000') {
    //   if (_recoList[selectedTabIndex.value].isEmpty) {
    //     _recoList[selectedTabIndex.value] =
    //         model.responseMap?.recommendationList ?? [];
    //     displayList.value = _recoList[selectedTabIndex.value];
    //   } else {
    //     displayList.value = _recoList[selectedTabIndex.value];
    //   }
    // }
    isLoading.value = false;
  }
}
