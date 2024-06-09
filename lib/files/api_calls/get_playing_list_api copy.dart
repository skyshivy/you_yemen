import 'package:get/get.dart';
import 'package:you_yemen/files/models/playint_tune_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<PlayingTuneModel> getPlayingListApi({int pageNo = 0}) async {
  String langId = StoreManager().languageCode;
  String msisdn = StoreManager().msisdn;

  String url =
      '$playingTuneListUrl&language=$langId&msisdn=$msisdn&startIndex=$pageNo&endIndex=$pagePerCount';
  Map<String, dynamic>? map = await NetworkManager().get(url);

  PlayingTuneModel model = PlayingTuneModel.fromJson(map);
  return model;
}