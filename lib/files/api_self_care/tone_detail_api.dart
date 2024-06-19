import 'package:you_yemen/files/models/generic_model.dart';

import 'package:you_yemen/files/network_manager/network_manager.dart';

import 'package:you_yemen/files/utility/urls.dart';

toneDetailApi() async {
  String url = sclistTonesUrl;
  deleteToneUrl;
  Map<String, dynamic> jsonMap = {
    "transactionId": "655652",
    "featureId": 1,
    "msisdn": "8182010000",
    "languageCode": "en",
    "channelId": 2,
    "offerCode": "CRBT_WEEKLY",
  };
  Map<String, dynamic> respJson =
      await NetworkManager().post(url, null, jsonData: jsonMap);

  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
