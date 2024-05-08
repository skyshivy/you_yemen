import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/models/wishlist_modal.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';



Future<WishlistModal>  WishlistDetailsApi() async {
  final url =
      'https://funtone.ooredoo.com.mm/apigw/Middleware/api/adapter/v1/crbt/view-wishlist';
Map<String, dynamic> payload = {
    "msisdn": "9923964719",
"language": "English",
"identifier": "ViewWishListItems",
"wishlistType": "1"

  };
var parts = [];
  payload.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');
 
  await Future.delayed(Duration(seconds: 1));
  Map<String, dynamic> jsonMap = await NetworkManager().post(url, formData);

 WishlistModal modal = WishlistModal.fromJson(jsonMap);
  print("modal =${modal.message}");

  return modal;
}