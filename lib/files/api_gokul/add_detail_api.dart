import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';

addDeatilApi() async {
  String url = " http://10.0.10.33:9089/selfcare/setting-service/add-tone-to-shufflelist";
 Map<String, dynamic> jsonMap = {
  "transactionId": "9234567822",
  "featureId": 1,
  "msisdn": "92000002",
  "contentId": "1157833",
  "channelId": 2 ,
  "offerCode":"CRBT_MONTHLY_REC"
};
 Map<String, dynamic> respJson =
  await NetworkManager().post(url, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}

