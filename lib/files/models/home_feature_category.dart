// To parse this JSON data, do
//
//     final homeRecomModel = homeRecomModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final homeFeatureModel = homeFeatureModelFromJson(jsonString);

import 'dart:convert';

import 'package:you_yemen/files/models/tune_info_model.dart';

HomeFeatureModel homeFeatureModelFromJson(String str) =>
    HomeFeatureModel.fromJson(json.decode(str));

String homeFeatureModelToJson(HomeFeatureModel data) =>
    json.encode(data.toJson());

class HomeFeatureModel {
  ResponseMap? responseMap;
  String? message;
  String? respCode;

  HomeFeatureModel({
    this.responseMap,
    this.message,
    this.respCode,
  });

  factory HomeFeatureModel.fromJson(Map<String, dynamic> json) =>
      HomeFeatureModel(
        responseMap: json["responseMap"] == null
            ? null
            : ResponseMap.fromJson(json["responseMap"]),
        message: json["message"],
        respCode: json["respCode"],
      );

  Map<String, dynamic> toJson() => {
        "responseMap": responseMap?.toJson(),
        "message": message,
        "respCode": respCode,
      };
}

class ResponseMap {
  List<TuneInfo>? recommendationList;

  ResponseMap({
    this.recommendationList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        recommendationList: json["recommendationList"] == null
            ? []
            : List<TuneInfo>.from(
                json["recommendationList"]!.map((x) => TuneInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recommendationList": recommendationList == null
            ? []
            : List<dynamic>.from(recommendationList!.map((x) => x.toJson())),
      };
}
/*
class RecommendationList {
  String? categoryId;
  String? toneId;
  String? toneName;
  String? albumName;
  String? artistName;
  String? toneUrl;
  String? previewImageUrl;
  String? downloadCount;
  String? likeCount;
  String? toneIdStreamingUrl;
  String? toneIdpreviewImageUrl;

  RecommendationList({
    this.categoryId,
    this.toneId,
    this.toneName,
    this.albumName,
    this.artistName,
    this.toneUrl,
    this.previewImageUrl,
    this.downloadCount,
    this.likeCount,
    this.toneIdStreamingUrl,
    this.toneIdpreviewImageUrl,
  });

  factory RecommendationList.fromJson(Map<String, dynamic> json) =>
      RecommendationList(
        categoryId: json["categoryId"],
        toneId: json["toneId"],
        toneName: json["toneName"],
        albumName: json["albumName"],
        artistName: json["artistName"],
        toneUrl: json["toneUrl"],
        previewImageUrl: json["previewImageUrl"],
        downloadCount: json["downloadCount"],
        likeCount: json["likeCount"],
        toneIdStreamingUrl: json["toneIdStreamingUrl"],
        toneIdpreviewImageUrl: json["toneIdpreviewImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "toneId": toneId,
        "toneName": toneName,
        "albumName": albumName,
        "artistName": artistName,
        "toneUrl": toneUrl,
        "previewImageUrl": previewImageUrl,
        "downloadCount": downloadCount,
        "likeCount": likeCount,
        "toneIdStreamingUrl": toneIdStreamingUrl,
        "toneIdpreviewImageUrl": toneIdpreviewImageUrl,
      };
}


import 'dart:convert';

import 'package:you_yemen/files/models/tune_info_model.dart';

HomeFeatureModel homeRecomModelFromJson(String str) =>
    HomeFeatureModel.fromJson(json.decode(str));

String homeRecomModelToJson(HomeFeatureModel data) =>
    json.encode(data.toJson());

class HomeFeatureModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  HomeFeatureModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory HomeFeatureModel.fromJson(Map<String, dynamic> json) =>
      HomeFeatureModel(
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
  String? responseDescription;
  List<TuneInfo>? recommendationSongsList;

  ResponseMap({
    this.responseDescription,
    this.recommendationSongsList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        responseDescription: json["responseDescription"],
        recommendationSongsList: json["recommendationSongsList"] == null
            ? []
            : List<TuneInfo>.from(json["recommendationSongsList"]!
                .map((x) => TuneInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseDescription": responseDescription,
        "recommendationSongsList": recommendationSongsList == null
            ? []
            : List<TuneInfo>.from(
                recommendationSongsList!.map((x) => x.toJson())),
      };
}
*/