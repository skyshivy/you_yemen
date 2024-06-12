import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:you_yemen/files/api_self_care/sc_buy_tone_api.dart';
import 'package:you_yemen/files/api_self_care/sc_confirm_otp_api.dart';
import 'package:you_yemen/files/api_self_care/sc_content_price_api.dart';
import 'package:you_yemen/files/common/encryptor/aes_en_de_cryptor.dart';

import 'package:you_yemen/files/models/generic_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';

import 'package:you_yemen/files/sc_model/sc_confirm_otp_model.dart';
import 'package:you_yemen/files/sc_model/sc_content_price_model.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';

class OtpController extends GetxController {
  String msisdn = '';
  bool isBuyTune = false;
  String otp = '';
  RxBool isVerifying = false.obs;
  RxString errorMesssage = ''.obs;
  Function(String message)? onSuccess;
  TuneInfo? info;

  RxInt otpResendTimeout = 0.obs;
  updateOpt(String value) {
    errorMesssage.value = '';
    print("update otp = $value");
    otp = value;
  }

  onConfirmOtpButtonAction() async {
    if (otp.length < otpLength) {
      errorMesssage.value = enterValidOtpStr;
      return;
    }
    errorMesssage.value = '';
    isVerifying.value = true;

    String encOtp = AesEnDeCryptor().aesEnc(otp);
    ScConfirmOtpModel mo = await scConfirmOtpApi(msisdn, encOtp);
    if (mo.respCode == 0) {
      StoreManager().setMsisdn(msisdn);
      await StoreManager().setLoginDetails(mo);
      if (isBuyTune) {
        await _getContentPrice();
      } else {
        isVerifying.value = false;
        if (onSuccess != null) {
          onSuccess!(mo.message ?? '');
        }
      }
    } else {
      errorMesssage.value = mo.message ?? someThingWentWrongStr;
    }
    isVerifying.value = false;
  }

  _getContentPrice() async {
    ScContentPriceModel model = await scContentPriceApi(msisdn);
    if (model.respCode == 0) {
      String offerName = model.contentDetails?.offerName ?? '';
      String offerStatus = model.contentDetails?.offerStatus ?? '';

      _setTone(offerName);
    } else {
      errorMesssage.value = model.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }
  }

  _setTone(String offerCode) async {
    GenericModel model = await scbuyTuneApi(offerCode, info?.toneId ?? '');
    if (model.respCode == 0) {
      isVerifying.value = false;
      if (onSuccess != null) {
        onSuccess!(model.message ?? '');
      }
    } else {
      errorMesssage.value = model.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }
  }

/*
    return;
    ConfirmOtpExistingModel model = await confirmOtpApi(msisdn, otp);
    print("onConfirmOtpButtonAction ==== ${model.message}");
    if (model.statusCode == 'SC0000') {
      //getSecurityToken();
      //con.authTypes.value = AuthTypes.showSuccessScreen;
    } else {
      errorMesssage.value = model.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }
  }

  getSecurityToken() async {
    GetSecurityTokenModel model = await getTokenApi();
    if (model.statusCode == "SC0000") {
      PasswordValidationModel passwordValidationModel =
          await passowrdValidateApi(
              model.responseMap?.securityCounter ?? '', msisdn);
      if (passwordValidationModel.statusCode == 'SC0000') {
        if (isBuyTune) {
          _getTonePrice(info ?? TuneInfo());
        } else {
          if (onSuccess != null) {
            onSuccess!(passwordValidationModel.message ?? '');
          }
          isVerifying.value = false;
        }
      } else {
        errorMesssage.value = someThingWentWrongStr;
        isVerifying.value = false;
      }
    } else {
      errorMesssage.value = someThingWentWrongStr;
      isVerifying.value = false;
    }
  }

  _getTonePrice(TuneInfo info) async {
    TonePriceModel model = await getTonePriceApi(msisdn, info);
    if (model.statusCode == 'SC0000') {
      String packName =
          model.responseMap?.responseDetails?.first.packName ?? '';
      if (packName.isNotEmpty) {
        _setTone(info, packName);
      } else {
        errorMesssage.value = 'no pack name  or empty';
        isVerifying.value = false;
      }
    } else {
      errorMesssage.value = model.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }
  }

  _setTone(TuneInfo info, String packName) async {
    BuyTuneModel model = await setToneApi(info, packName);
    if (model.statusCode == 'SC0000') {
      if (onSuccess != null) {
        onSuccess!(model.message ?? '');
      }
      isVerifying.value = false;
    } else {
      errorMesssage.value = model.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }
  }
  */
}
