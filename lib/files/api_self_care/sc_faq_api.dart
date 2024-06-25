import 'dart:convert';

import 'package:you_yemen/files/models/faq_screen_model.dart';
import 'package:http/http.dart' as http;

Future<FaqModal> scGetFaqDetailApi() async {
  final _faqsResponse = await http.get(
      Uri.parse('https://callertunez.mtn.co.za/callertunez/assets/FAQ.json'));
  print(_faqsResponse.body);
  final _bodyAsJson = jsonDecode(_faqsResponse.body) as Map<String,
      dynamic>; //converted to json as map. Here the key of map is string and and the value can be anything like dynamic
  print(_bodyAsJson);
  final _data = FaqModal.fromJson(_bodyAsJson); //converted json to class
  return _data;
}
