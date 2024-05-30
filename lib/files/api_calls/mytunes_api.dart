import 'dart:convert';
import 'package:you_yemen/files/models/my_tunes_model.dart';
import 'package:you_yemen/files/models/playing_tune_list_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<PlayingListModel> getPlayingListApi() async {
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

    PlayingListModel modal = PlayingListModel.fromJson(response);
    print("modal = ${modal.message}");
    return modal;
  } catch (e) {
    print("Error: $e");
    throw e;
  }
}

Future<MyTuneListModel> myTunesListApi() async {
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
    Map<String, dynamic> response = await NetworkManager().get(uri.toString());

    //Map<String, dynamic> responseMap = jsonDecode(response);
    MyTuneListModel modal = MyTuneListModel.fromJson(response);
    print("modal = ${modal.message}");
    return modal;
  } catch (e) {
    print("Error: $e");
    throw e;
  }
}
