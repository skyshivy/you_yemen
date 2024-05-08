import 'package:http/http.dart' as http;
import 'package:you_yemen/files/model/edit_modal.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';


Future<Editmodal> saveChanges() async{
  final url='https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/edit-profile';


 Map<String, dynamic> jsonData = {"clientTxnId": "773237680",
    "identifier": "UpdateUserName",
    "aPartyMsisdn": "0832120732",
    "servType": "UPDATE_USER_NAME",
    "language": "English",
    "name": "0832120732",};
     
  var parts = [];
  jsonData.forEach((key, value) {
    parts.add('${Uri.encodeQueryComponent(key)}='
        '${Uri.encodeQueryComponent(value)}');
  });
  var formData = parts.join('&');
  await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> jsonMap =
      await NetworkManager().post(url, formData);
  Editmodal modal = Editmodal.fromJson(jsonMap);
  print("modal =${modal.message}");
 
  return modal;
  
}






