import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

packDeatilApi() async {
  String url = "http://10.0.10.33:9089/selfcare/setting-servic/get-subscription";
 Map<String, dynamic> jsonMap = {
               "msisdn": "8182020000",
              //  StoreManager().msisdn
               };
  await NetworkManager().post(url, null, jsonData: jsonMap);
}

