import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/models/gift_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

giftApi() async {
  
  String giftTonePriceUrl =
      "${selfcareBaseUrl}subscriber-management/gift-tone";

  Map<String, dynamic> jsonMap = {
    "transactionId": getTransactionId(),
    "featureId": '1',
    'msisdn': StoreManager().msisdn,
    'bmsisdn':"bmsisdn",
    'offerCode':"offerCode",
    'contentId':"contentId",
    'contentType':"contentId",
    "languageCode": StoreManager().languageCode,
    "channelId": channelId,
  };

  await NetworkManager().post(giftTonePriceUrl, null, jsonData: jsonMap);
  Map<String, dynamic> respJson =
      await NetworkManager().post(giftTonePriceUrl, null, jsonData: jsonMap);
  GiftModel model = GiftModel.fromJson(respJson);
  return model;
}
