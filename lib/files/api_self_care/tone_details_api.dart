
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';


tonedetailsApi() async {
  String url = " http://10.0.14.4:8082/selfcare/subscriber-management/list-settings";
  Map<String, dynamic> jsonMap = {
    "transactionId":"655652",
    "featureId" : 1,
    "msisdn" : "92326145",
    "languageCode":"br",
    "channelId":2
};
  Map<String, dynamic> respJson =
      await NetworkManager().post(url, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
