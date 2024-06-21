//import 'package:get/get.dart';
import 'dart:convert';

import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/my_tune_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
//import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

getMyTuneListApi({int pageNo = 0}) async {
  String langId = StoreManager().languageCode;
  String msisdn = StoreManager().msisdn;
  Map<String, dynamic> jsonData = {
    "clientTxId": getTransactionId(),
    "languageCode": StoreManager().languageSort,
    "msisdn": StoreManager().msisdn,
    "channelId": channelId,
    "rbtMode": "400",
    "activityId": "4",
    "serviceId": "1"
  };
  String url = scMyTunesUrl;
  //'$scMyTunesUrl&language=$langId&msisdn=$msisdn&startIndex=$pageNo&endIndex=$pagePerCount';
  // Map<String, dynamic> map =
  //     await NetworkManager().post(url, null, jsonData: jsonData); //get(url);
  Map<String, dynamic> map = json.decode(jsn); //encode(jsn);
  MyTuneModel model = MyTuneModel.fromJson(map);
  return model;
}

String jsn =
    """{"listtones":[{"serviceName":"ORDINARYTONES","toneDetails":{"artist":"Bimbo","artist_Arabic":"Bimbo","createdDate":"21\/06\/2024","imagePath":"\/opt\/content_migration\/Indosat.PNG","isCopy":"T","isGift":"T","status":"A","toneId":"0605476","toneIdStreamingUrl":"http:\/\/nadaku.indosatooredoo.com\/streaming-server\/get-tone-path?fileId=\/PdMVS4381s=","toneIdpreviewImageUrl":"http:\/\/nadaku.indosatooredoo.com\/streaming-server\/get-preview-image?fileId=\/PdMVS4381s=","toneName":"Balada Minta-Minta","toneName_Arabic":"Balada Minta-Minta","tonePath":"\/cnt_repo02\/rl\/601\/530\/0\/0000\/0030\/074.wav"}}],"message":"SUCCESS","respCode":"0"}""";
