import 'package:you_yemen/files/models/search_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<SearchModel> searchToneApi(String searchKey, {int pageNo = 0}) async {
  String url = searchToneUrl +
      "language=${StoreManager().language}&sortBy=Order_By&perPageCount=$pagePerCount&searchLanguage=${StoreManager().language}&searchKey=$searchKey&pageNo=$pageNo";
  Map<String, dynamic> map = await NetworkManager().get(url,jsonData);
  SearchModel model = SearchModel.fromJson(map);
  return model;
}
