import 'package:you_yemen/files/models/app_setting_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<bool> scGetAppSetting() async {
  Map<String, dynamic> map = await NetworkManager().get(scSettingUrl);

  AppSettingModel mode = AppSettingModel.fromJson(map);
  print("setting api response = ${mode}");

  StoreManager().appSetting = mode; //.responseMap?.settings?.others;
  if (mode.appShareLink != null) {
    return true;
  } else {
    return false;
  }

  // }
  // return false;
}
