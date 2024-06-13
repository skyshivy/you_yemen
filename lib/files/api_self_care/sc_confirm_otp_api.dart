import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/sc_model/sc_confirm_otp_model.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<ScConfirmOtpModel> scConfirmOtpApi(
    String msisdn, String encryptedOtp) async {
  Map<String, dynamic> jsonData = {
    "msisdn": msisdn,
    "encryptedOtp": encryptedOtp,
  };

  Map<String, dynamic> map =
      await NetworkManager().post(scConfirmOtpUrl, null, jsonData: jsonData);
  ScConfirmOtpModel mo = ScConfirmOtpModel.fromJson(map);
  return mo;
}
