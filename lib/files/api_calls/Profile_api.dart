// import 'package:you_yemen/files/model/edit_modal.dart';
// import 'package:you_yemen/files/network_manager/network_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/get_category_detail_api.dart';
import 'package:you_yemen/files/api_calls/get_category_list_api.dart';
import 'package:you_yemen/files/model/profile_modal.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';

Future<Profilemodal> getProfileDetailsApi() async {
  await getCategoryListApi();

  

  final url =
      'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/get-profile-details';
  Map<String, dynamic> payload = {
    "clientTxnId": "528696036",
    "aPartyMsisdn": "9923964719",
    "identifier": "GetUserDetails",
    "language": StoreManager().language,
  };
  var parts = [];
  payload.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');

  await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> jsonMap = await NetworkManager().post(url, formData);

  Profilemodal modal = Profilemodal.fromJson(jsonMap);
  print("modal =${modal.message}");

  return modal;
}






// import 'dart:convert';

// import 'package:http/http.dart' as http;
// Future<void> _getProfileDetails() async {
//     const url = 'https://callertunez.mtn.co.za/security/Middleware/api/adapter/v1/crbt/get-profile-details';
//     const payload = {
//       "clientTxnId": "528696036",
//       "aPartyMsisdn": "0832120732",
//       "identifier": "GetUserDetails",
//       "language": "English",
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         body: jsonEncode(payload),
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//         // Process responseData and update UI accordingly
//         // For example:
//         final userName = responseData['responseMap']['getProfileDetails']['userName'];
//         final msisdn = responseData['responseMap']['getProfileDetails']['msisdn'];
//         print('User Name: $userName, MSISDN: $msisdn');
//       } else {
//         throw Exception('Failed to load profile details: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }


