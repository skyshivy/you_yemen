import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/my_tune_shuffle_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<TuneSettingModel> setDefaultToneApi(
    String toneId, String packName) async {
  String url = setDefaultToneUrl;
  Map<String, dynamic> jsonData = {
    'msisdn': StoreManager().msisdn,
    'clientTxnId': getTransactionId(),
    'toneId': toneId,
    'priority': 0,
    'channelId': channelId,
    'serviceId': 21,
    'packName': packName,
    'language': StoreManager().languageCode
  };

  var parts = [];
  jsonData.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent("$value")}');
  });
  var formData = parts.join('&');

  Map<String, dynamic> jsonResp = await NetworkManager().post(url, formData);
  TuneSettingModel model = TuneSettingModel.fromJson(jsonResp);
  return model;
}
