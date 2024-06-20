// To parse this JSON data, do
//
//     final categoryDetailModel = categoryDetailModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final categoryDetailModel = categoryDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:you_yemen/files/models/tune_info_model.dart';

CategoryDetailModel categoryDetailModelFromJson(String str) =>
    CategoryDetailModel.fromJson(json.decode(str));

String categoryDetailModelToJson(CategoryDetailModel data) =>
    json.encode(data.toJson());

class CategoryDetailModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  CategoryDetailModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) =>
      CategoryDetailModel(
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
  List<TuneInfo>? toneList;

  ResponseMap({
    this.toneList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        toneList: json["toneList"] == null
            ? []
            : List<TuneInfo>.from(
                json["toneList"]!.map((x) => TuneInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "toneList": toneList == null
            ? []
            : List<dynamic>.from(toneList!.map((x) => x.toJson())),
      };
}



/*
class SearchList {
  SearchList({
    this.toneId,
    this.previewImageUrl,
    this.toneUrl,
    this.toneName,
    this.artistName,
    this.albumName,
    this.price,
    this.categoryId,
    this.expiryDate,
    this.toneIdStreamingUrl,
    this.toneIdpreviewImageUrl,
  });

  String? toneId;
  String? previewImageUrl;
  String? toneUrl;
  String? toneName;
  String? artistName;
  String? albumName;
  int? price;
  int? categoryId;
  ExpiryDate? expiryDate;
  String? toneIdStreamingUrl;
  String? toneIdpreviewImageUrl;

  factory SearchList.fromJson(Map<String, dynamic> json) => SearchList(
        toneId: json["toneId"],
        previewImageUrl: json["previewImageUrl"],
        toneUrl: json["toneUrl"],
        toneName: json["toneName"],
        artistName: json["artistName"],
        albumName: json["albumName"],
        price: json["price"],
        categoryId: json["categoryId"],
        expiryDate: expiryDateValues.map?[json["expiryDate"]],
        toneIdStreamingUrl: json["toneIdStreamingUrl"],
        toneIdpreviewImageUrl: json["toneIdpreviewImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "toneId": toneId,
        "previewImageUrl": previewImageUrl,
        "toneUrl": toneUrl,
        "toneName": toneName,
        "artistName": artistName,
        "albumName": albumName,
        "price": price,
        "categoryId": categoryId,
        "expiryDate": expiryDateValues.reverse[expiryDate],
        "toneIdStreamingUrl": toneIdStreamingUrl,
        "toneIdpreviewImageUrl": toneIdpreviewImageUrl,
      };
}

enum ExpiryDate { MON_DEC_31113000_UTC_2035 }

final expiryDateValues = EnumValues(
    {"Mon Dec 31 11:30:00 UTC 2035": ExpiryDate.MON_DEC_31113000_UTC_2035});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
*/