import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

addToWishlistApi(TuneInfo info) async {
  String url = addToShuffleUrl;
  Map<String, dynamic> jsonMap = {
    "msisdn": StoreManager().msisdn,
    'contentId': info.toneId ?? '',
    "contentPath": info.path ?? '',
    'previewImage': info.toneIdpreviewImageUrl ?? '',
  };
}
