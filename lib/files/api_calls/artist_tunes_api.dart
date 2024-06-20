import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<CategoryDetailModel> artistTunesApi(String artistKey,
    {int pageNo = 0}) async {
  String url = artistTunesUrl +
      "language=${StoreManager().language}&artistKey=$artistKey&sortBy=Order_By&alignBy=ASC&pageNo=$pageNo&searchLanguage=${StoreManager().language}&perPageCount=$pagePerCount";
  Map<String, dynamic> jsonResp = await NetworkManager().get(url);
  CategoryDetailModel model = CategoryDetailModel.fromJson(jsonResp);
  return model;
}
