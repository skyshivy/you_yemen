import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/models/sc_wishlist_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<GenericModel> scDeleteFromWishlistApi(Wishlist wishinfo) async {
  String deleteWishlistUrl = scDeleteFromWishlistUrl;

  Map<String, dynamic> jsonMap = {
    'msisdn': StoreManager().msisdn,
    "contentId": wishinfo.contentId,
    "languageCode": StoreManager().languageCode,
    "type": '1', //"type",
  };

  //await NetworkManager().post(deleteWishlistUrl, null, jsonData: jsonMap);
  Map<String, dynamic> respJson =
      await NetworkManager().post(deleteWishlistUrl, null, jsonData: jsonMap);
  GenericModel model = GenericModel.fromJson(respJson);
  return model;
}
