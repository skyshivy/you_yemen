import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/get_wish_list_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

getWislistApi() async {
  String getWishlistUrl =
      "http://10.0.10.33:8088/selfcare/wishlist-service/get-wishlist";
  //http://10.0.10.33:8088/selfcare/wishlist-service/get-wishlist
  Map<String, dynamic> jsonMap = {
    "msisdn": "9408000131",//StoreManager().msisdn,
    "type": "1",
    "languageCode": StoreManager().languageCode,
  };

  await NetworkManager().post(getWishlistUrl, null, jsonData: jsonMap);
  Map<String, dynamic> respJson =
      await NetworkManager().post(getWishlistUrl, null, jsonData: jsonMap);
  GetWishlistModel model = GetWishlistModel.fromJson(respJson);
  return model;
}
