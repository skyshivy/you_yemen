import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/home_banner_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<HomeBannerModel> getBannerlistApi() async {
  String url =
      "${scGetBannerList}channelId=$channelId&languageCode=${StoreManager().languageSort}";
  Map<String, String> header = {"transId": getTransactionId()};
  Map<String, dynamic> response =
      await NetworkManager().get(url, params: header);
  print("HomeBannerModel $response");
  HomeBannerModel model = HomeBannerModel.fromJson(response);
  return model;
}
