import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';


addTonefromWishlistApi() async {
  String url = "http://10.0.10.33:9089/selfcare/setting-service/add-tone-to-shufflelist";
 Map<String, dynamic> jsonMap = {
    "transactionId": "3457297",
    "featureId": 1,
    "msisdn": "8182020000",
    "channelId": 2,
    "contentIdlist": [
      {"contentId": "98000105"},
      {"contentId": "19"}
    ]
  };
 Map<String, dynamic> respJson =
  await NetworkManager().post(url, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}

