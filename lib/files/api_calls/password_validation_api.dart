import 'dart:convert';
import 'dart:math';

import 'package:you_yemen/files/common/encryptor/cryptom.dart';
import 'package:you_yemen/files/models/password_validation_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<PasswordValidationModel> passowrdValidateApi(
    String securityCounter, String msisdn) async {
  var pass = hardCodePassword;
  var password = "$pass$securityCounter";
  print("password is here " + password);
  String encryptedPassword = Cryptom().text(password);
  print("encryptedPassword ==========================${encryptedPassword}");
  Random random = Random();
  int randomNumber = random.nextInt(1000000000);

  var params = {
    'type': 'ValidateDetails',
    'msisdn': msisdn,
    'languageId': StoreManager().languageCode,
    'clientTxnId': '$randomNumber',
    'securityCounter': securityCounter,
    'encryptedPassword': encryptedPassword,
    'versionCode': '1.2'
  };

  String url = passwordValidationUrl;

  var parts = [];
  params.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');
  Map<String, dynamic> map = await NetworkManager().post(url, formData);
  PasswordValidationModel model = PasswordValidationModel.fromJson(map);
  String details = json.encode(model);
  await StoreManager().setLoginDetails(details);

  return model;
}
