import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

addtoWishListApi() async {
  
  String addToWishListUrl =
      "http://10.0.10.33:8088/selfcare/wishlist-service/add-to-wishlist";
      //"${selfcareBaseUrl}/selfcare/wishlist-service/add-to-wishlist";
   
  Map<String, dynamic> jsonMap = {
    'msisdn': "9408000131",//StoreManager().msisdn,
    "contentId": "1511218201",
    "contentPath":"https://ringtune.mpt.com.mm/stream-media/get-tone-path?fileId=XdYn8fG+ceO+CZyOn8viaA==",
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