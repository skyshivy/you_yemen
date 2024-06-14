import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

deleteWishlistApi() async {
  String deleteWishlistUrl =
      "http://10.0.10.33:8088/selfcare/wishlist-service/delete-from-wishlist";
      //"${selfcareBaseUrl}/selfcare/wishlist-delete-from-wishlist";
      

  Map<String, dynamic> jsonMap = {
    'msisdn': "352447467",
    "contentId":"contentId",
    "languageCode": StoreManager().languageCode,
    "type":"type",
  };

  await NetworkManager().post(deleteWishlistUrl, null, jsonData: jsonMap);
  Map<String, dynamic> respJson =
      await NetworkManager().post(deleteWishlistUrl , null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
  
}
