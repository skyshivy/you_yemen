import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

packDeatilApi() async {
  String url = getSubscriptionUrl;
 Map<String, dynamic> jsonMap = {
               "msisdn": StoreManager().msisdn};
  await NetworkManager().post(url, null, jsonData: jsonMap);
}

