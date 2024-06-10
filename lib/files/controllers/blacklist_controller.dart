import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:you_yemen/files/api_calls/blacklist_api.dart';
import 'package:you_yemen/files/models/blacklist_model.dart';

class ViewBlacklistController extends GetxController {
  List<Map<String, String>> blacklist = <Map<String, String>>[].obs;
  var nameController = TextEditingController();

  var mobileNumberController = TextEditingController();
  var errorMessage = ''.obs;
  RxList<BPartyDetailsList> blackList = <BPartyDetailsList>[].obs;

  RxBool isLoading = false.obs;
  viewBlackList() async {
    isLoading.value = true;
    // ViewBlackListModel model = await viewBlackListApi();
    // blackList.value = model.responseMap?.bPartyDetailsList ?? [];
    //print('Blacklist areee:${blackList.length}');
    isLoading.value = false;
  }

  // onBlockButtonAction() {
  //   print("onBlockButtonAction");
  //   addToBlackListApi(blacklist);
  // }

  void addToBlacklist() {
    errorMessage.value = '';
    if (nameController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty) {
      if (_isValidMobileNumber(mobileNumberController.text)) {
        blacklist.add({
          "bPartyName": "${nameController.text}",
          "bPartyMsisdn": "${mobileNumberController.text}",
        });

        print("blacklist  ===== ${blacklist.length}");
        nameController.clear();
        mobileNumberController.clear();
      } else {
        errorMessage.value = 'Only digits are allowed';
      }
    }
  }

  bool _isValidMobileNumber(String mobileNumber) {
    return RegExp(r'^[0-9]+$').hasMatch(mobileNumber);
  }

  void removeFromBlacklist(int index) {
    blacklist.removeAt(index);
  }
}
