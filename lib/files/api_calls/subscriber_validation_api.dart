import 'dart:math';

import 'package:you_yemen/files/models/subscriber_validation_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<SubscriberValidationModel> subscriberValidateApi(String msisdn) async {
  var url = subscriberValidationUrl;
  var parts = [];
  Random random = Random();
  int randomNumber = random.nextInt(1000000000);
  var myPost = {
    "language": StoreManager().language,
    "clientTxnId": "$randomNumber",
    "type": "CheckMsisdnSendOTP"
  };
  myPost.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');
  print("\nformed data is \n$formData\n");
  Map<String, dynamic> map =
      await NetworkManager().post(url, formData, msisdn: msisdn);
  SubscriberValidationModel model = SubscriberValidationModel.fromJson(map);
  print("============ validate ");
  return model;
}
