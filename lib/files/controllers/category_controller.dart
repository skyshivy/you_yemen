import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:you_yemen/files/api_calls/get_category_list_api.dart';

import 'package:you_yemen/files/api_self_care/category_detail_api.dart';
import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/models/category_list_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

class CategoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CategoryList> categoryList = <CategoryList>[].obs;
  RxList<TuneInfo> toneList = <TuneInfo>[].obs;
  RxBool isLoadingMore = false.obs;
  String searchedkey = '';
  String catId = '';
  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }

  getCategoryList() async {
    toneList.clear();
    print("Category list called");
    CategoryListModel model = await scGetCategoryListApi();

    if (model.respCode == 'SC0000') {
      categoryList.value = model.responseMap?.categoryList ?? [];
    }
  }

  getCategoryDetail(String key, String catId, {int pageNo = 0}) async {
    searchedkey = key;
    this.catId = catId;
    isLoading.value = true;

    CategoryDetailModel model = await scGetCategoryDetailApi(key, catId);

    isLoading.value = false;
    if (model.statusCode == 'SC0000') {
      toneList.value = model.responseMap?.toneList ?? [];
    } else {
      print("SKY error is ==== ${model.message}");
    }
  }

  loadingMoreData() async {
    if (isLoadingMore.value) {
      return;
    }
    print("testLoadingMore called");
    isLoadingMore.value = true;

    CategoryDetailModel model = await scGetCategoryDetailApi(searchedkey, catId,
        pageNo: toneList.length);

    if (model.statusCode == 'SC0000') {
      toneList.value += model.responseMap?.toneList ?? [];
    } else {}
    isLoadingMore.value = false;
  }
}
