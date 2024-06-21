import 'dart:math';

import 'package:you_yemen/files/models/buy_tune_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<BuyTuneModel> setToneApi(TuneInfo info, String packName) async {
  var parts = [];
  Random random = Random();
  int randomNumber = random.nextInt(1000000000);

  var body = {
    'msisdn': StoreManager().msisdn,
    'toneId': info.toneId,
    'toneName': info.toneName,
    'packName': packName,
    'languageCode': StoreManager().languageSort,
    'channelId': channelId,
    'clientTxId': randomNumber.toString(),
    "serviceId": "1",
    "priority": "0",
  };

  body.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value.toString())}');
  });
  var formData = parts.join('&');
  Map<String, dynamic> map =
      await NetworkManager().post(buyTuneUrl, null, jsonData: body);
  BuyTuneModel model = BuyTuneModel.fromJson(map);
  return model;
}
