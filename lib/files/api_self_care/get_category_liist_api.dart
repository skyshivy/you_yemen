import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';

getCategorylistApi() async {
  String url =
      "http://10.0.14.4:5892/selfcare/get-banner-list?channelId=$channelId&languageCode=${StoreManager().languageCode}";
  Map<String, String> header = {"transId": getTransactionId()};
  Map<String, dynamic> response =
      await NetworkManager().get(url, params: header);
}
