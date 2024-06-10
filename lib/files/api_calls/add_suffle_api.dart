import 'dart:math';

import 'package:you_yemen/files/models/my_tune_shuffle_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<TuneSettingModel> addToShuffleApi(String toneId) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);

  var jsonData = {
    'clientTxnId': '$randomNumber',
    'serviceId': '1',
    'aPartyMsisdn': StoreManager().msisdn,
    'channelId': channelId,
    'toneIdList': [
      {"toneId": toneId}
    ],
    'priority': '0',
    'activityId': '1',
    'language': StoreManager().languageCode,
  };
  var parts = [];
  jsonData.forEach((key, value) {
    parts.add('$key='
        '$value');
  });
  var formData = parts.join('&');
  Map<String, dynamic> jsonResp =
      await NetworkManager().post(addToShuffleUrl, formData);
  TuneSettingModel model = TuneSettingModel.fromJson(jsonResp);
  return model;
}
