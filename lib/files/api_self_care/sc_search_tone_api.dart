import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/app_setting_model.dart';
import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<SearchModel> advanceTuneSearchToneApi(
    List<String> lst, int pageNo) async {
  if (StoreManager().appSetting == null) {
    await Future.delayed(const Duration(seconds: 2));
  }
  AppSettingModel? others = StoreManager().appSetting;
  String catId = others?.nameTuneCategoryId?.attribute ?? '0';

  List<String> idlst = ["!$catId"];
  var myPost = {
    "transactionId": getTransactionId(),
    "channelId": channelId,
    "msisdn": StoreManager().msisdn,
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "Content",
    "filterPref": "begin",
    "locale": StoreManager().isEnglish ? "en" : "my",
    "searchKey": lst,
    "categoryId": idlst,
  };

  Map<String, dynamic>? map =
      await NetworkManager().post(advanceTuneSearchUrl, null, jsonData: myPost);
  // String url = searchToneUrl +
  //     "language=${StoreManager().language}&sortBy=Order_By&perPageCount=$pagePerCount&searchLanguage=${StoreManager().language}&searchKey=$searchKey&pageNo=$pageNo";
  // Map<String, dynamic> map = await NetworkManager().get(url);
  SearchModel model = SearchModel.fromJson(map);
  return model;
}
