import 'dart:math';

import 'package:you_yemen/files/models/get_tune_price_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<TonePriceModel> getTonePriceApi(String msisdn, TuneInfo info) async {
  String url = getTonePriceUrl;
  print("123url used currently is $url");

  var parts = [];
  Random random = Random();
  int randomNumber = random.nextInt(1000000000);

  var body = {
    'clientTxnId': randomNumber.toString(),
    'language': StoreManager().languageCode,
    'serviceId': '1',
    'aPartyMsisdn': msisdn,
    'bPartyMsisdnList': '',
    'toneId': info.toneId,
    'validationIdentifier': '3',
    'channelId': channelId,
  };

  body.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value.toString())}');
  });
  var formData = parts.join('&');
  print("\nformed data is \n$formData\n");
  print("TonePriceModel1 ============");
  Map<String, dynamic> map = await NetworkManager().post(url, formData);
  TonePriceModel model = TonePriceModel.fromJson(map);

  print("TonePriceModel ============$model");
  return model;
}
