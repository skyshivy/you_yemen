// To parse this JSON data, do
//
//     final genericModel = genericModelFromJson(jsonString);

import 'dart:convert';

List<GenericModel> genericModelFromJson(String str) => List<GenericModel>.from(json.decode(str).map((x) => GenericModel.fromJson(x)));

String genericModelToJson(List<GenericModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenericModel {
    int? respCode;
    String? message;

    GenericModel({
        this.respCode,
        this.message,
    });

    factory GenericModel.fromJson(Map<String, dynamic> json) => GenericModel(
        respCode: json["respCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
    };
}
