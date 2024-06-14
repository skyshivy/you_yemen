import 'package:you_yemen/files/common/transaction_id.dart';
//import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

listSettingsApi() async {
  String url = "http://10.0.14.4:8082/selfcare/subscriber-management/list-settings";
  // listSettingsUrl;
  Map<String, dynamic> jsonMap = {
    "transactionId":"64836535",
    "featureId":1,
    "msisdn" : "8182010000",
    "offerCode":"CRBT_WEEKLY",
    "languageCode":"en",
    "channelId":3,
    "serviceId":"ALLCALLER"
};
  await NetworkManager().post(url, null, jsonData: jsonMap);
  // GenericModel model = GenericModel.fromJson(respJson);
  // return model;
}
