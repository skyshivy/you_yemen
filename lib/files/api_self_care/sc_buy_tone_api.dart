//import 'dart:convert';

import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/buy_tune_model.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

import 'package:you_yemen/files/utility/urls.dart';

Future<GenericModel> scbuyTuneApi(String offerCode, String contentId) async {
  String url = scBuyToneUrl;
  Map<String, dynamic> jsonMap = {
    "transactionId": getTransactionId(),
    "featureId": "1",
    "msisdn": StoreManager().msisdn,
    "offerCode": offerCode,
    "contentId": contentId,
    "contentType": "1",
    "languageCode": StoreManager().languageCode,
    "channelId": channelId
    //"userData": "userData"
  };
  Map<String, dynamic> respJson =
      await NetworkManager().post(url, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
