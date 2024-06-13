// To parse this JSON data, do
//
//     final scGenerateOtpModel = scGenerateOtpModelFromJson(jsonString);

import 'dart:convert';

ScGenerateOtpModel scGenerateOtpModelFromJson(String str) =>
    ScGenerateOtpModel.fromJson(json.decode(str));

String scGenerateOtpModelToJson(ScGenerateOtpModel data) =>
    json.encode(data.toJson());

class ScGenerateOtpModel {
  int? respCode;
  String? message;
  int? otpResendTimeout;
  String? userData;

  ScGenerateOtpModel({
    this.respCode,
    this.message,
    this.otpResendTimeout,
    this.userData,
  });

  factory ScGenerateOtpModel.fromJson(Map<String, dynamic> json) =>
      ScGenerateOtpModel(
        respCode: json["respCode"],
        message: json["message"],
        otpResendTimeout: json["otpResendTimeout"],
        userData: json["userData"],
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "otpResendTimeout": otpResendTimeout,
        "userData": userData,
      };
}
