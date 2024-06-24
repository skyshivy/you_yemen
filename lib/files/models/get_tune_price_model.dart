// To parse this JSON data, do
//
//     final tonePriceModel = tonePriceModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final tonePriceModel = tonePriceModelFromJson(jsonString);

import 'dart:convert';

TonePriceModel tonePriceModelFromJson(String str) =>
    TonePriceModel.fromJson(json.decode(str));

String tonePriceModelToJson(TonePriceModel data) => json.encode(data.toJson());

class TonePriceModel {
  int? respCode;
  String? message;
  ToneDetails? toneDetails;

  TonePriceModel({
    this.respCode,
    this.message,
    this.toneDetails,
  });

  factory TonePriceModel.fromJson(Map<String, dynamic> json) => TonePriceModel(
        respCode: json["respCode"],
        message: json["message"],
        toneDetails: json["toneDetails"] == null
            ? null
            : ToneDetails.fromJson(json["toneDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "toneDetails": toneDetails?.toJson(),
      };
}

class ToneDetails {
  String? amount;
  String? languageId;
  String? packName;
  String? statusCodes;
  String? statusDesc;
  String? subscriberStatus;
  String? toneId;

  ToneDetails({
    this.amount,
    this.languageId,
    this.packName,
    this.statusCodes,
    this.statusDesc,
    this.subscriberStatus,
    this.toneId,
  });

  factory ToneDetails.fromJson(Map<String, dynamic> json) => ToneDetails(
        amount: json["amount"],
        languageId: json["languageId"],
        packName: json["packName"],
        statusCodes: json["statusCodes"],
        statusDesc: json["statusDesc"],
        subscriberStatus: json["subscriberStatus"],
        toneId: json["toneId"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "languageId": languageId,
        "packName": packName,
        "statusCodes": statusCodes,
        "statusDesc": statusDesc,
        "subscriberStatus": subscriberStatus,
        "toneId": toneId,
      };
}

/*
import 'dart:convert';

TonePriceModel tonePriceModelFromJson(String str) =>
    TonePriceModel.fromJson(json.decode(str));

String tonePriceModelToJson(TonePriceModel data) => json.encode(data.toJson());

class TonePriceModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  TonePriceModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory TonePriceModel.fromJson(Map<String, dynamic> json) => TonePriceModel(
        responseMap: json["responseMap"] == null
            ? ResponseMap()
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
  String? feature;
  String? aPartyMsisdn;
  List<ResponseDetail>? responseDetails;
  String? description;
  String? responseTxnId;

  ResponseMap({
    this.feature,
    this.aPartyMsisdn,
    this.responseDetails,
    this.description,
    this.responseTxnId,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        feature: json["feature"],
        aPartyMsisdn: json["aPartyMsisdn"],
        responseDetails: json["responseDetails"] == null
            ? [ResponseDetail()]
            : List<ResponseDetail>.from(json["responseDetails"]!
                .map((x) => ResponseDetail.fromJson(x))),
        description: json["description"],
        responseTxnId: json["responseTxnId"],
      );

  Map<String, dynamic> toJson() => {
        "feature": feature,
        "aPartyMsisdn": aPartyMsisdn,
        "responseDetails": responseDetails == null
            ? []
            : List<dynamic>.from(responseDetails!.map((x) => x.toJson())),
        "description": description,
        "responseTxnId": responseTxnId,
      };
}

class ResponseDetail {
  String? amount;
  String? languageId;
  String? packName;
  String? statusCodes;
  String? statusDesc;
  String? toneId;
  String? subscriberStatus;

  ResponseDetail({
    this.amount,
    this.languageId,
    this.packName,
    this.statusCodes,
    this.statusDesc,
    this.toneId,
    this.subscriberStatus,
  });

  factory ResponseDetail.fromJson(Map<String, dynamic> json) => ResponseDetail(
        amount: json["amount"],
        languageId: json["languageId"],
        packName: json["packName"],
        statusCodes: json["statusCodes"],
        statusDesc: json["statusDesc"],
        toneId: json["toneId"],
        subscriberStatus: json["subscriberStatus"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "languageId": languageId,
        "packName": packName,
        "statusCodes": statusCodes,
        "statusDesc": statusDesc,
        "toneId": toneId,
        "subscriberStatus": subscriberStatus,
      };
}
*/