import 'package:you_yemen/files/models/home_banner_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';


Future<HomeBannerModel> getBannerDetailsApi() async {
  String url =
      "http://10.0.14.4:5892/selfcare/get-banner-details?searchKey=95957&languageCode=en";
  Map<String, String> header = {
    "transId": "87863646846",
  };
  Map<String, dynamic> response =
      await NetworkManager().get(url, params: header);
  HomeBannerModel model = HomeBannerModel.fromJson(response);
  return model;
}