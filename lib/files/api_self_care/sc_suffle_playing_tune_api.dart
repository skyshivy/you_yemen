import 'dart:math';

import 'package:you_yemen/files/models/my_tune_shuffle_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<TuneSettingModel> scSufflePlayingTuneApi(bool activate) async {
  print("sufflePlayingTuneApi called");
  return TuneSettingModel();
  /*
  Random random = Random();
  var randomNumber = random.nextInt(1000000000);
  print(" randomNumber data is = 123");
  Map<String, dynamic> params = {
    'clientTxnId': '$randomNumber',
    'aPartyMsisdn': StoreManager().msisdn,
    'identifier': activate ? 'activate' : 'deactivate',
    'language': StoreManager().languageCode,
  };
  var parts = [];
  params.forEach((key, value) {
    parts.add('$key='
        '$value');
  });
  var formData = parts.join('&');
  Map<String, dynamic> res =
      await NetworkManager().post(tuneSuffleUrl, formData);
  TuneSettingModel model = TuneSettingModel.fromJson(res);
  return model;
  */
}
