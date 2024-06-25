//import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:you_yemen/files/api_self_care/generate_otp_api.dart';

import 'package:you_yemen/files/api_self_care/sc_set_tone_api.dart';


import 'package:you_yemen/files/api_gokul/get_content_price_api.dart';

import 'package:you_yemen/files/api_self_care/sc_confirm_otp_api.dart';
import 'package:you_yemen/files/api_self_care/sc_generate_otp_api.dart';

import 'package:you_yemen/files/common/encryptor/aes_en_de_cryptor.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/buy_tune_model.dart';
import 'package:you_yemen/files/models/generete_otp_model.dart';
import 'package:you_yemen/files/models/get_tune_price_model.dart';
import 'package:you_yemen/files/models/subscriber_validation_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/sc_model/sc_generate_otp_model.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';

class BuyController extends GetxController {
  RxString errorMessage = ''.obs;
  String successMessage = '';
  String msisdn = '';
  RxBool isVerifying = false.obs;
  TuneInfo? info;
  int otpResendTimeout = 0;
  Rx<AuthTypes> authTypes = AuthTypes.showLoginPopup.obs;
  updateMsisdn(String value) {
    errorMessage.value = '';
    msisdn = value;
  }

  onConfirmButtonAction() async {
    if (StoreManager().isLoggedIn) {
      isVerifying.value = true;
      msisdn = StoreManager().msisdn;
      await _getTonePrice();
      isVerifying.value = false;
      return;
    }
    if (msisdn.length < msisdnLength) {
      errorMessage.value = enterValidMobileNumberStr;

      return;
    }
    isVerifying.value = true;

    ScGenerateOtpModel mo = await scGenerateOtpApi(msisdn);
    if (mo.respCode == 1000) {
      AesEnDeCryptor().decryptWithAES(mo.userData ?? '');
      otpResendTimeout = mo.otpResendTimeout ?? 0;
      authTypes.value = AuthTypes.showOtpScreen;
      isVerifying.value = false;
    } else {
      errorMessage.value = mo.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }

    return;
    // SubscriberValidationModel model = await subscriberValidateApi(msisdn);
    // if (model.statusCode == 'SC0000') {
    //   if (model.responseMap?.respCode == "SC0000") {
    //     if (StoreManager().isLoggedIn) {
    //       _getTonePrice();
    //     } else {
    //       GenerateOtpModel genModel = await generateOtpApi(msisdn);
    //       if (genModel.statusCode == "SC0000") {
    //         authTypes.value = AuthTypes.showOtpScreen;
    //         isVerifying.value = false;
    //       } else {
    //         errorMessage.value = model.message ?? someThingWentWrongStr;
    //         isVerifying.value = false;
    //       }
    //     }
    //   } else if (model.responseMap?.respCode == "100") {
    //     print("it is a new user");
    //   } else if (model.responseMap?.respCode == "101") {
    //     errorMessage.value =
    //         model.responseMap?.respDesc ?? someThingWentWrongStr;
    //     isVerifying.value = false;
    //   } else {
    //     errorMessage.value = model.message ?? someThingWentWrongStr;
    //     isVerifying.value = false;
    //   }
    // } else {
    //   errorMessage.value = model.message ?? someThingWentWrongStr;
    //   isVerifying.value = false;
    // }
  }

  Future<void> _getTonePrice() async {
    TonePriceModel model = await getContentPriceApi(info?.toneId ?? '');
    //TonePriceModel model = await getTonePriceApi(msisdn, info ?? TuneInfo());
    if (model.respCode == 0) {
      String packName = model.toneDetails?.packName ?? '';
      //responseMap?.responseDetails?.first.packName ?? '';
      if (packName.isEmpty) {
        errorMessage.value = "No pack name or null";
      } else {
        await _setTune(info ?? TuneInfo(), packName);
      }
    } else {
      errorMessage.value = model.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }
    return;
  }

  Future<void> _setTune(TuneInfo info, String packName) async {
    BuyTuneModel model = await setToneApi(info, packName);
    if (model.respCode == 0) {
      successMessage = model.message ?? '';
      authTypes.value = AuthTypes.showSuccessScreen;
      isVerifying.value = false;
    } else {
      errorMessage.value = model.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }
    return;
  }
}
