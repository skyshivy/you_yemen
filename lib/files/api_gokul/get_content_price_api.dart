import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

getContentPriceApi() async {
  //
  String getContentPriceUrl = scGetContentPriceUrl;
      //"http://10.0.14.4:8082/selfcare/subscriber-management/get-content-price";
      //"${selfcareBaseUrl}subscriber-management/get-content";
     //"http://10.0.10.33:8088/selfcare/subscriber-management/get-content";
      

  Map<String, dynamic> jsonMap = {
    // "transactionId": getTransactionId(),
    // "featureId": '1',
    // "channelId": channelId,
    // "languageCode": StoreManager().languageCode,
    // 'msisdn': '9408000131'//StoreManager().msisdn,
    "transactionId":"983905085",
    "featureId":"1",
    "channelId":"4",
    "languageCode":"0",
    "msisdn":"8182000001",
  };

  
  Map<String,dynamic> respJson=
      await NetworkManager().post(getContentPriceUrl, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
