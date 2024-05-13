import 'package:you_yemen/files/models/gift_model.dart';
import 'package:you_yemen/files/models/tell_friend_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

const String CRBT_WEEKLY = " CRBT_WEEKLY";
const String MEMORY_CHORUS = "Memory Chorus";

Future<GiftModel> buyaFriendApi(
    TuneInfo info, String bParty, String packName) async {
  String url =
      'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/send-gift';

  Map<String, dynamic> body = {
    'msisdnA': StoreManager().msisdn,
    'msisdnB': 9923964710,
    'toneId': info.toneId,
    'channel': 1,
    'username': 9420784096,
    'language': 1,
    'packName': CRBT_WEEKLY,
    'toneName': MEMORY_CHORUS,
  };

  var parts = [];
  body.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value.toString())}');
  });
  var formData = parts.join('&');
  Map<String, dynamic> map = await NetworkManager().post(url, formData);
  GiftModel model = GiftModel.fromJson(map);
  print("buy a tune api is ");
  return model;
}
 /*     
  'msisdnA': 9420784096,
'msisdnB': 9880849438,
'toneId': 1580601201,
'channel': 1,
'username': 9420784096,
'language': 1,
'packName': 'CRBT_MONTHLY',
'toneName': 'Memory Chorus', 
                  */