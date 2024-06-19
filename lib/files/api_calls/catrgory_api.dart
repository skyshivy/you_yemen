//import 'dart:convert';

//import 'package:http/http.dart' as http;

//import 'package:http/http.dart' as http;
import 'package:you_yemen/files/models/category_list_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';

// class CategoryApi {
//   static const String baseURL =
//       'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?';

//   static Future<CategoryListModel> getCategoryList(String language) async {
//     final url = '$baseURL&language=$language';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       return CategoryListModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load category list');
//     }
//   }
// }

// Import your network manager package

class CategoryApi {
  static const String baseURL =
      'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?';

  static Future<CategoryListModel> getCategoryList(String language) async {
    final url = '$baseURL&language=$language';
    final response = await NetworkManager().get(url);

    if (response.containsKey('statusCode') && response['statusCode'] == 200) {
      return CategoryListModel.fromJson(response['responseMap']);
    } else {
      throw Exception('Failed to load category list');
    }
  }
}
