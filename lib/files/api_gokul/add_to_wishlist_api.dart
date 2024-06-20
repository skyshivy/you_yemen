import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<GenericModel> scAddtoWishListApi(TuneInfo info) async {
  //TuneInfo info
  String addToWishListUrl = scAddToWishListUrl;

  Map<String, dynamic> jsonMap = {
    'msisdn': StoreManager().msisdn,
    "contentId": info.toneId,
    "contentPath": info.toneIdStreamingUrl,
    "previewImage": info.previewImageUrl,
    "contentName_L1": info.toneName,
    "album_L1": info.albumName,
    "artist_L1": info.artistName,
    "contentName_L2": info.toneName,
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
