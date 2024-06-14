import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<SearchModel> searchToneIdApi(String toneId, {int pageNo = 0}) async {
  Map<String, dynamic> jsonData = {
    "transactionId": getTransactionId(),
    "channelId": channelId,
    "msisdn": StoreManager().msisdn,
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "ToneId",
    "filterPref": "begin",
    "locale": "${StoreManager().languageSort}",
    "searchKey": [toneId],
  };
  Map<String, dynamic> jsonResp = await NetworkManager()
      .post(advanceTuneSearchUrl, null, jsonData: jsonData);
  SearchModel model = SearchModel.fromJson(jsonResp);
  return model;
}
