import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

Future<GenericModel> addtoWishListApi(TuneInfo info) async {
  //TuneInfo info
  String addToWishListUrl =
      "http://10.0.10.33:8088/selfcare/wishlist-service/add-to-wishlist";
  //"${selfcareBaseUrl}/selfcare/wishlist-service/add-to-wishlist";

  Map<String, dynamic> jsonMap = {
    'msisdn': "9408000131", //StoreManager().msisdn,
    "contentId": info.toneId, //"1511218201",
    "contentPath": info
        .toneIdStreamingUrl, //"https://ringtune.mpt.com.mm/stream-media/get-tone-path?fileId=XdYn8fG+ceO+CZyOn8viaA==",
    "previewImage": info.previewImageUrl, //"previewImage",
    "contentName_L1": info.toneName, //"contentName_L1",
    "album_L1": info.albumName, //"album_L1",
    "artist_L1": info.artistName,
    "contentName_L2": info
        .toneName, //StoreManager().isEnglish?'':info.toneName,//"contentName_L2",
    "album_L2": info.album,
    "artist_L2": info.artist,
    "price": info.price,
    "languageCode": StoreManager().languageCode,
    'bmsisdn': '',
    "offerCode": "",
    "type": '1'
  };

  Map<String, dynamic> respJson =
      await NetworkManager().post(addToWishListUrl, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
