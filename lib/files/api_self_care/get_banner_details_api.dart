import 'package:you_yemen/files/common/transaction_id.dart';
import 'package:you_yemen/files/models/banner_detail_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<BannerDetailModel> scGetBannerDetailsApi(String searchkey) async {
  String url =
      "${scGetBannerDetailUrl}searchKey=$searchkey&languageCode=${StoreManager().languageSort}";
  Map<String, String> header = {"transId": getTransactionId()};
  Map<String, dynamic> response =
      await NetworkManager().get(url, params: header);
  BannerDetailModel model = BannerDetailModel.fromJson(response);
  return model;
}
