// To parse this JSON data, do
//
//     final tellFreindModel = tellFreindModelFromJson(jsonString);

import 'dart:convert';

TellFreindModel tellFreindModelFromJson(String str) =>
    TellFreindModel.fromJson(json.decode(str));

String tellFreindModelToJson(TellFreindModel data) =>
    json.encode(data.toJson());

class TellFreindModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  TellFreindModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory TellFreindModel.fromJson(Map<String, dynamic> json) =>
      TellFreindModel(
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
  ResponseMap();

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap();

  Map<String, dynamic> toJson() => {};
}
