import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:you_yemen/files/api_calls/get_category_detail_api.dart';
import 'package:you_yemen/files/api_calls/get_category_list_api.dart';
import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/models/category_list_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

class CategoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Category> categoryList = <Category>[].obs;
  RxList<TuneInfo> toneList = <TuneInfo>[].obs;
  @override
  void onInit() {
    super.onInit();
    getCategoryList();
  }

  getCategoryList() async {
    toneList.clear();
    print("Category list called");
    CategoryListModel model = await getCategoryListApi();

    if (model.statusCode == 'SC0000') {
      categoryList.value = model.responseMap?.categories ?? [];
    }
  }

  getCategoryDetail(String key, String catId, {int pageNo = 0}) async {
    isLoading.value = true;
    CategoryDetailModel model =
        await getCategoryDetailApi(key, catId, pageNo: pageNo);
    isLoading.value = false;
    if (model.statusCode == 'SC0000') {
      toneList.value = model.responseMap?.searchList ?? [];
    } else {}
  }
}
