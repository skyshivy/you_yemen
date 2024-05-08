import 'package:you_yemen/files/models/category_list_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<CategoryListModel> getCategoryListApi() async {
  String url = getCategoryUrl + "language=${StoreManager().language}";
  Map<String, dynamic> map = await NetworkManager().get(url);
  CategoryListModel model = CategoryListModel.fromJson(map);

  return model;
}

