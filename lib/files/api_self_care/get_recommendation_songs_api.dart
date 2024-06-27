import 'package:you_yemen/files/utility/urls.dart';
import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/models/home_feature_category.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';

Future<HomeFeatureModel> scGetRecommendationSongApi(String identifier) async {
  String url = '';
  if (StoreManager().isLoggedIn) {
    url =
        "${scGetRecomndedUrl}languageCode=${StoreManager().languageSort}&identifier=$identifier&msisdn=${StoreManager().msisdn}";
  } else {
    url =
        "${scGetRecomndedUrl}languageCode=${StoreManager().languageSort}&identifier=$identifier";
  }

  Map<String, String> header = {
    "transId": getTransactionId(),
  };
  Map<String, dynamic> response =
      await NetworkManager().get(url, params: header);
  HomeFeatureModel model = HomeFeatureModel.fromJson(response);
  return model;
}
