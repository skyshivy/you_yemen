// To parse this JSON data, do
//
//     final myTuneModel = myTuneModelFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final myTuneModel = myTuneModelFromJson(jsonString);

//import 'dart:convert';

import 'package:you_yemen/files/models/tune_info_model.dart';

MyTuneModel myTuneModelFromJson(String str) =>
    MyTuneModel.fromJson(json.decode(str));

String myTuneModelToJson(MyTuneModel data) => json.encode(data.toJson());

class MyTuneModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  MyTuneModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory MyTuneModel.fromJson(Map<String, dynamic> json) => MyTuneModel(
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
  List<ListToneApk1>? listToneApk;

  ResponseMap({
    this.listToneApk,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        listToneApk: json["listToneApk"] == null
            ? []
            : List<ListToneApk1>.from(
                json["listToneApk"]!.map((x) => ListToneApk1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listToneApk": listToneApk == null
            ? []
            : List<dynamic>.from(listToneApk!.map((x) => x.toJson())),
      };
}

class ListToneApk1 {
  List<TuneInfo>? toneDetails;
  String? serviceName;
  int? groupId;

  ListToneApk1({
    this.toneDetails,
    this.serviceName,
    this.groupId,
  });

  factory ListToneApk1.fromJson(Map<String, dynamic> json) => ListToneApk1(
        toneDetails: json["toneDetails"] == null
            ? []
            : List<TuneInfo>.from(
                json["toneDetails"]!.map((x) => TuneInfo.fromJson(x))),
        serviceName: json["serviceName"],
        groupId: json["groupId"],
      );

  Map<String, dynamic> toJson() => {
        "toneDetails": toneDetails == null
            ? []
            : List<dynamic>.from(toneDetails!.map((x) => x.toJson())),
        "serviceName": serviceName,
        "groupId": groupId,
      };
}
/*
class ToneDetail {
    String? toneId;
    String? toneName;
    String? toneUrl;
    String? previewImageUrl;
    String? albumName;
    String? artistName;
    int? price;
    String? createdDate;
    String? status;
    String? isCopy;
    String? isGift;
    String? toneIdStreamingUrl;
    String? toneIdpreviewImageUrl;

    ToneDetail({
        this.toneId,
        this.toneName,
        this.toneUrl,
        this.previewImageUrl,
        this.albumName,
        this.artistName,
        this.price,
        this.createdDate,
        this.status,
        this.isCopy,
        this.isGift,
        this.toneIdStreamingUrl,
        this.toneIdpreviewImageUrl,
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
        status: json["status"],
        isCopy: json["isCopy"],
        isGift: json["isGift"],
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
        "status": status,
        "isCopy": isCopy,
        "isGift": isGift,
        "toneIdStreamingUrl": toneIdStreamingUrl,
        "toneIdpreviewImageUrl": toneIdpreviewImageUrl,
    };
    
}
*/


/*

MyTuneModel myTuneModelFromJson(String str) =>
    MyTuneModel.fromJson(json.decode(str));

String myTuneModelToJson(MyTuneModel data) => json.encode(data.toJson());

class MyTuneModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  MyTuneModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory MyTuneModel.fromJson(Map<String, dynamic> json) => MyTuneModel(
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
  List<TuneInfo>? listToneApk;

  ResponseMap({
    this.listToneApk,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        listToneApk: json["listToneApk"] == null
            ? []
            : List<TuneInfo>.from(
                json["listToneApk"]!.map((x) => TuneInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listToneApk": listToneApk == null
            ? []
            : List<dynamic>.from(listToneApk!.map((x) => x.toJson())),
      };
}



class ListToneApk {
  List<ToneDetail>? toneDetails;
  String? serviceName;
  int? groupId;

  ListToneApk({
    this.toneDetails,
    this.serviceName,
    this.groupId,
  });

  factory ListToneApk.fromJson(Map<String, dynamic> json) => ListToneApk(
        toneDetails: json["toneDetails"] == null
            ? []
            : List<ToneDetail>.from(
                json["toneDetails"]!.map((x) => ToneDetail.fromJson(x))),
        serviceName: json["serviceName"],
        groupId: json["groupId"],
      );

  Map<String, dynamic> toJson() => {
        "toneDetails": toneDetails == null
            ? []
            : List<dynamic>.from(toneDetails!.map((x) => x.toJson())),
        "serviceName": serviceName,
        "groupId": groupId,
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
  String? status;
  String? isCopy;
  String? isGift;
  String? toneIdStreamingUrl;
  String? toneIdpreviewImageUrl;

  ToneDetail({
    this.toneId,
    this.toneName,
    this.toneUrl,
    this.previewImageUrl,
    this.albumName,
    this.artistName,
    this.price,
    this.createdDate,
    this.status,
    this.isCopy,
    this.isGift,
    this.toneIdStreamingUrl,
    this.toneIdpreviewImageUrl,
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
        status: json["status"],
        isCopy: json["isCopy"],
        isGift: json["isGift"],
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
        "status": status,
        "isCopy": isCopy,
        "isGift": isGift,
        "toneIdStreamingUrl": toneIdStreamingUrl,
        "toneIdpreviewImageUrl": toneIdpreviewImageUrl,
      };
}


*/