import 'package:you_yemen/files/models/tell_friend_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<TellFreindModel> tellFriendApi(
    TuneInfo info, String bParty, String packName) async {
  String url = tellFriendUrl;

  Map<String, dynamic> map1 = {
    "msisdn": bParty,
    "customerContent": "customerContent_temp",
    "packName": packName,
    "languageId": StoreManager().languageCode,
    "toneId": info.toneId ?? '',
  };

  // Map<String, dynamic> body = {
  //   'aPartyMsisdn': StoreManager().msisdn,
  //   'toneId': info.toneId,
  //   'toneName': info.toneName,
  //   'packName': packName,
  //   'language': StoreManager().languageCode,
  //   'customerContent': 'customerContent_temp',
  //   'msisdnList': [map1],
  // };

  Map<String, dynamic> body = {
    'aPartyMsisdn': StoreManager().msisdn,
    'toneId': info.toneId,
    'toneName': info.toneName,
    'packName': packName,
    'language': StoreManager().languageCode,
    'customerContent': 'customerContent_temp',
    'msisdnList': [map1],
  };

  var parts = [];
  body.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value.toString())}');
  });
  var formData = parts.join('&');
  Map<String, dynamic> map = await NetworkManager().post(url, formData);
  TellFreindModel model = TellFreindModel.fromJson(map);
  print("referd to friend is ");
  return model;
}
