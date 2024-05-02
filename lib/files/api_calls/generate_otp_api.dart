import 'package:you_yemen/files/models/generete_otp_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<GenerateOtpModel> generateOtpApi(String msisdn) async {
  var url = generateOtpUrl;
  Map<String, String> headers = {
    'os': 'ios',
    'language': StoreManager().language,
    'deviceId': deviceId,
    'msisdn': msisdn
  };

  Map<String, dynamic> map1 = await NetworkManager().get(url, params: headers);

  GenerateOtpModel model = GenerateOtpModel.fromJson(map1);
  return model;
}
