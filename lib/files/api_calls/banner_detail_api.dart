import 'package:you_yemen/files/models/banner_detail_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<BannerDetailModel> bannerDetailApi(String key, String type,
    {int pageNo = 0}) async {
  String url = bannerDetailUrl +
      "http://10.0.14.4:5892/selfcare/get-banner-details?searchKey=95957&languageCode=en";
  Map<String, String> header = {
    "transId": "87863646846",
  };
  Map<String, dynamic> jsonData = await NetworkManager().get(url);
  BannerDetailModel model = BannerDetailModel.fromJson(jsonData);
  return model;
}
