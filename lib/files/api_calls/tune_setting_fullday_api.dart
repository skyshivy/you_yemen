import 'dart:math';

import 'package:you_yemen/files/models/my_tune_shuffle_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<TuneSettingModel> fulldayApi(String days, String toneId) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);
  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "serviceId": "17",
    "activityId": "1",
    "timeType": "2",
    "weeklyDays": days,
    "weeklyStartTime": "00:00",
    "weeklyEndTime": "23:59",
  };
  return await _postApi(tuneSettingFulldayUrl, jsonData);
}

Future<TuneSettingModel> fulldayTimeBaseApi(
    String days, String toneId, String fromT, String toT) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);
  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "serviceId": "17",
    "activityId": "1",
    "timeType": "2",
    "weeklyDays": days,
    "weeklyStartTime": fromT,
    "weeklyEndTime": toT,
  };
  return await _postApi(tuneSettingFulldayUrl, jsonData);
}

Future<TuneSettingModel> fulldayRepeatBaseNoneApi(
    String toneId, String fromD, String toD, String fromT, String toT) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);
  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "serviceId": "17",
    "activityId": "1",
    "timeType": "7",
    "customizeStartDate": fromD,
    "customizeEndDate": toD,
    "customizeStartTime": fromT,
    "customizeEndTime": toT,
  };
  return await _postApi(tuneSettingFulldayUrl, jsonData);
}

Future<TuneSettingModel> fulldayRepeatBaseMonthlyApi(
    String toneId, String fromD, String toD, String fromT, String toT) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);
  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "serviceId": "17",
    "activityId": "1",
    "timeType": "3",
    "startDayMonthly": fromD,
    "endDayMonthly": toD,
    "monthlyStartTime": fromT,
    "monthlyEndTime": toT,
  };
  return await _postApi(tuneSettingFulldayUrl, jsonData);
}

Future<TuneSettingModel> fulldayRepeatBaseYearlyApi(
    String toneId, DateTime fromTD, DateTime toTD) async {
  String yearlyStartMonth = "${fromTD.month}".padLeft(2, "0");
  String yearlyEndMonth = "${toTD.month}".padLeft(2, "0");

  String yearlyStartDay = "${fromTD.day}".padLeft(2, "0");

  String yearlyEndDay = "${toTD.day}".padLeft(2, "0");
  String yearlyStartTime =
      "${"${fromTD.hour}".padLeft(2, "0")}:${"${fromTD.minute}".padLeft(2, "0")}";
  String yearlyEndTime =
      "${"${toTD.hour}".padLeft(2, "0")}:${"${toTD.minute}".padLeft(2, "0")}";

  Random random = Random();
  var randomNumber = random.nextInt(1000000000);
  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "serviceId": "17",
    "activityId": "1",
    "timeType": "4",
    "yearlyStartMonth": yearlyStartMonth, //02,
    "yearlyEndMonth": yearlyEndMonth,
    "yearlyStartDay": yearlyStartDay,
    "yearlyEndDay": yearlyEndDay,
    "yearlyStartTime": yearlyStartTime,
    "yearlyEndTime": yearlyEndTime,
  };
  return await _postApi(tuneSettingFulldayUrl, jsonData);
}

Future<TuneSettingModel> _postApi(
    String url, Map<String, dynamic> jsonData) async {
  var parts = [];
  jsonData.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');
  Map<String, dynamic> jsonResp = await NetworkManager().post(url, formData);
  TuneSettingModel model = TuneSettingModel.fromJson(jsonResp);
  return model;
}
