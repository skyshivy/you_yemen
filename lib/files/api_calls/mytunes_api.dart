import 'dart:convert';
import 'package:you_yemen/files/models/my_tunes_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<MyTunesModel> MyTunesScreenApi() async {

  final baseUrl = mytunesUrl;


  
  final msisdn = StoreManager().msisdn;

  if (msisdn == null || msisdn.isEmpty) {
    throw Exception("msisdn is null or empty");
  }

  Map<String, String> queryParameters = {
    "language": StoreManager().languageCode,
    "msisdn": StoreManager().msisdn,
    "startIndex": "0",
    "endIndex": "20",
    "rbtMode": "0",
  };

  final uri = Uri.parse(baseUrl).replace(queryParameters: queryParameters);

  await Future.delayed(Duration(seconds: 3));

  try {
    final response = await NetworkManager().get(uri.toString());
    if (response != null) {
      Map<String, dynamic> responseMap = jsonDecode(response as String);
      MyTunesModel modal = MyTunesModel.fromJson(responseMap);
      print("modal = ${modal.message}");
      return modal;
    } else {
      throw Exception("Response is null");
    }
  } catch (e) {
    print("Error: $e");
    throw e;
  }
}

Future<MyTunesModel> MyTunesScreenApi1() async {
  final baseUrl = mytunesUrl;
  final msisdn = StoreManager().msisdn;

  if (msisdn == null || msisdn.isEmpty) {
    throw Exception("msisdn is null or empty");
  }

  Map<String, String> queryParameters = {
    "language": StoreManager().languageCode,
    "msisdn": StoreManager().msisdn, // msisdn.toString(),

    "startIndex": "0",
    "endIndex": "20",
    "rbtMode": "400",
  };

  final uri = Uri.parse(baseUrl).replace(queryParameters: queryParameters);

  await Future.delayed(Duration(seconds: 3));

  try {
    final response = await NetworkManager().get(uri.toString());
    if (response != null) {
      Map<String, dynamic> responseMap = jsonDecode(response as String);
      MyTunesModel modal = MyTunesModel.fromJson(responseMap);
      print("modal = ${modal.message}");
      return modal;
    } else {
      throw Exception("Response is null");
    }
  } catch (e) {
    print("Error: $e");
    throw e;
  }
}
