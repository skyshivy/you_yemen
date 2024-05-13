// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:you_yemen/files/api_calls/buy_a_friend_api.dart';
// import 'package:you_yemen/files/api_calls/get_tune_price.dart';
// import 'package:you_yemen/files/api_calls/tell_friend_api.dart';
// import 'package:you_yemen/files/models/get_tune_price_model.dart';
// import 'package:you_yemen/files/models/gift_model.dart';
// import 'package:you_yemen/files/models/tell_friend_model.dart';
// import 'package:you_yemen/files/models/tune_info_model.dart';
// import 'package:you_yemen/files/translation/strings.dart';

// class CustomPopupController extends GetxController {
//   final TextEditingController umsisdnTextController = TextEditingController();

//   final isLoading = false.obs; // Example observable variable
//   String msisdn = '';
//   String successMessage = '';
//   RxBool isSuccess = false.obs;

//   updateMsisdn(String value) {
//     msisdn = value;
//     errorMessage.value = '';
//   }

//   RxString errorMessage = ''.obs;

//   resetValue() async {
//     await Future.delayed(Duration(milliseconds: 100));
//     isLoading.value = false;
//     msisdn = '';
//     successMessage = '';
//     isSuccess.value = false;
//   }

//   getTonePrice(TuneInfo info) async {
//     isSuccess.value = false;
//     if (msisdn.isEmpty) {
//       errorMessage.value = 'Please enter a mobile number';
//       return;
//     }
//     errorMessage.value = '';
//     isLoading.value = true; // Set loading state to true
//     TonePriceModel model = await getTonePriceApi(msisdn, info);
//     if (model.statusCode == 'SC0000') {
//       String packName =
//           model.responseMap?.responseDetails?.first.packName ?? '';
//       print("Packname ========0 $packName ");
//       if (packName.isNotEmpty) {
//         try {
//           isLoading.value = true;
         
//           GiftModel giftModel = await buyaFriendApi(info, msisdn, packName);
//           if (giftModel.statusCode == 'SC0000') {
//             isLoading.value = false;
//             successMessage = giftModel.message ?? '';
//             isSuccess.value = true;
//           } else {
//             isLoading.value = false;
//             errorMessage.value = giftModel.message ?? someThingWentWrongStr;
//           }
//         } catch (e) {
//           isLoading.value = false;
//           errorMessage.value = someThingWentWrongStr;
//         }
//       } else {
//         errorMessage.value = someThingWentWrongStr;
//         isLoading.value = false;
//       }
//     } else {
//       errorMessage.value = model.message ?? someThingWentWrongStr;
//       isLoading.value = false;
//     }
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:you_yemen/files/api_calls/buy_a_friend_api.dart';
import 'package:you_yemen/files/api_calls/get_tune_price.dart';
import 'package:you_yemen/files/models/get_tune_price_model.dart';
import 'package:you_yemen/files/models/gift_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/translation/strings.dart';

class BuyAFriendPopupController extends GetxController {
  final TextEditingController umsisdnTextController = TextEditingController();

  final isLoading = false.obs;
  String msisdn = '';
  String successMessage = '';
  RxBool isSuccess = false.obs;

  updateMsisdn(String value) {
    msisdn = value;
    errorMessage.value = '';
  }

  RxString errorMessage = ''.obs;

  resetValue() async {
    await Future.delayed(Duration(milliseconds: 100));
    isLoading.value = false;
    msisdn = '';
    successMessage = '';
    isSuccess.value = false;
  }

 getTonePrice(TuneInfo info) async {
    isSuccess.value = false;
    if (msisdn.isEmpty) {
      errorMessage.value = 'Please enter a mobile number';
      return;
    }
    errorMessage.value = '';
    isLoading.value = true;

    try {
     
      TonePriceModel model = await getTonePriceApi(msisdn, info);

      if (model.statusCode == 'SC0000') {
        String packName = model.responseMap?.responseDetails?.first.packName ?? '';
        print("Packname ========0 $packName ");
        if (packName.isNotEmpty) {
         
          GiftModel giftModel = await buyaFriendApi(info, msisdn, packName);

          if (giftModel.statusCode == 'SC0000') {
            isLoading.value = false;
            successMessage = giftModel.message ?? '';
            isSuccess.value = true;
          } else {
            isLoading.value = false;
            errorMessage.value = giftModel.message ?? someThingWentWrongStr;
          }
        } else {
          errorMessage.value = someThingWentWrongStr;
          isLoading.value = false;
        }
      } else {
        errorMessage.value = model.message ?? someThingWentWrongStr;
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = someThingWentWrongStr;
    }
  }
}
