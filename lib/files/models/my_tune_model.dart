// To parse this JSON data, do
//
//     final myTuneModel = myTuneModelFromJson(jsonString);

import 'dart:convert';

import 'package:you_yemen/files/models/tune_info_model.dart';

MyTuneModel myTuneModelFromJson(String str) =>
    MyTuneModel.fromJson(json.decode(str));

String myTuneModelToJson(MyTuneModel data) => json.encode(data.toJson());

class MyTuneModel {
  List<Listtone>? listtones;
  String? message;
  String? respCode;

  MyTuneModel({
    this.listtones,
    this.message,
    this.respCode,
  });

  factory MyTuneModel.fromJson(Map<String, dynamic> json) => MyTuneModel(
        listtones: json["listtones"] == null
            ? []
            : List<Listtone>.from(
                json["listtones"]!.map((x) => Listtone.fromJson(x))),
        message: json["message"],
        respCode: json["respCode"],
      );

  Map<String, dynamic> toJson() => {
        "listtones": listtones == null
            ? []
            : List<dynamic>.from(listtones!.map((x) => x.toJson())),
        "message": message,
        "respCode": respCode,
      };
}

class Listtone {
  String? serviceName;
  TuneInfo? toneDetails;

  Listtone({
    this.serviceName,
    this.toneDetails,
  });

  factory Listtone.fromJson(Map<String, dynamic> json) => Listtone(
        serviceName: json["serviceName"],
        toneDetails: json["toneDetails"] == null
            ? null
            : TuneInfo.fromJson(json["toneDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "serviceName": serviceName,
        "toneDetails": toneDetails?.toJson(),
      };
}
