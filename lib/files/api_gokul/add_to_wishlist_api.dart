import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

addtoWishListApi() async {
  
  String addToWishListUrl =
      "${selfcareBaseUrl}/selfcare/wishlist-service/add-to-wishlist";

  Map<String, dynamic> jsonMap = {
    'msisdn': StoreManager().msisdn,
    "contentId": "contentId",
    "contentPath":"contentPath",
    "previewImage":"previewImage",
    "contentName_L1":"contentName_L1",
    "album_L1":"album_L1",
    "artist_L1":"artist_L1",
    "contentName_L2":"contentName_L2",
    "album_L2":"album_L2",
    "artist_L2":"artist_L2",
    "price":"price",
    "languageCode":StoreManager().languageCode,
    'bmsisdn': "bmsisdn",
    "offerCode": "offerCode",
    "type":"type",
  };

  await NetworkManager().post(addToWishListUrl, null, jsonData: jsonMap);
   Map<String, dynamic> respJson =
      await NetworkManager().post(addToWishListUrl , null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}