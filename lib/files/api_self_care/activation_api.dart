//import 'dart:convert';

import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/buy_tune_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

import 'package:you_yemen/files/utility/urls.dart';

activationApi() async {
  String url = buyToneUrl;
  Map<String, dynamic> jsonMap = {
    "transactionId": getTransactionId(),
    "featureId": "1",
    "msisdn": StoreManager().msisdn,
    "offerCode": "offerCode",
    "contentId": "contentId",
    "contentType": "contentType",
    "languageCode": StoreManager().languageCode,
    "channelId": channelId,
    "userData": "userData"
  };
  Map<String, dynamic> respJson =
      await NetworkManager().post(url, null, jsonData: jsonMap);
  BuyTuneModel model = BuyTuneModel.fromJson(respJson);
  return model;
}
