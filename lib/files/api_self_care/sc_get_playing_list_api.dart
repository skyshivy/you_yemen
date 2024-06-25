//import 'package:get/get.dart';
import 'dart:convert';

import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/playint_tune_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
//import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<PlayingTuneModel> scGetPlayingListApi({int pageNo = 0}) async {
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
  await Future.delayed(Duration(seconds: 2));
  String url = scMyTunesUrl;
  //&language=$langId&msisdn=$msisdn&startIndex=$pageNo&endIndex=$pagePerCount';
  // Map<String, dynamic> map =
  //     await NetworkManager().post(url, null, jsonData: jsonData); //get(url);
  Map<String, dynamic> map = json.decode(_jsn);
  PlayingTuneModel model = PlayingTuneModel.fromJson(map);
  return model;
}

String _jsn = """{
    "listtones": [
        {
            "packDetails": {
                "isShuffle": "F",
                "isStatusRbtPack": "F",
                "isSuspend": "F",
                "languageId": "2",
                "packExpiry": "2021-01-05T00:00:00+05:30",
                "packName": "CRBT_MONTHLY",
                "serialNo": "0",
                "serviceType": "CRBT"
            },
            "serviceName": "PACK_DETAILS"
        },
        {
            "serviceName": "AllCaller",
            "toneDetails": {
                "album": "afafaga",
                "artist": "Maher Al Muaiqly",
                "createdDate": "14/02/2024",
                "customiseEndDate": "0",
                "customiseEndTime": "23:59:59",
                "customiseStartDate": "0",
                "customiseStartTime": "00:00:00",
                "endDayMonthly": "0",
                "endTime": "00:00:00",
                "endTimeMonthly": "23:59:59",
                "endTimeWeekly": "23:59:59",
                "isShuffle": "T",
                "startDayMonthly": "0",
                "startTime": "00:00:00",
                "startTimeMonthly": "00:00:00",
                "startTimeWeekly": "00:00:00",
                "status": "P",
                "toneId": "78826853",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=1U/o4z90mGPfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=1U/o4z90mGPfRp5KT5lW1Q==",
                "toneName": "Shiv Allahumma Eateq Reqabana",
                "weeklyDays": "0",
                "yearlyEndDay": "0",
                "yearlyEndMonth": "0",
                "yearlyEndTime": "23:59:59",
                "yearlyStartDay": "0",
                "yearlyStartMonth": "0",
                "yearlyStartTime": "00:00:00"
            }
        },
        {
            "serviceName": "SpecialCallerSetting",
            "msisdnB": "0592692824",
            "toneDetails": {
                "album": "afafaga",
                "artist": "Maher Al Muaiqly",
                "createdDate": "14/02/2024",
                "customiseEndDate": "0",
                "customiseEndTime": "23:59:59",
                "customiseStartDate": "0",
                "customiseStartTime": "00:00:00",
                "endDayMonthly": "0",
                "endTime": "00:00:00",
                "endTimeMonthly": "23:59:59",
                "endTimeWeekly": "23:59:59",
                "isShuffle": "T",
                "startDayMonthly": "0",
                "startTime": "00:00:00",
                "startTimeMonthly": "00:00:00",
                "startTimeWeekly": "00:00:00",
                "status": "P",
                "toneId": "78826853",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=1U/o4z90mGPfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=1U/o4z90mGPfRp5KT5lW1Q==",
                "toneName": "Kumar Allahumma Eateq Reqabana",
                "weeklyDays": "0",
                "yearlyEndDay": "0",
                "yearlyEndMonth": "0",
                "yearlyEndTime": "23:59:59",
                "yearlyStartDay": "0",
                "yearlyStartMonth": "0",
                "yearlyStartTime": "00:00:00"
            }
        },
        {
            "serviceName": "AllCaller",
            "toneDetails": {
                "album": "afafaga",
                "artist": "Maher Al Muaiqly",
                "createdDate": "13/02/2024",
                "customiseEndDate": "0",
                "customiseEndTime": "23:59:59",
                "customiseStartDate": "0",
                "customiseStartTime": "00:00:00",
                "endDayMonthly": "0",
                "endTime": "00:00:00",
                "endTimeMonthly": "23:59:59",
                "endTimeWeekly": "23:59:59",
                "isShuffle": "T",
                "startDayMonthly": "0",
                "startTime": "00:00:00",
                "startTimeMonthly": "00:00:00",
                "startTimeWeekly": "00:00:00",
                "status": "P",
                "toneId": "49838",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=mzQ8OrObNwM=",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=mzQ8OrObNwM=",
                "toneName": "Yadav Allahumma Eateq Reqabana",
                "weeklyDays": "0",
                "yearlyEndDay": "0",
                "yearlyEndMonth": "0",
                "yearlyEndTime": "23:59:59",
                "yearlyStartDay": "0",
                "yearlyStartMonth": "0",
                "yearlyStartTime": "00:00:00"
            }
        }
    ],
    "message": "SUCCESS",
    "respCode": "0"
}""";
