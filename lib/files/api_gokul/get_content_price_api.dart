import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/models/get_tune_price_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<TonePriceModel> getContentPriceApi(String toneId) async {
  //
  String getContentPriceUrl = scGetContentPriceUrl;

  Map<String, dynamic> jsonMap = {
    // "transactionId": getTransactionId(),
    // "featureId": "1",
    // "channelId": channelId,
    // "languageCode": StoreManager().languageCode,
    // "msisdn": StoreManager().msisdn,
    "clientTxId": getTransactionId(),
    "languageCode": StoreManager().languageSort,
    "serviceId": "1",
    "msisdn": StoreManager().msisdn,
    "toneId": toneId,
    "validationIdentifier": "3",
    "channelId": channelId
  };

  Map<String, dynamic> respJson =
      await NetworkManager().post(getContentPriceUrl, null, jsonData: jsonMap);
  TonePriceModel model = TonePriceModel.fromJson(respJson);
  return model;
}
