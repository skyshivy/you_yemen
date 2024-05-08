// To parse this JSON data, do
//
//     final editmodal = editmodalFromJson(jsonString);

import 'dart:convert';

EditProfileModal editmodalFromJson(String str) =>
    EditProfileModal.fromJson(json.decode(str));

String editmodalToJson(EditProfileModal data) => json.encode(data.toJson());

class EditProfileModal {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  EditProfileModal({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory EditProfileModal.fromJson(Map<String, dynamic> json) =>
      EditProfileModal(
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
  String? respDesc;
  String? clientTxnId;
  String? srvType;
  String? respCode;
  String? txnId;

  ResponseMap({
    this.respDesc,
    this.clientTxnId,
    this.srvType,
    this.respCode,
    this.txnId,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        respDesc: json["respDesc"],
        clientTxnId: json["clientTxnId"],
        srvType: json["srvType"],
        respCode: json["respCode"],
        txnId: json["txnId"],
      );

  Map<String, dynamic> toJson() => {
        "respDesc": respDesc,
        "clientTxnId": clientTxnId,
        "srvType": srvType,
        "respCode": respCode,
        "txnId": txnId,
      };
}
