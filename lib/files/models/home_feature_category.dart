// To parse this JSON data, do
//
//     final homeRecomModel = homeRecomModelFromJson(jsonString);

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
