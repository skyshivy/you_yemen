import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

getWislistApi() async {
  String getWishlistUrl =
      "${selfcareBaseUrl}/selfcare/wishlist-service/get-wishlist";

  Map<String, dynamic> jsonMap = {
    "msisdn": StoreManager().msisdn,
    "type": "1",
    "languageCode": StoreManager().languageCode,
  };

  await NetworkManager().post(getWishlistUrl, null, jsonData: jsonMap);
  Map<String, dynamic> respJson =
      await NetworkManager().post(getWishlistUrl, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
