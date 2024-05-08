import 'package:flutter/cupertino.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
List<String> imagePaths = [];
  List<String> texts = [];
  bool isEditing = false;
  List<bool> selectedItems = List<bool>.generate(7, (index) => false);

  

  // Future<void> fetchImagesAndTexts() async {
  //   try {
  //     final url = 'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?language=English';
  //     final response = await NetworkManager().get(url);

  //     if (response.containsKey('statusCode') && response['statusCode'] == 200) {
  //       final List<dynamic> categories = response['responseMap']['categories'];
  //       setState(() {
  //         imagePaths = categories.map<String>((category) => category['menuImagePath']).toList();
  //         texts = categories.map<String>((category) => category['categoryName']).toList();
  //         print('Fetched Image Paths: $imagePaths');
  //         print('Fetched Texts: $texts');
  //       });
  //     } else {
  //       print('Failed to fetch images or texts. Response: $response');
  //     }
  //   } catch (error) {
  //     print('Error fetching data: $error');
  //   }
  // }


