import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

getBannerlistApi() async {
  String url =
      "http://10.0.14.4:5892/selfcare/get-banner-list?channelId=$channelId&languageCode=${StoreManager().languageCode}";
  Map<String, String> header = {
    "transId": "87863646846",
  };
  Map<String, dynamic> response =
      await NetworkManager().get(url, params: header);
}
