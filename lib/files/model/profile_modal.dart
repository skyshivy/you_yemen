// To parse this JSON data, do
//
//     final profilemodal = profilemodalFromJson(jsonString);

// To parse this JSON data, do
//
//     final profilemodal = profilemodalFromJson(jsonString);

import 'dart:convert';

ProfileModal profilemodalFromJson(String str) =>
    ProfileModal.fromJson(json.decode(str));

String profilemodalToJson(ProfileModal data) => json.encode(data.toJson());

class ProfileModal {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  ProfileModal({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory ProfileModal.fromJson(Map<String, dynamic> json) => ProfileModal(
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
  GetProfileDetails? getProfileDetails;

  ResponseMap({
    this.getProfileDetails,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        getProfileDetails: json["getProfileDetails"] == null
            ? null
            : GetProfileDetails.fromJson(json["getProfileDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "getProfileDetails": getProfileDetails?.toJson(),
      };
}

class GetProfileDetails {
  String? userName;
  String? msisdn;
  String? emailId;
  String? categories;
  String? clientTxnId;
  String? respDesc;

  GetProfileDetails({
    this.userName,
    this.msisdn,
    this.emailId,
    this.categories,
    this.clientTxnId,
    this.respDesc,
  });

  factory GetProfileDetails.fromJson(Map<String, dynamic> json) =>
      GetProfileDetails(
        userName: json["userName"],
        msisdn: json["msisdn"],
        emailId: json["emailId"],
        categories: json["categories"],
        clientTxnId: json["clientTxnId"],
        respDesc: json["respDesc"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "msisdn": msisdn,
        "emailId": emailId,
        "categories": categories,
        "clientTxnId": clientTxnId,
        "respDesc": respDesc,
      };
}
