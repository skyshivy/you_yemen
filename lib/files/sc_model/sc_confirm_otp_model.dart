// To parse this JSON data, do
//
//     final scConfirmOtpModel = scConfirmOtpModelFromJson(jsonString);

import 'dart:convert';

ScConfirmOtpModel scConfirmOtpModelFromJson(String str) =>
    ScConfirmOtpModel.fromJson(json.decode(str));

String scConfirmOtpModelToJson(ScConfirmOtpModel data) =>
    json.encode(data.toJson());

class ScConfirmOtpModel {
  int? respCode;
  String? message;
  String? accessToken;
  String? refreshToken;
  int? expiresIn;

  ScConfirmOtpModel({
    this.respCode,
    this.message,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
  });

  factory ScConfirmOtpModel.fromJson(Map<String, dynamic> json) =>
      ScConfirmOtpModel(
        respCode: json["respCode"],
        message: json["message"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
      };
}
