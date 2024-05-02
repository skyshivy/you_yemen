import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<CategoryDetailModel> getCategoryDetailApi(String key, String catId,
    {int pageNo = 0}) async {
  String url = getCategoryDetailUrl +
      "language=${StoreManager().language}&searchKey=$key&categoryId=$catId&sortBy=Order_By&alignBy=ASC&pageNo=$pageNo&searchLanguage=${StoreManager().language}&perPageCount=$pagePerCount";
  Map<String, dynamic> map = await NetworkManager().get(url);
  CategoryDetailModel model = CategoryDetailModel.fromJson(map);
  return model;
}
