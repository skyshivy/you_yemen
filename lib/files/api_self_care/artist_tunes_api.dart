import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<CategoryDetailModel> scArtistTunesApi(String artistKey,
    {int pageNo = 0}) async {
  String url = advanceTuneSearchUrl;

  // artistTunesUrl +
  //     "language=${StoreManager().language}&artistKey=$artistKey&sortBy=Order_By&alignBy=ASC&pageNo=$pageNo&searchLanguage=${StoreManager().language}&perPageCount=$pagePerCount";
  Map<String, dynamic> jsonResp = await NetworkManager().post(url,null);
  CategoryDetailModel model = CategoryDetailModel.fromJson(jsonResp);
  return model;
}
