
// import 'package:you_yemen/files/models/generic_model.dart';
// import 'package:you_yemen/files/network_manager/network_manager.dart';


// resumeApi() async {
//   String url =" http://10.0.10.33:9089/selfcare/setting-service/resume";
//   Map<String, dynamic> jsonMap = {
//     "transactionId":"3422",
//     "featureId" : 1,
//     "msisdn" : "8182020000",
//     "channelId":2
// };
//   Map<String, dynamic> respJson =
//       await NetworkManager().post(url, null, jsonData: jsonMap);
//   GenericModel model = GenericModel.fromJson(respJson);
//   return model;
// }

import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';


resumeApi() async {
  String url =  "http://10.0.10.33:9089/selfcare/subscription/suspend";
 Map<String, dynamic> jsonMap = {
               "transactionId":"3422",
    "featureId" : 1,
    "msisdn" : "8182020000",
    "channelId":2
    };
  Map<String, dynamic> respJson=await NetworkManager().post(url, null, jsonData: jsonMap);
   GenericModel model = GenericModel.fromJson(respJson);
  return model;
  }

