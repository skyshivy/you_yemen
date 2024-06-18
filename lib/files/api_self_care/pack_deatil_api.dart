import 'package:you_yemen/files/network_manager/network_manager.dart';
                      

packDeatilApi() async {
  String url = "http://10.0.10.33:9089/selfcare/setting-servic/get-subscription";
 Map<String, dynamic> jsonMap = {
               "msisdn": "8182020000",
              //  StoreManager().msisdn
               };
  await NetworkManager().post(url, null, jsonData: jsonMap);
}

