// To parse this JSON data, do
//
//     final scWishListModel = scWishListModelFromJson(jsonString);

import 'dart:convert';

ScWishListModel scWishListModelFromJson(String str) => ScWishListModel.fromJson(json.decode(str));

String scWishListModelToJson(ScWishListModel data) => json.encode(data.toJson());

class ScWishListModel {
    int? respCode;
    String? message;
    List<Wishlist>? wishlist;

    ScWishListModel({
        this.respCode,
        this.message,
        this.wishlist,
    });

    factory ScWishListModel.fromJson(Map<String, dynamic> json) => ScWishListModel(
        respCode: json["respCode"],
        message: json["message"],
        wishlist: json["wishlist"] == null ? [] : List<Wishlist>.from(json["wishlist"]!.map((x) => Wishlist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "wishlist": wishlist == null ? [] : List<dynamic>.from(wishlist!.map((x) => x.toJson())),
    };
}

class Wishlist {
    int? contentId;
    String? contentPath;
    String? previewImage;
    String? contentNameL1;
    String? albumL1;
    String? artistL1;
    String? contentNameL2;
    String? albumL2;
    String? artistL2;
    String? price;
    String? languageCode;
    int? type;

    Wishlist({
        this.contentId,
        this.contentPath,
        this.previewImage,
        this.contentNameL1,
        this.albumL1,
        this.artistL1,
        this.contentNameL2,
        this.albumL2,
        this.artistL2,
        this.price,
        this.languageCode,
        this.type,
    });

    factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        contentId: json["contentId"],
        contentPath: json["contentPath"],
        previewImage: json["previewImage"],
        contentNameL1: json["contentName_L1"],
        albumL1: json["album_L1"],
        artistL1: json["artist_L1"],
        contentNameL2: json["contentName_L2"],
        albumL2: json["album_L2"],
        artistL2: json["artist_L2"],
        price: json["price"],
        languageCode: json["languageCode"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "contentId": contentId,
        "contentPath": contentPath,
        "previewImage": previewImage,
        "contentName_L1": contentNameL1,
        "album_L1": albumL1,
        "artist_L1": artistL1,
        "contentName_L2": contentNameL2,
        "album_L2": albumL2,
        "artist_L2": artistL2,
        "price": price,
        "languageCode": languageCode,
        "type": type,
    };
}
