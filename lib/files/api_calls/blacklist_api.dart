
import 'dart:math';

import 'package:you_yemen/files/models/blacklist_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';

Future<ViewBlackListModel> viewBlackListApi() async {
  String url = "http://172.31.1.137:8089/security/Middleware/api/adapter/v1/crbt/view-black-list";
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);
  Map<String, dynamic> data = {
    "clientTxnId": "$randomNumber",
    "serviceId": "1",
    "activityId": "4",
    "aPartyMsisdn": StoreManager().msisdn,
    // "channelId": Constants.channelId,
    "rbtMode": "101",
  };

  var parts = [];
  data.forEach((key, value) {
    parts.add('${key}='
        '${value}');
  });
  var formData = parts.join('&');
  print("formed data is = ${formData}");
  Map<String, dynamic> respJson = await NetworkManager().post(url, formData);
  print("respJson ==  $respJson");
  ViewBlackListModel model = ViewBlackListModel.fromJson(respJson);
  return model;
}


