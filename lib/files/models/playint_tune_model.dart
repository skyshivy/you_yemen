// To parse this JSON data, do
//
//     final playingTuneModel = playingTuneModelFromJson(jsonString);

import 'dart:convert';

PlayingTuneModel playingTuneModelFromJson(String str) =>
    PlayingTuneModel.fromJson(json.decode(str));

String playingTuneModelToJson(PlayingTuneModel data) =>
    json.encode(data.toJson());

class PlayingTuneModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  PlayingTuneModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory PlayingTuneModel.fromJson(Map<String, dynamic> json) =>
      PlayingTuneModel(
        responseMap: json["responseMap"] == null
            ? null
            : ResponseMap.fromJson(json["responseMap"]),
        message: json["message"],
        respTime: json["respTime"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "responseMap": responseMap?.toJson(),
        "message": message,
        "respTime": respTime,
        "statusCode": statusCode,
      };
}

class ResponseMap {
  List<PlayingToneList>? listToneApk;

  ResponseMap({
    this.listToneApk,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        listToneApk: json["listToneApk"] == null
            ? []
            : List<PlayingToneList>.from(
                json["listToneApk"]!.map((x) => PlayingToneList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listToneApk": listToneApk == null
            ? []
            : List<dynamic>.from(listToneApk!.map((x) => x.toJson())),
      };
}

class PlayingToneList {
  PackUserDetailsCrbt? packUserDetailsCrbt;
  String? serviceName;
  int? groupId;
  String? msisdnB;
  List<ToneDetail>? toneDetails;

  PlayingToneList({
    this.packUserDetailsCrbt,
    this.serviceName,
    this.groupId,
    this.msisdnB,
    this.toneDetails,
  });

  factory PlayingToneList.fromJson(Map<String, dynamic> json) =>
      PlayingToneList(
        packUserDetailsCrbt: json["packUserDetails_Crbt"] == null
            ? null
            : PackUserDetailsCrbt.fromJson(json["packUserDetails_Crbt"]),
        serviceName: json["serviceName"],
        groupId: json["groupId"],
        msisdnB: json["msisdnB"],
        toneDetails: json["toneDetails"] == null
            ? []
            : List<ToneDetail>.from(
                json["toneDetails"]!.map((x) => ToneDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "packUserDetails_Crbt": packUserDetailsCrbt?.toJson(),
        "serviceName": serviceName,
        "groupId": groupId,
        "msisdnB": msisdnB,
        "toneDetails": toneDetails == null
            ? []
            : List<dynamic>.from(toneDetails!.map((x) => x.toJson())),
      };
}

class PackUserDetailsCrbt {
  String? isShuffle;
  String? isSuspend;
  String? language;
  String? packExpiry;
  String? packName;
  String? serialNo;
  String? serviceType;

  PackUserDetailsCrbt({
    this.isShuffle,
    this.isSuspend,
    this.language,
    this.packExpiry,
    this.packName,
    this.serialNo,
    this.serviceType,
  });

  factory PackUserDetailsCrbt.fromJson(Map<String, dynamic> json) =>
      PackUserDetailsCrbt(
        isShuffle: json["isShuffle"],
        isSuspend: json["isSuspend"],
        language: json["language"],
        packExpiry: json["packExpiry"],
        packName: json["packName"],
        serialNo: json["serialNo"],
        serviceType: json["serviceType"],
      );

  Map<String, dynamic> toJson() => {
        "isShuffle": isShuffle,
        "isSuspend": isSuspend,
        "language": language,
        "packExpiry": packExpiry,
        "packName": packName,
        "serialNo": serialNo,
        "serviceType": serviceType,
      };
}

class ToneDetail {
  String? toneId;
  String? toneName;
  String? toneUrl;
  String? previewImageUrl;
  String? albumName;
  String? artistName;
  int? price;
  String? createdDate;
  String? isShuffle;
  String? status;
  String? endTime;
  String? startTime;
  String? endDayMonthly;
  String? endTimeMonthly;
  String? startDayMonthly;
  String? startTimeMonthly;
  String? endTimeWeekly;
  String? startTimeWeekly;
  String? weeklyDays;
  String? customiseEndDate;
  String? customiseEndTime;
  String? customiseStartDate;
  String? customiseStartTime;
  String? yearlyEndDay;
  String? yearlyEndMonth;
  String? yearlyEndTime;
  String? yearlyStartDay;
  String? yearlyStartMonth;
  String? yearlyStartTime;
  String? toneIdStreamingUrl;
  String? toneIdpreviewImageUrl;
  repeatType? type;
  String? typeStr;
  String? callerType;
  ToneDetail({
    this.toneId,
    this.toneName,
    this.toneUrl,
    this.previewImageUrl,
    this.albumName,
    this.artistName,
    this.price,
    this.createdDate,
    this.isShuffle,
    this.status,
    this.endTime,
    this.startTime,
    this.endDayMonthly,
    this.endTimeMonthly,
    this.startDayMonthly,
    this.startTimeMonthly,
    this.endTimeWeekly,
    this.startTimeWeekly,
    this.weeklyDays,
    this.customiseEndDate,
    this.customiseEndTime,
    this.customiseStartDate,
    this.customiseStartTime,
    this.yearlyEndDay,
    this.yearlyEndMonth,
    this.yearlyEndTime,
    this.yearlyStartDay,
    this.yearlyStartMonth,
    this.yearlyStartTime,
    this.toneIdStreamingUrl,
    this.toneIdpreviewImageUrl,
    this.type = repeatType.customTime,
    this.typeStr = '',
    this.callerType = '',
  });

  factory ToneDetail.fromJson(Map<String, dynamic> json) => ToneDetail(
        toneId: json["toneId"],
        toneName: json["toneName"],
        toneUrl: json["toneUrl"],
        previewImageUrl: json["previewImageUrl"],
        albumName: json["albumName"],
        artistName: json["artistName"],
        price: json["price"],
        createdDate: json["createdDate"],
        isShuffle: json["isShuffle"],
        status: json["status"],
        endTime: json["endTime"],
        startTime: json["startTime"],
        endDayMonthly: json["endDayMonthly"],
        endTimeMonthly: json["endTimeMonthly"],
        startDayMonthly: json["startDayMonthly"],
        startTimeMonthly: json["startTimeMonthly"],
        endTimeWeekly: json["endTimeWeekly"],
        startTimeWeekly: json["startTimeWeekly"],
        weeklyDays: json["weeklyDays"],
        customiseEndDate: json["customiseEndDate"],
        customiseEndTime: json["customiseEndTime"],
        customiseStartDate: json["customiseStartDate"],
        customiseStartTime: json["customiseStartTime"],
        yearlyEndDay: json["yearlyEndDay"],
        yearlyEndMonth: json["yearlyEndMonth"],
        yearlyEndTime: json["yearlyEndTime"],
        yearlyStartDay: json["yearlyStartDay"],
        yearlyStartMonth: json["yearlyStartMonth"],
        yearlyStartTime: json["yearlyStartTime"],
        toneIdStreamingUrl: json["toneIdStreamingUrl"],
        toneIdpreviewImageUrl: json["toneIdpreviewImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "toneId": toneId,
        "toneName": toneName,
        "toneUrl": toneUrl,
        "previewImageUrl": previewImageUrl,
        "albumName": albumName,
        "artistName": artistName,
        "price": price,
        "createdDate": createdDate,
        "isShuffle": isShuffle,
        "status": status,
        "endTime": endTime,
        "startTime": startTime,
        "endDayMonthly": endDayMonthly,
        "endTimeMonthly": endTimeMonthly,
        "startDayMonthly": startDayMonthly,
        "startTimeMonthly": startTimeMonthly,
        "endTimeWeekly": endTimeWeekly,
        "startTimeWeekly": startTimeWeekly,
        "weeklyDays": weeklyDays,
        "customiseEndDate": customiseEndDate,
        "customiseEndTime": customiseEndTime,
        "customiseStartDate": customiseStartDate,
        "customiseStartTime": customiseStartTime,
        "yearlyEndDay": yearlyEndDay,
        "yearlyEndMonth": yearlyEndMonth,
        "yearlyEndTime": yearlyEndTime,
        "yearlyStartDay": yearlyStartDay,
        "yearlyStartMonth": yearlyStartMonth,
        "yearlyStartTime": yearlyStartTime,
        "toneIdStreamingUrl": toneIdStreamingUrl,
        "toneIdpreviewImageUrl": toneIdpreviewImageUrl,
      };
}

enum repeatType {
  none,
  monthly,
  yearly,
  fullday,
  customTime,
}
