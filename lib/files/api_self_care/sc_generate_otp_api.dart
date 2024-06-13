import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/sc_model/sc_generate_otp_model.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<ScGenerateOtpModel> scGenerateOtpApi(String msisdn) async {
  String url = scGenerateOtpUrl;

  Map<String, dynamic> jsonMap = {
    'msisdn': msisdn,
    "transactionId": getTransactionId(),
  };

  Map<String, dynamic> map =
      await NetworkManager().post(url, null, jsonData: jsonMap);
  ScGenerateOtpModel model = ScGenerateOtpModel.fromJson(map);
  return model;
}
