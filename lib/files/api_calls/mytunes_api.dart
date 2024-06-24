import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/my_tunes_model.dart';
import 'package:you_yemen/files/models/playing_tune_list_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<PlayingListModel> scGetPlayingListApi() async {
  final msisdn = StoreManager().msisdn;

  if (msisdn == Null || msisdn.isEmpty) {
    throw Exception("msisdn is null or empty");
  }

  Map<String, String> queryParameters = {
    "clientTxId": getTransactionId(),
    "languageCode": StoreManager().languageSort,
    "msisdn": StoreManager().msisdn,
    "channelId": channelId,
    "rbtMode": "0",
    "activityId": "4",
    "serviceId": "1"
  };

  await Future.delayed(Duration(seconds: 1));

  try {
    final response = await NetworkManager()
        .post(scMyTunesUrl, null, jsonData: queryParameters);

    PlayingListModel modal = PlayingListModel.fromJson(response);
    print("modal = ${modal.message}");
    return modal;
  } catch (e) {
    print("Error: $e");
    throw e;
  }
}

Future<MyTuneListModel> scMyTunesListApi() async {
  final msisdn = StoreManager().msisdn;

  if (msisdn == Null || msisdn.isEmpty) {
    throw Exception("msisdn is null or empty");
  }

  Map<String, String> queryParameters = {
    "clientTxId": getTransactionId(),
    "languageCode": StoreManager().languageSort,
    "msisdn": StoreManager().msisdn,
    "channelId": channelId,
    "rbtMode": "400",
    "activityId": "4",
    "serviceId": "1"
  };

  await Future.delayed(Duration(seconds: 1));

  try {
    final response = await NetworkManager()
        .post(scMyTunesUrl, null, jsonData: queryParameters);

    //Map<String, dynamic> responseMap = jsonDecode(response);
    MyTuneListModel modal = MyTuneListModel.fromJson(response);
    print("modal = ${modal.message}");
    return modal;
  } catch (e) {
    print("Error: $e");
    throw e;
  }
}
