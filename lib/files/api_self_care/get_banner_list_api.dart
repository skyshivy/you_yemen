import 'package:you_yemen/files/models/home_banner_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';


Future<HomeBannerModel> getBannerlistApi() async {
  String url =
      "${scGetBannerList}channelId=$channelId&languageCode=${StoreManager().languageSort}";
  Map<String, String> header = {
    "transId": "87863646846",
  };
  Map<String, dynamic> response =
      await NetworkManager().get(url, params: header);

  HomeBannerModel model = HomeBannerModel.fromJson(response);
  return model;

}
