import 'dart:html';

import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/confirm_otp_api.dart';
import 'package:you_yemen/files/api_calls/generate_otp_api.dart';
import 'package:you_yemen/files/api_calls/get_security_token.dart';
import 'package:you_yemen/files/api_calls/password_validation_api.dart';
import 'package:you_yemen/files/controllers/auth_controller/login_popup_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/confirm_otp_existing_model.dart';
import 'package:you_yemen/files/models/generete_otp_model.dart';
import 'package:you_yemen/files/models/get_security_token_model.dart';
import 'package:you_yemen/files/models/password_validation_model.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';

class OtpController extends GetxController {
  LoginPopupController con = Get.find();
  String otp = '';
  RxBool isVerifying = false.obs;
  RxString errorMesssage = ''.obs;
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
    ConfirmOtpExistingModel model = await confirmOtpApi(con.msisdn, otp);
    print("onConfirmOtpButtonAction ==== ${model.message}");
    if (model.statusCode == 'SC0000') {
      getSecurityToken();
      //con.authTypes.value = AuthTypes.showSuccessScreen;
    } else {
      errorMesssage.value = model.message ?? someThingWentWrongStr;
      isVerifying.value = false;
    }

    print("screen type ==== ${con.authTypes.value}");
  }

  getSecurityToken() async {
    GetSecurityTokenModel model = await getTokenApi();
    if (model.statusCode == "SC0000") {
      PasswordValidationModel passwordValidationModel =
          await passowrdValidateApi(
              model.responseMap?.securityCounter ?? '', con.msisdn);
      if (passwordValidationModel.statusCode == 'SC0000') {
        con.authTypes.value = AuthTypes.showSuccessScreen;
        isVerifying.value = false;
      } else {
        errorMesssage.value = someThingWentWrongStr;
        isVerifying.value = false;
      }
    } else {
      errorMesssage.value = someThingWentWrongStr;
      isVerifying.value = false;
    }
    isVerifying.value = false;
  }
}
