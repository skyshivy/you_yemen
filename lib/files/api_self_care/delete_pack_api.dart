import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

import 'package:you_yemen/files/utility/urls.dart';

deletePackApi() async {
  String url = "http://10.0.10.33:9089/selfcare/setting-service/add-tone-to-shufflelist";
  Map<String, dynamic> jsonMap = {
  "transactionId": "84681012337",
  "featureId": 1,
  "msisdn": "92000001",
  "offerId": 10,
  "channelId": 2,
  "offerCode": "CRBT_MONTHLY_REC"
};
  Map<String, dynamic> respJson =
      await NetworkManager().post(url, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
