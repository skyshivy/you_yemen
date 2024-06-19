import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/category_detail_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<CategoryDetailModel> scGetCategoryDetailApi(String searchKey, String id,
    {int pageNo = 0}) async {
  String url = scAdvanceSearchUrl;
  Map<String, dynamic> jsonData = {
    'transactionId': getTransactionId(),
    'channelId': channelId,
    'msisdn': StoreManager().msisdn,
    'sortBy': "OrderBy",
    'pageNo': pageNo,
    'perPageCount': pagePerCount,
    'filter': 'Content',
    'filterPref': 'begin',
    'locale': StoreManager().languageSort,
    'searchKey': [searchKey],
    'categoryId': [id],
  };
  Map<String, dynamic> jsonResp =
      await NetworkManager().post(url, null, jsonData: jsonData);
  CategoryDetailModel model = CategoryDetailModel.fromJson(jsonResp);
  return model;
}
