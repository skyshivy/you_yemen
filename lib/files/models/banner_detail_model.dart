// To parse this JSON data, do
//
//     final bannerDetailModel = bannerDetailModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final bannerDetailModel = bannerDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:you_yemen/files/models/tune_info_model.dart';

BannerDetailModel bannerDetailModelFromJson(String str) =>
    BannerDetailModel.fromJson(json.decode(str));

String bannerDetailModelToJson(BannerDetailModel data) =>
    json.encode(data.toJson());

class BannerDetailModel {
  String? respCode;
  String? message;
  ResponseMap? responseMap;

  BannerDetailModel({
    this.respCode,
    this.message,
    this.responseMap,
  });

  factory BannerDetailModel.fromJson(Map<String, dynamic> json) =>
      BannerDetailModel(
        respCode: json["respCode"],
        message: json["message"],
        responseMap: json["responseMap"] == null
            ? null
            : ResponseMap.fromJson(json["responseMap"]),
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "responseMap": responseMap?.toJson(),
      };
}

class ResponseMap {
  List<TuneInfo>? bannerDetails;

  ResponseMap({
    this.bannerDetails,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        bannerDetails: json["bannerDetails"] == null
            ? []
            : List<TuneInfo>.from(
                json["bannerDetails"]!.map((x) => TuneInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bannerDetails": bannerDetails == null
            ? []
            : List<dynamic>.from(bannerDetails!.map((x) => x.toJson())),
      };
}
/*
class BannerDetail {
    String? location;
    String? previewImage;
    String? toneId;
    String? contentName;
    String? artistName;
    String? albumName;

    BannerDetail({
        this.location,
        this.previewImage,
        this.toneId,
        this.contentName,
        this.artistName,
        this.albumName,
    });

    factory BannerDetail.fromJson(Map<String, dynamic> json) => BannerDetail(
        location: json["location"],
        previewImage: json["previewImage"],
        toneId: json["toneId"],
        contentName: json["contentName"],
        artistName: json["artistName"],
        albumName: json["albumName"],
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "previewImage": previewImage,
        "toneId": toneId,
        "contentName": contentName,
        "artistName": artistName,
        "albumName": albumName,
    };
}

*/