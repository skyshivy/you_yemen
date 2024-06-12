// To parse this JSON data, do
//
//     final scContentPriceModel = scContentPriceModelFromJson(jsonString);

import 'dart:convert';

ScContentPriceModel scContentPriceModelFromJson(String str) =>
    ScContentPriceModel.fromJson(json.decode(str));

String scContentPriceModelToJson(ScContentPriceModel data) =>
    json.encode(data.toJson());

class ScContentPriceModel {
  int? respCode;
  String? message;
  ContentDetails? contentDetails;

  ScContentPriceModel({
    this.respCode,
    this.message,
    this.contentDetails,
  });

  factory ScContentPriceModel.fromJson(Map<String, dynamic> json) =>
      ScContentPriceModel(
        respCode: json["respCode"],
        message: json["message"],
        contentDetails: json["contentDetails"] == null
            ? null
            : ContentDetails.fromJson(json["contentDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "contentDetails": contentDetails?.toJson(),
      };
}

class ContentDetails {
  String? offerName;
  String? offerStatus;
  int? contentPrice;

  ContentDetails({
    this.offerName,
    this.offerStatus,
    this.contentPrice,
  });

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        offerName: json["offerName"],
        offerStatus: json["offerStatus"],
        contentPrice: json["contentPrice"],
      );

  Map<String, dynamic> toJson() => {
        "offerName": offerName,
        "offerStatus": offerStatus,
        "contentPrice": contentPrice,
      };
}
