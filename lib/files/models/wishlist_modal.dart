// To parse this JSON data, do
//
//     final wishlistModal = wishlistModalFromJson(jsonString);

import 'dart:convert';

import 'package:you_yemen/files/models/tune_info_model.dart';

WishlistModal wishlistModalFromJson(String str) =>
    WishlistModal.fromJson(json.decode(str));

String wishlistModalToJson(WishlistModal data) => json.encode(data.toJson());

class WishlistModal {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  WishlistModal({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory WishlistModal.fromJson(Map<String, dynamic> json) => WishlistModal(
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
  String? descriptiion;
  List<TuneInfo>? toneDetailsList;

  ResponseMap({
    this.descriptiion,
    this.toneDetailsList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        descriptiion: json["descriptiion"],
        toneDetailsList: json["toneDetailsList"] == null
            ? []
            : List<TuneInfo>.from(
                json["toneDetailsList"]!.map((x) => TuneInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "descriptiion": descriptiion,
        "toneDetailsList": toneDetailsList == null
            ? []
            : List<dynamic>.from(toneDetailsList!.map((x) => x.toJson())),
      };
}
