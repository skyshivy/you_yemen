import 'package:you_yemen/files/models/confirm_otp_existing_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<ConfirmOtpExistingModel> confirmOtpApi(String msisdn, String otp) async {
  var params = {
    "otp": otp,
    "msisdn": msisdn,
    "language": StoreManager().language,
  };
  String url = confirmOtpExistingUrl;
  var parts = [];
  params.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');

  Map<String, dynamic> map = await NetworkManager().post(url, formData);
  ConfirmOtpExistingModel model = ConfirmOtpExistingModel.fromJson(map);
  return model;
}
