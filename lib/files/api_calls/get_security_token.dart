import 'package:you_yemen/files/models/get_security_token_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';

Future<GetSecurityTokenModel> getTokenApi() async {
  Map<String, dynamic> map = await NetworkManager().get(getSecurityTokenUrl);
  GetSecurityTokenModel model = GetSecurityTokenModel.fromJson(map);
  return model;
}
