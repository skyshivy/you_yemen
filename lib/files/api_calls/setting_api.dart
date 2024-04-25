import 'package:you_yemen/files/models/app_setting_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<bool> getAppSetting() async {
  Map<String, dynamic> map = await NetworkManager().get(settingUrl);

  AppSettingModel mode = AppSettingModel.fromJson(map);
  if (mode.statusCode == "SC0000") {
    StoreManager().others = mode.responseMap?.settings?.others;
    return true;
  }
  return false;
}
