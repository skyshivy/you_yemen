import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';

import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<SearchModel> scSearchNameToneApi(List<String> keys, String catId,
    {int pageNo = 0}) async {
  Map<String, dynamic> jsonData = {
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "Content",
    "filterPref": "begin",
    "locale": "en",
    "searchKey": keys,
    "categoryId": ["!$catId"]
  };

  Map<String, dynamic> jsonResp = await NetworkManager()
      .post(advanceTuneSearchUrl, null, jsonData: jsonData);
  SearchModel model = SearchModel.fromJson(jsonResp);
  return model;
}
