import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/sc_wishlist_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future <ScWishListModel> getWishlistApi() async {
  String getWishlistUrl = scGetWishListUrl;
      //"http://10.0.10.33:8088/selfcare/wishlist-service/get-wishlist";
  //http://10.0.10.33:8088/selfcare/wishlist-service/get-wishlist
  Map<String, dynamic> jsonMap = {
    "msisdn": "9408000131",//StoreManager().msisdn,
    "type": "1",
    "languageCode":'1',//StoreManager().languageCode, 
  };

  
  Map<String, dynamic> respJson =
      await NetworkManager().post(getWishlistUrl, null, jsonData: jsonMap);
  ScWishListModel model = ScWishListModel.fromJson(respJson);
  return model;
}
