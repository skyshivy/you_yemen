import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/constants.dart';
import 'package:you_yemen/files/utility/urls.dart';

artistTunesApi(String artistKey, {int pageNo = 0}) async {
  String url = artistTunesUrl +
      "language=${StoreManager().language}&artistKey=$artistKey&sortBy=Order_By&alignBy=ASC&pageNo=$pageNo&searchLanguage=${StoreManager().language}&perPageCount=$pagePerCount";
}
