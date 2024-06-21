//import 'package:get/get.dart';
import 'dart:convert';

import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/playint_tune_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
//import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<PlayingTuneModel> getPlayingListApi({int pageNo = 0}) async {
  String langId = StoreManager().languageCode;
  String msisdn = StoreManager().msisdn;

  Map<String, dynamic> jsonData = {
    "clientTxId": getTransactionId(),
    "languageCode": StoreManager().languageSort,
    "msisdn": StoreManager().msisdn,
    "channelId": channelId,
    "rbtMode": "0",
    "activityId": "4",
    "serviceId": "1"
  };

  String url = scMyTunesUrl;
  //&language=$langId&msisdn=$msisdn&startIndex=$pageNo&endIndex=$pagePerCount';
  // Map<String, dynamic> map =
  //     await NetworkManager().post(url, null, jsonData: jsonData); //get(url);
  Map<String, dynamic> map = json.decode(_jsn);
  PlayingTuneModel model = PlayingTuneModel.fromJson(map);
  return model;
}

String _jsn =
    """{"listtones":[{"packDetails":{"isShuffle":"T","isSuspend":"F","languageId":"1","packExpiry":"2024-07-05T13:13:24+07:00","packName":"CRBT","serialNo":"0","serviceType":"CRBT"},"serviceName":"PACK_DETAILS"},{"serviceName":"AllCaller","toneDetails":{"artist":"Bimbo","artist_Arabic":"Bimbo","createdDate":"21\/06\/2024","customiseEndDate":"0","customiseEndTime":"23:59:59","customiseStartDate":"0","customiseStartTime":"00:00:00","endDayMonthly":"0","endTime":"00:00:00","endTimeMonthly":"23:59:59","endTimeWeekly":"23:59:59","imagePath":"\/opt\/content_migration\/Indosat.PNG","isShuffle":"T","startDayMonthly":"0","startTime":"00:00:00","startTimeMonthly":"00:00:00","startTimeWeekly":"00:00:00","status":"A","toneId":"0605476","toneIdStreamingUrl":"http:\/\/nadaku.indosatooredoo.com\/streaming-server\/get-tone-path?fileId=\/PdMVS4381s=","toneIdpreviewImageUrl":"http:\/\/nadaku.indosatooredoo.com\/streaming-server\/get-preview-image?fileId=\/PdMVS4381s=","toneName":"Balada Minta-Minta","toneName_Arabic":"Balada Minta-Minta","tonePath":"\/cnt_repo02\/rl\/601\/530\/0\/0000\/0030\/074.wav","weeklyDays":"0","yearlyEndDay":"0","yearlyEndMonth":"0","yearlyEndTime":"23:59:59","yearlyStartDay":"0","yearlyStartMonth":"0","yearlyStartTime":"00:00:00"}}],"message":"SUCCESS","respCode":"0"}""";
