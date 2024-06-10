import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

subscriberValidationApi() async {
  //
  String getTonePriceUrl =
      "${selfcareBaseUrl}subscriber-management/get-content";

  Map<String, dynamic> jsomMap = {
    "transactionId": getTransactionId(),
    "featureId": '1',
    "channelId": channelId,
    "languageCode": StoreManager().languageCode,
    'msisdn': StoreManager().msisdn,
  };

  await NetworkManager().post(getTonePriceUrl, null, jsonData: jsomMap);
}
