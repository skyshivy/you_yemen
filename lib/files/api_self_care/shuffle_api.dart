// import 'package:you_yemen/files/common/transaction_id.dart';
// import 'package:you_yemen/files/models/generic_model.dart';
// import 'package:you_yemen/files/network_manager/network_manager.dart';
// import 'package:you_yemen/files/store_manager/store_manager.dart';
// import 'package:you_yemen/files/utility/constants.dart';
// import 'package:you_yemen/files/utility/urls.dart';


// shuffleApi() async {
//   String url =  "http://10.0.10.33:9089/selfcare/setting-service/shuffle";
//  Map<String, dynamic> jsonMap = {
//                 "transactionId": getTransactionId(),
//     "featureId": "1",
//     "msisdn": "8182020000",
//     "languageCode": "en",
//     "channelId": channelId,
//     "mode": 1
//     };
//   Map<String, dynamic> respJson=await NetworkManager().post(url, null, jsonData: jsonMap);
//    GenericModel model = GenericModel.fromJson(respJson);
//   return model;
//   }

