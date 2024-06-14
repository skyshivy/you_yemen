import 'package:you_yemen/files/models/banner_detail_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<BannerDetailModel> bannerDetailApi(String key, String type,
    {int pageNo = 0}) async {
  //pagePerCount
  String url = bannerDetailUrl +
      "language=${StoreManager().language}&pageNo=$pageNo&pagePerCount=$pagePerCount&type=$type&searchKey=$key";
  Map<String, dynamic> jsonData = await NetworkManager().get(url);
  BannerDetailModel model = BannerDetailModel.fromJson(jsonData);
  return model;
}
