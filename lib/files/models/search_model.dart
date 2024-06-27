// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

import 'package:you_yemen/files/models/tune_info_model.dart';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  SearchModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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
  List<ArtistList>? artistList;
  List<TuneInfo>? toneList;

  ResponseMap({
    this.artistList,
    this.toneList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        artistList: json["artistList"] == null
            ? []
            : List<ArtistList>.from(
                json["artistList"]!.map((x) => ArtistList.fromJson(x))),
        toneList: json["toneList"] == null
            ? []
            : List<TuneInfo>.from(
                json["toneList"]!.map((x) => TuneInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "artistList": artistList == null
            ? []
            : List<dynamic>.from(artistList!.map((x) => x.toJson())),
        "toneList": toneList == null
            ? []
            : List<dynamic>.from(toneList!.map((x) => x.toJson())),
      };
}

class ArtistList {
  String? val;
  int? count;

  ArtistList({
    this.val,
    this.count,
  });

  factory ArtistList.fromJson(Map<String, dynamic> json) => ArtistList(
        val: json["val"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "val": val,
        "count": count,
      };
}
