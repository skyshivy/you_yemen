import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

resumeApi() async {
  String url = scresumeUrl;
  Map<String, dynamic> jsonMap = {
    "transactionId": "3422",
    "featureId": 1,
    "msisdn": "8182020000",
    "channelId": 2
  };
  Map<String, dynamic> respJson =
      await NetworkManager().post(url, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
