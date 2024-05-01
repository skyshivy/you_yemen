import 'dart:html';

import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/confirm_otp_api.dart';
import 'package:you_yemen/files/api_calls/generate_otp_api.dart';
import 'package:you_yemen/files/api_calls/get_security_token.dart';
import 'package:you_yemen/files/api_calls/get_tune_price.dart';
import 'package:you_yemen/files/api_calls/password_validation_api.dart';
import 'package:you_yemen/files/api_calls/set_tone_api.dart';
import 'package:you_yemen/files/controllers/auth_controller/login_popup_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/buy_tune_model.dart';
import 'package:you_yemen/files/models/confirm_otp_existing_model.dart';
import 'package:you_yemen/files/models/generete_otp_model.dart';
import 'package:you_yemen/files/models/get_security_token_model.dart';
import 'package:you_yemen/files/models/get_tune_price_model.dart';
import 'package:you_yemen/files/models/password_validation_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
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
    ConfirmOtpExistingModel model = await confirmOtpApi(msisdn, otp);
    print("onConfirmOtpButtonAction ==== ${model.message}");
    if (model.statusCode == 'SC0000') {
      getSecurityToken();
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
}
