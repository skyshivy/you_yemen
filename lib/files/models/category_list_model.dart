// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

/*
import 'dart:convert';

import 'package:get/get.dart';

CategoryListModel categoryListModelFromJson(String str) =>
    CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) =>
    json.encode(data.toJson());

class CategoryListModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  CategoryListModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
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
  List<Category>? categories;

  ResponseMap({
    this.categories,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  String? categoryId;
  String? categoryName;
  String? menuImagePath;
  String? language;
  RxBool isSelected = false.obs;
  
  Category({
    this.categoryId,
    this.categoryName,
    this.menuImagePath,
    this.language,
    required this.isSelected,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      categoryId: json["categoryId"],
      categoryName: json["categoryName"],
      menuImagePath: json["menuImagePath"],
      language: json["language"],
      isSelected: false.obs);

  int? get id => null;

  String? get searchKey => null;

  String? get name => null;

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "menuImagePath": menuImagePath,
        "language": language,
      };
}*/

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

CategoryListModel categoryListModelFromJson(String str) =>
    CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) =>
    json.encode(data.toJson());

class CategoryListModel {
  String? respCode;
  String? message;
  List<CategoryList>? categoryList;

  CategoryListModel({
    this.respCode,
    this.message,
    this.categoryList,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
        respCode: json["respCode"],
        message: json["message"],
        categoryList: json["categoryList"] == null
            ? []
            : List<CategoryList>.from(
                json["categoryList"]!.map((x) => CategoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "categoryList": categoryList == null
            ? []
            : List<dynamic>.from(categoryList!.map((x) => x.toJson())),
      };
}

class CategoryList {
  String? language;
  String? categoryId;
  String? menuId;
  String? categoryName;
  String? menuImage;
   RxBool isSelected = false.obs;

  CategoryList({
    this.language,
    this.categoryId,
    this.menuId,
    this.categoryName,
    this.menuImage,required this.isSelected,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        language: json["language"],
        categoryId: json["categoryID"],
        menuId: json["menuID"],
        categoryName: json["categoryName"],
        menuImage: json["menuImage"],isSelected: false.obs
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "categoryID": categoryId,
        "menuID": menuId,
        "categoryName": categoryName,
        "menuImage": menuImage,
      };
}
