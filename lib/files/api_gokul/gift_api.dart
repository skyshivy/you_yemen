import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/models/gift_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

giftApi() async {
  
  String giftTonePriceUrl = scGiftTonePriceUrl;
     //"${selfcareBaseUrl}subscriber-management/gift-tone";
  //"http://10.0.10.33:8088/selfcare/subscriber-management/gift-tone";
      
  Map<String, dynamic> jsonMap = {
    "transactionId": getTransactionId(),
    "featureId": '1',
    'msisdn': "325458667",//StoreManager().msisdn,
    'bmsisdn':"bmsisdn",
    'offerCode':"offerCode",
    'contentId':"contentId",
    'contentType':"contentId",
    "languageCode": StoreManager().languageCode,
    "channelId": channelId,
  };

  //await NetworkManager().post(giftTonePriceUrl, null, jsonData: jsonMap);
  Map<String, dynamic> respJson =
      await NetworkManager().post(giftTonePriceUrl, null, jsonData: jsonMap);
  GiftModel model = GiftModel.fromJson(respJson);
  return model;
}
