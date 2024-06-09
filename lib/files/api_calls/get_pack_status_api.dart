import 'package:get/get.dart';
import 'package:you_yemen/files/models/pack_status_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<PackStatusModel> getPackStatusApi() async {
  String url =
      '${getPackStatusUrl}msisdn=${StoreManager().msisdn}&language=${StoreManager().languageCode}';

  Map<String, dynamic>? jsonResponse = await NetworkManager().get(url);

  PackStatusModel packStatusModel = PackStatusModel.fromJson(jsonResponse);
  return packStatusModel;
}
