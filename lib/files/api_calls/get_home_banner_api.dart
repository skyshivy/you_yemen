import 'package:you_yemen/files/models/home_banner_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<HomeBannerModel> getHomeBannerApi() async {
  Map<String, dynamic> map = await NetworkManager().get(homeBannerUrl);
  HomeBannerModel model = HomeBannerModel.fromJson(map);
  return model;
}
