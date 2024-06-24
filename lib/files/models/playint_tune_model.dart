// To parse this JSON data, do
//
//     final playingTuneModel = playingTuneModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final playingTuneModel = playingTuneModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final playingTuneModel = playingTuneModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final playingTuneModel = playingTuneModelFromJson(jsonString);

import 'dart:convert';

PlayingTuneModel playingTuneModelFromJson(String str) =>
    PlayingTuneModel.fromJson(json.decode(str));

String playingTuneModelToJson(PlayingTuneModel data) =>
    json.encode(data.toJson());

class PlayingTuneModel {
  List<PlayingToneList>? playingToneList;
  String? message;
  String? respCode;

  PlayingTuneModel({
    this.playingToneList,
    this.message,
    this.respCode,
  });

  factory PlayingTuneModel.fromJson(Map<String, dynamic> json) =>
      PlayingTuneModel(
        playingToneList: json["listtones"] == null
            ? []
            : List<PlayingToneList>.from(
                json["listtones"]!.map((x) => PlayingToneList.fromJson(x))),
        message: json["message"],
        respCode: json["respCode"],
      );

  Map<String, dynamic> toJson() => {
        "listtones": playingToneList == null
            ? []
            : List<dynamic>.from(playingToneList!.map((x) => x.toJson())),
        "message": message,
        "respCode": respCode,
      };
}

class PlayingToneList {
  PackDetails? packDetails;
  String? serviceName;
  PlayingToneDetail? toneDetails;
  String? msisdnB;

  PlayingToneList({
    this.packDetails,
    this.serviceName,
    this.toneDetails,
    this.msisdnB,
  });

  factory PlayingToneList.fromJson(Map<String, dynamic> json) =>
      PlayingToneList(
        packDetails: json["packDetails"] == null
            ? null
            : PackDetails.fromJson(json["packDetails"]),
        serviceName: json["serviceName"],
        toneDetails: json["toneDetails"] == null
            ? null
            : PlayingToneDetail.fromJson(json["toneDetails"]),
        msisdnB: json["msisdnB"],
      );

  Map<String, dynamic> toJson() => {
        "packDetails": packDetails?.toJson(),
        "serviceName": serviceName,
        "toneDetails": toneDetails?.toJson(),
        "msisdnB": msisdnB,
      };
}

class PackDetails {
  String? isShuffle;
  String? isStatusRbtPack;
  String? isSuspend;
  String? languageId;
  String? packExpiry;
  String? packName;
  String? serialNo;
  String? serviceType;

  PackDetails({
    this.isShuffle,
    this.isStatusRbtPack,
    this.isSuspend,
    this.languageId,
    this.packExpiry,
    this.packName,
    this.serialNo,
    this.serviceType,
  });

  factory PackDetails.fromJson(Map<String, dynamic> json) => PackDetails(
        isShuffle: json["isShuffle"],
        isStatusRbtPack: json["isStatusRbtPack"],
        isSuspend: json["isSuspend"],
        languageId: json["languageId"],
        packExpiry: json["packExpiry"],
        packName: json["packName"],
        serialNo: json["serialNo"],
        serviceType: json["serviceType"],
      );

  Map<String, dynamic> toJson() => {
        "isShuffle": isShuffle,
        "isStatusRbtPack": isStatusRbtPack,
        "isSuspend": isSuspend,
        "languageId": languageId,
        "packExpiry": packExpiry,
        "packName": packName,
        "serialNo": serialNo,
        "serviceType": serviceType,
      };
}

/*
class ToneDetails {
  String? album;
  String? artist;
  String? createdDate;
  String? customiseEndDate;
  String? customiseEndTime;
  String? customiseStartDate;
  String? customiseStartTime;
  String? endDayMonthly;
  String? endTime;
  String? endTimeMonthly;
  String? endTimeWeekly;
  String? isShuffle;
  String? startDayMonthly;
  String? startTime;
  String? startTimeMonthly;
  String? startTimeWeekly;
  String? status;
  String? toneId;
  String? toneIdStreamingUrl;
  String? toneIdpreviewImageUrl;
  String? toneName;
  String? weeklyDays;
  String? yearlyEndDay;
  String? yearlyEndMonth;
  String? yearlyEndTime;
  String? yearlyStartDay;
  String? yearlyStartMonth;
  String? yearlyStartTime;

  ToneDetails({
    this.album,
    this.artist,
    this.createdDate,
    this.customiseEndDate,
    this.customiseEndTime,
    this.customiseStartDate,
    this.customiseStartTime,
    this.endDayMonthly,
    this.endTime,
    this.endTimeMonthly,
    this.endTimeWeekly,
    this.isShuffle,
    this.startDayMonthly,
    this.startTime,
    this.startTimeMonthly,
    this.startTimeWeekly,
    this.status,
    this.toneId,
    this.toneIdStreamingUrl,
    this.toneIdpreviewImageUrl,
    this.toneName,
    this.weeklyDays,
    this.yearlyEndDay,
    this.yearlyEndMonth,
    this.yearlyEndTime,
    this.yearlyStartDay,
    this.yearlyStartMonth,
    this.yearlyStartTime,
  });

  factory ToneDetails.fromJson(Map<String, dynamic> json) => ToneDetails(
        album: json["album"],
        artist: json["artist"],
        createdDate: json["createdDate"],
        customiseEndDate: json["customiseEndDate"],
        customiseEndTime: json["customiseEndTime"],
        customiseStartDate: json["customiseStartDate"],
        customiseStartTime: json["customiseStartTime"],
        endDayMonthly: json["endDayMonthly"],
        endTime: json["endTime"],
        endTimeMonthly: json["endTimeMonthly"],
        endTimeWeekly: json["endTimeWeekly"],
        isShuffle: json["isShuffle"],
        startDayMonthly: json["startDayMonthly"],
        startTime: json["startTime"],
        startTimeMonthly: json["startTimeMonthly"],
        startTimeWeekly: json["startTimeWeekly"],
        status: json["status"],
        toneId: json["toneId"],
        toneIdStreamingUrl: json["toneIdStreamingUrl"],
        toneIdpreviewImageUrl: json["toneIdpreviewImageUrl"],
        toneName: json["toneName"],
        weeklyDays: json["weeklyDays"],
        yearlyEndDay: json["yearlyEndDay"],
        yearlyEndMonth: json["yearlyEndMonth"],
        yearlyEndTime: json["yearlyEndTime"],
        yearlyStartDay: json["yearlyStartDay"],
        yearlyStartMonth: json["yearlyStartMonth"],
        yearlyStartTime: json["yearlyStartTime"],
      );

  Map<String, dynamic> toJson() => {
        "album": album,
        "artist": artist,
        "createdDate": createdDate,
        "customiseEndDate": customiseEndDate,
        "customiseEndTime": customiseEndTime,
        "customiseStartDate": customiseStartDate,
        "customiseStartTime": customiseStartTime,
        "endDayMonthly": endDayMonthly,
        "endTime": endTime,
        "endTimeMonthly": endTimeMonthly,
        "endTimeWeekly": endTimeWeekly,
        "isShuffle": isShuffle,
        "startDayMonthly": startDayMonthly,
        "startTime": startTime,
        "startTimeMonthly": startTimeMonthly,
        "startTimeWeekly": startTimeWeekly,
        "status": status,
        "toneId": toneId,
        "toneIdStreamingUrl": toneIdStreamingUrl,
        "toneIdpreviewImageUrl": toneIdpreviewImageUrl,
        "toneName": toneName,
        "weeklyDays": weeklyDays,
        "yearlyEndDay": yearlyEndDay,
        "yearlyEndMonth": yearlyEndMonth,
        "yearlyEndTime": yearlyEndTime,
        "yearlyStartDay": yearlyStartDay,
        "yearlyStartMonth": yearlyStartMonth,
        "yearlyStartTime": yearlyStartTime,
      };
}
*/
/////////////////////////////////////===============================
///
///
/*
import 'dart:convert';

PlayingTuneModel playingTuneModelFromJson(String str) =>
    PlayingTuneModel.fromJson(json.decode(str));

String playingTuneModelToJson(PlayingTuneModel data) =>
    json.encode(data.toJson());

class PlayingTuneModel {
  List<PlayingToneList>? playinListTones;
  String? message;
  String? respCode;

  PlayingTuneModel({
    this.playinListTones,
    this.message,
    this.respCode,
  });

  factory PlayingTuneModel.fromJson(Map<String, dynamic> json) =>
      PlayingTuneModel(
        playinListTones: json["listtones"] == null
            ? []
            : List<PlayingToneList>.from(
                json["listtones"]!.map((x) => PlayingToneList.fromJson(x))),
        message: json["message"],
        respCode: json["respCode"],
      );

  Map<String, dynamic> toJson() => {
        "listtones": playinListTones == null
            ? []
            : List<dynamic>.from(playinListTones!.map((x) => x.toJson())),
        "message": message,
        "respCode": respCode,
      };
}

class PlayingToneList {
  PackDetails? packUserDetailsCrbt;
  String? serviceName;
  int? groupId;
  String? msisdnB;
  ToneDetail? toneDetails;
  //List<ToneDetail>? toneDetails;

  PlayingToneList({
    this.packUserDetailsCrbt,
    this.serviceName,
    this.groupId,
    this.msisdnB,
    this.toneDetails,
  });

  factory PlayingToneList.fromJson(Map<String, dynamic> json) {
    print("SKY100 =====${json["toneDetails"]}");
    return PlayingToneList(
      packUserDetailsCrbt: json["packDetails"] == null
          ? null
          : PackDetails.fromJson(json["packDetails"]),
      serviceName: json["serviceName"],
      groupId: json["groupId"],
      msisdnB: json["msisdnB"],
      toneDetails: json["toneDetails"] == null
          ? null
          : ToneDetail.fromJson(json["toneDetails"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "packDetails": packUserDetailsCrbt?.toJson(),
        "serviceName": serviceName,
        "groupId": groupId,
        "msisdnB": msisdnB,
        "toneDetails": toneDetails?.toJson(),
      };
}
*/
/*
class PlayinListTone {
  PackDetails? packDetails;
  String? serviceName;
  ToneDetail? toneDetails;

  PlayinListTone({
    this.packDetails,
    this.serviceName,
    this.toneDetails,
  });

  factory PlayinListTone.fromJson(Map<String, dynamic> json) => PlayinListTone(
        packDetails: json["packDetails"] == null
            ? null
            : PackDetails.fromJson(json["packDetails"]),
        serviceName: json["serviceName"],
        toneDetails: json["toneDetails"] == null
            ? null
            : ToneDetail.fromJson(json["toneDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "packDetails": packDetails?.toJson(),
        "serviceName": serviceName,
        "toneDetails": toneDetails?.toJson(),
      };
}
*/

/*
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
*/
class PlayingToneDetail {
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
  PlayingToneDetail({
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

  factory PlayingToneDetail.fromJson(Map<String, dynamic> json) =>
      PlayingToneDetail(
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
