import 'package:you_yemen/files/models/app_setting_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<bool> getAppSetting() async {
  Map<String, dynamic> map = await NetworkManager().get(scSettingUrl);

  AppSettingModel mode = AppSettingModel.fromJson(map);

  StoreManager().appSetting = mode; //.responseMap?.settings?.others;
  return true;
  // }
  // return false;
}
