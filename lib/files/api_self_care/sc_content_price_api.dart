import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/sc_model/sc_content_price_model.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<ScContentPriceModel> scContentPriceApi(String msisdn) async {
  Map<String, dynamic> jsonData = {
    "transactionId": getTransactionId(),
    'featureId': '1',
    "channelId": channelId,
    "languageCode": StoreManager().languageCode,
    'msisdn': msisdn
  };
  Map<String, dynamic> jsonResp = await NetworkManager()
      .post(scGetContentPriceUrl, null, jsonData: jsonData);
  ScContentPriceModel mo = ScContentPriceModel.fromJson(jsonResp);
  return mo;
}
