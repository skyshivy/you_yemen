import 'package:flutter/cupertino.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';


  Future<Map<String, dynamic>> fetchCategories() async {
    try {
      final url = 'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?language=English';
      final response = await NetworkManager().get(url);
      if (response.containsKey('statusCode') && response['statusCode'] == 200) {
        return response['responseMap'];
      } else {
        throw 'Failed to fetch data: ${response['statusCode']}';
      }
    } catch (error) {
      throw 'Error fetching data: $error';
    }
  }
  


// Future<void> fetchImagesAndTexts() async {
//     try {
//       final url = 'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?language=English';
//       final response = await NetworkManager().get(url);

//       if (response.containsKey('statusCode') && response['statusCode'] == 200) {
//         final List<dynamic> categories = response['responseMap']['categories'];
//         setState(() {
//   imagePaths = categories.map<String>((category) => category['menuImagePath']).toList();
//   texts = categories.map<String>((category) => category['categoryName']).toList();
//   print('Fetched Image Paths: $imagePaths');
//   print('Fetched Texts: $texts');
// });

//       } else {
//         print('Failed to fetch images or texts. Response: $response');
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
// }}