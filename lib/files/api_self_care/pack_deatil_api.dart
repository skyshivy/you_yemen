import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

packDeatilApi() async {
  String url = scpackDetailsUrl;
  Map<String, dynamic> jsonMap = {
    "msisdn": "8182020000",
  };
  await NetworkManager().post(url, null, jsonData: jsonMap);
}
