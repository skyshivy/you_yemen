import 'dart:math';

import 'package:get/get.dart';
import 'package:you_yemen/files/models/my_tune_shuffle_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<TuneSettingModel> fulldayDedicatedApi(
    String toneId, String bParty, String packName, String days) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);

  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "bPartyMsisdn": bParty,
    "serviceId": "13",
    "activityId": "1",
    "packName": packName,
    "timeType": "2",
    "weeklyDays": days.isEmpty ? "0" : days,
    "weeklyStartTime": "00:00",
    "weeklyEndTime": "23:59",
  };
  return await _postApi(tuneSettingDedicatedUrl, jsonData);
}

Future<TuneSettingModel> fulldayTimeBaseDedicatedApi(
    String toneId,
    String bParty,
    String packName,
    String days,
    String fromT,
    String toT) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);

  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "bPartyMsisdn": bParty,
    "serviceId": "13",
    "activityId": "1",
    "packName": packName,
    "timeType": "2",
    "weeklyDays": days.isEmpty ? "0" : days,
    "weeklyStartTime": fromT,
    "weeklyEndTime": toT,
  };
  return await _postApi(tuneSettingDedicatedUrl, jsonData);
}

Future<TuneSettingModel> fulldayRepeatBaseNoneDedicatedApi(String toneId,
    String bParty, String packName, DateTime fromTD, DateTime toTD) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);

  String fm = "${fromTD.month}".padLeft(2, '0');
  String fd = "${fromTD.day}".padLeft(2, '0');

  String tm = "${toTD.month}".padLeft(2, '0');
  String td = "${toTD.day}".padLeft(2, '0');

  String fth = "${fromTD.hour}".padLeft(2, '0');
  String ftm = "${fromTD.minute}".padLeft(2, '0');

  String tth = "${toTD.hour}".padLeft(2, '0');
  String ttm = "${toTD.minute}".padLeft(2, '0');

  String customizeStartDate = "${fromTD.year}-$fm-$fd"; //": 2024-02-28
  String customizeEndDate = "${toTD.year}-$tm-$td"; //": 2024-02-29
  String customizeStartTime = "$fth:$ftm"; //": 10:03
  String customizeEndTime = "$tth:$ttm"; //": 11:27

  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "bPartyMsisdn": bParty,
    "serviceId": "13",
    "activityId": "1",
    "packName": packName,
    "timeType": "7",
    "customizeStartDate": customizeStartDate,
    "customizeEndDate": customizeEndDate,
    "customizeStartTime": customizeStartTime,
    "customizeEndTime": customizeEndTime
  };
  return await _postApi(tuneSettingDedicatedUrl, jsonData);
}

Future<TuneSettingModel> fulldayRepeatBaseMonthlyDedicatedApi(String toneId,
    String bParty, String packName, DateTime fromTD, DateTime toTD) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);

  String startDayMonthly = "${fromTD.day}".padLeft(2, '0'); //": 28
  String endDayMonthly = "${toTD.day}".padLeft(2, '0'); //": 29
  String monthlyStartTime =
      "${"${fromTD.hour}".padLeft(2, '0')}:${"${fromTD.minute}".padLeft(2, '0')}"; //": 10:04
  String monthlyEndTime =
      "${"${toTD.hour}".padLeft(2, '0')}:${"${toTD.minute}".padLeft(2, '0')}"; //": 19:27

  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "bPartyMsisdn": bParty,
    "serviceId": "13",
    "activityId": "1",
    "packName": packName,
    "timeType": "3",
    "startDayMonthly": startDayMonthly,
    "endDayMonthly": endDayMonthly,
    "monthlyStartTime": monthlyStartTime,
    "monthlyEndTime": monthlyEndTime,
  };
  return await _postApi(tuneSettingDedicatedUrl, jsonData);
}

Future<TuneSettingModel> fulldayRepeatBaseYearlyDedicatedApi(String toneId,
    String bParty, String packName, DateTime fromTD, DateTime toTD) async {
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);

  String yearlyStartMonth = "${fromTD.month}".padLeft(2, '0'); //": 02,
  String yearlyEndMonth = "${toTD.month}".padLeft(2, '0'); //": 02,
  String yearlyStartDay = "${fromTD.day}".padLeft(2, '0'); //": 28,
  String yearlyEndDay = "${toTD.day}".padLeft(2, '0'); //": 28,
  String yearlyStartTime =
      "${"${fromTD.hour}".padLeft(2, '0')}:${"${fromTD.minute}".padLeft(2, '0')}"; //": 13:05,
  // "${fromTD.hour}".padLeft(2, '0')
  //     ":""${fromTD.minute}".padLeft(2, '0'); //": 10:05,
  String yearlyEndTime =
      "${"${toTD.hour}".padLeft(2, '0')}:${"${toTD.minute}".padLeft(2, '0')}"; //": 13:05,

  Map<String, dynamic> jsonData = {
    "clientTxnId": '$randomNumber',
    "aPartyMsisdn": StoreManager().msisdn,
    "toneId": toneId,
    "language": StoreManager().languageCode,
    "priority": "0",
    "channelId": channelId,
    "bPartyMsisdn": bParty,
    "serviceId": "13",
    "activityId": "1",
    "packName": packName,
    "timeType": "4",
    "yearlyStartMonth": yearlyStartMonth,
    "yearlyEndMonth": yearlyEndMonth,
    "yearlyStartDay": yearlyStartDay,
    "yearlyEndDay": yearlyEndDay,
    "yearlyStartTime": yearlyStartTime,
    "yearlyEndTime": yearlyEndTime,
  };
  return await _postApi(tuneSettingDedicatedUrl, jsonData);
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
