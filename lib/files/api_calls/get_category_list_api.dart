import 'package:you_yemen/files/models/category_list_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';

Future<CategoryListModel> getCategoryListApi() async {
  //"${scGetCategoryListUrl}languageCode=en&categoryValue=4";
  String url =
      "http://10.0.14.4:5892/selfcare/get-category-list?languageCode=en&categoryValue=4";
       Map<String, String> header = {"transId": "123456789"};
  Map<String, dynamic> map = await NetworkManager().get(url,params: header);
  CategoryListModel model = CategoryListModel.fromJson(map);
  return model;
}


