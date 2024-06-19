import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/models/home_banner_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<GenericModel> getRecommendationSongApi() async {
  String url =
      "http://10.0.14.4:5892/selfcare/get-recommendations?languageCode=en&identifier=Recommendations";

  Map<String, String> header = {
    "transId": getTransactionId(),
  };
  Map<String, dynamic> response =
      await NetworkManager().get(url, params: header);
  GenericModel model = GenericModel.fromJson(response);
  return model;
}
