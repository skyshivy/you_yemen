import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:you_yemen/files/models/faq_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:http/http.dart' as http;

Future<FaqModal> getFaqDetailApi() async {
  
  final _faqsResponse=await http.get(Uri.parse('https://callertunez.mtn.co.za/callertunez/assets/FAQ.json'));
  print(_faqsResponse.body);
  final _bodyAsJson=jsonDecode(_faqsResponse.body) as Map<String, dynamic>; //converted to json as map. Here the key of map is string and and the value can be anything like dynamic
  print(_bodyAsJson);
  final _data=FaqModal.fromJson(_bodyAsJson); //converted json to class
  return _data;  
}


// Future<FaqModal> getFaqDetailApi(String question) async {
//     try {
//       final response = await http.get(
//         Uri.parse('https://callertunez.mtn.co.za/callertunez/assets/FAQ.json'),
//       );
//       if (response.statusCode == 200) {
//         final body = json.decode(response.body);
//         print('API response for question "$question": $body');
//         return FaqModal.fromJson(body);
//       } else {
//         print('Failed to fetch API data for question "$question"');
//         throw Exception('Failed to fetch API data');
//       }
//     } catch (e) {
//       print('Error fetching API data for question "$question": $e');
//       throw Exception('Error fetching API data');
//     }
//   }


