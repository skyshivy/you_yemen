import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/category_list_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<CategoryListModel> scGetCategoryListApi() async {
  //"${scGetCategoryListUrl}languageCode=en&categoryValue=4";

  String url =
  
      "${scGetCategoryListUrl}languageCode=${StoreManager().languageSort}&categoryValue=4";
  Map<String, String> header = {"transId": getTransactionId()};
  Map<String, dynamic> map = await NetworkManager().get(url, params: header);
  CategoryListModel model = CategoryListModel.fromJson(map);
  return model;
}
