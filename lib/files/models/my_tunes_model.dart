// To parse this JSON data, do
//
//     final myTuneListModel = myTuneListModelFromJson(jsonString);

import 'dart:convert';

MyTuneListModel myTuneListModelFromJson(String str) =>
    MyTuneListModel.fromJson(json.decode(str));

String myTuneListModelToJson(MyTuneListModel data) =>
    json.encode(data.toJson());

class MyTuneListModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  MyTuneListModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory MyTuneListModel.fromJson(Map<String, dynamic> json) =>
      MyTuneListModel(
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
  List<MyTuneListApk>? listToneApk;

  ResponseMap({
    this.listToneApk,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        listToneApk: json["listToneApk"] == null
            ? []
            : List<MyTuneListApk>.from(
                json["listToneApk"]?.map((x) => MyTuneListApk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listToneApk": listToneApk == null
            ? []
            : List<dynamic>.from(listToneApk!.map((x) => x.toJson())),
      };
}

class MyTuneListApk {
  List<MyToneDetail>? toneDetails;
  String? serviceName;
  int? groupId;

  MyTuneListApk({
    this.toneDetails,
    this.serviceName,
    this.groupId,
  });

  factory MyTuneListApk.fromJson(Map<String, dynamic> json) => MyTuneListApk(
        toneDetails: json["toneDetails"] == null
            ? []
            : List<MyToneDetail>.from(
                json["toneDetails"]?.map((x) => MyToneDetail.fromJson(x))),
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

class MyToneDetail {
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

  MyToneDetail({
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

  factory MyToneDetail.fromJson(Map<String, dynamic> json) => MyToneDetail(
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
/*
// To parse this JSON data, do
//
//     final myTunesModel = myTunesModelFromJson(jsonString);

import 'dart:convert';

MyTunesModel myTunesModelFromJson(String str) =>
    MyTunesModel.fromJson(json.decode(str));

String myTunesModelToJson(MyTunesModel data) => json.encode(data.toJson());

class MyTunesModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  MyTunesModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory MyTunesModel.fromJson(Map<String, dynamic> json) => MyTunesModel(
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
  List<MyTuneListModel>? listToneApk;

  ResponseMap({
    this.listToneApk,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        listToneApk: json["listToneApk"] == null
            ? []
            : List<MyTuneListModel>.from(
                json["listToneApk"]!.map((x) => MyTuneListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listToneApk": listToneApk == null
            ? []
            : List<dynamic>.from(listToneApk!.map((x) => x.toJson())),
      };
}

class MyTuneListModel {
  List<ToneDetail>? toneDetails;
  String? serviceName;
  String? groupId;

  MyTuneListModel({
    this.toneDetails,
    this.serviceName,
    this.groupId,
  });

  factory MyTuneListModel.fromJson(Map<String, dynamic> json) =>
      MyTuneListModel(
        toneDetails: json["toneDetails"] == null
            ? []
            : List<ToneDetail>.from(
                json["toneDetails"]!.map((x) => ToneDetail.fromJson(x))),
        serviceName: json["serviceName"],
        groupId: "${json["groupId"]}",
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
  String? price;
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
        price: "${json["price"]}",
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