import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:you_yemen/files/model/edit_modal.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';

bool isEditing = false;
List<bool> selectedItems = List<bool>.generate(7, (index) => false);











Future<Editmodal> editProfile() async {
  final url =
      'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/edit-profile';

  Map<String, dynamic> jsonData = {
    "clientTxnId": "773237680",
    "identifier": "UpdateUserName",
    "aPartyMsisdn": "0832120732",
    "servType": "UPDATE_USER_NAME",
    "language": "English",
    "name": "0832120732",
  };

  var parts = [];
  jsonData.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');
  await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> jsonMap = await NetworkManager().post(url, formData);
  Editmodal modal = Editmodal.fromJson(jsonMap);
  print("modal =${modal.message}");

  return modal;
}


Future<List<String>> fetchCategoryIds(String language) async {
  final apiUrl = 'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?language=$language';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final categoryList = jsonResponse['responseMap']['categories'] as List<dynamic>;
    final categoryIds = categoryList.map((category) => category['categoryId'].toString()).toList();
    return categoryIds;
  } else {
    throw Exception('Failed to fetch category IDs');
  }
}

Future<Editmodal> editProfileAfterSelecting(List<bool> selectedItems) async {
  final url = 'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/edit-profile';

  // Fetch the category IDs from the API
  final categoryIds = await fetchCategoryIds('English');

  // Create a list to store selected category IDs
  final List<String> selectedCategoryIds = [];

  // Iterate through selectedItems to find selected category IDs
  for (int i = 0; i < selectedItems.length; i++) {
    if (selectedItems[i]) {
      selectedCategoryIds.add(categoryIds[i]);
    }
  }

  // Use selected category IDs in the API request
  Map<String, dynamic> jsonData = {
    "clientTxnId": "886484139",
    "identifier": "UpdateCategories",
    "aPartyMsisdn": "9923964719",
    "servType": "UPDATE_CATAGORIES",
    "language": "English"
   // "categoryId": selectedCategoryIds.join(','),
  };


  var payload = '';
  jsonData.forEach((key, value) {
    if (payload.isNotEmpty) {
      payload += ',';
    }
    payload += '$key=$value';
  });

var parts = [];
  jsonData.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');

  final response = await http.post(Uri.parse(url), body: formData);

  if (response.statusCode == 200) {
    // Parse the response data
    final jsonMap = json.decode(response.body);
    final modal = Editmodal.fromJson(jsonMap);
    print("modal = ${modal.message}");
    return modal;
  } else {
    throw Exception('Failed to update profile');
  }
}



String getSelectedCategoryIds(List<bool> selectedItems) {
  List<int> selectedIndices = [];
  for (int i = 0; i < selectedItems.length; i++) {
    if (selectedItems[i]) {
      
      selectedIndices.add(i + 1);
    }
  }
  return selectedIndices.join(',');
}







// Future<Editmodal> editProfile() async {
//   final url =
//       'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/edit-profile';

//   Map<String, dynamic> jsonData = {
//     "clientTxnId": "773237680",
//     "identifier": "UpdateUserName",
//     "aPartyMsisdn": "0832120732",
//     "servType": "UPDATE_USER_NAME",
//     "language": "English",
//     "name": "0832120732",
//   };

//   var parts = [];
//   jsonData.forEach((key, value) {
//     parts.add('${Uri.encodeQueryComponent(key)}='
//         '${Uri.encodeQueryComponent(value)}');
//   });
//   var formData = parts.join('&');
//   await Future.delayed(Duration(seconds: 3));
//   Map<String, dynamic> jsonMap = await NetworkManager().post(url, formData);
//   Editmodal modal = Editmodal.fromJson(jsonMap);
//   print("modal =${modal.message}");

//   return modal;
// }

// Future<List<String>> fetchCategoryIds(String language) async {
//   final apiUrl =
//       'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?language=$language';
//   final response = await http.get(Uri.parse(apiUrl));

//   if (response.statusCode == 200) {
//     final jsonResponse = json.decode(response.body);
//     final categoryList = jsonResponse['responseMap']['categories'] as List<dynamic>;
//     final categoryIds = categoryList.map((category) => category['categoryId'].toString()).toList();
//     return categoryIds;
//   } else {
//     throw Exception('Failed to fetch category IDs');
//   }
// }

// Future<Editmodal> editProfileAfterSelecting(List<bool> selectedItems) async {
//   final url =
//       'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/edit-profile';

//   // Fetch the category IDs from the API
//   final categoryIds = await fetchCategoryIds('English');

//   // Create a list to store selected category IDs
//   final List<String> selectedCategoryIds = [];

//   // Iterate through selectedItems to find selected category IDs
//   for (int i = 0; i < selectedItems.length; i++) {
//     if (selectedItems[i]) {
//       selectedCategoryIds.add(categoryIds[i]);
//     }
//   }

//   // Use selected category IDs in the API request
//   String categoryIdString = selectedCategoryIds.join(','); // Join selected category IDs into a comma-separated string
//   Map<String, dynamic> jsonData = {
//     "clientTxnId": "886484139",
//     "identifier": "UpdateCategories",
//     "aPartyMsisdn": "0832120732",
//     "servType": "UPDATE_CATAGORIES",
//     "language": "English",
//     "categoryId": categoryIdString,
//   };

//   // Create the payload string
//   var formData = '';
//   jsonData.forEach((key, value) {
//     if (formData.isNotEmpty) {
//       formData += ',';
//     }
//     formData += '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value.toString())}';
//   });

//   // Make the POST request
//   final response = await http.post(Uri.parse(url), body: formData);

//   if (response.statusCode == 200) {
//     // Parse the response data
//     final jsonMap = json.decode(response.body);
//     final modal = Editmodal.fromJson(jsonMap);
//     print("modal = ${modal.message}");
//     return modal;
//   } else {
//     throw Exception('Failed to update profile');
//   }
// }

// String getSelectedCategoryIds(List<bool> selectedItems) {
//   List<int> selectedIndices = [];
//   for (int i = 0; i < selectedItems.length; i++) {
//     if (selectedItems[i]) {
//       selectedIndices.add(i + 1);
//     }
//   }
//   return selectedIndices.join(',');
// }





