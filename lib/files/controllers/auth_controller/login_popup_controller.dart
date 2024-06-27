import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:you_yemen/files/api_self_care/generate_otp_api.dart';



import 'package:you_yemen/files/api_self_care/sc_generate_otp_api.dart';
import 'package:you_yemen/files/common/encryptor/aes_en_de_cryptor.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/generete_otp_model.dart';
import 'package:you_yemen/files/models/subscriber_validation_model.dart';
import 'package:you_yemen/files/sc_model/sc_generate_otp_model.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';

class LoginPopupController extends GetxController {
  RxString errorMessage = ''.obs;
  String msisdn = '';
  RxBool isVerifying = false.obs;
  RxBool enableButton = false.obs;
  String userData = '';
  int otpResendTimeout = 0;
  Rx<AuthTypes> authTypes = AuthTypes.showLoginPopup.obs;

  updateMsisdn(String value) {
    userData = '';
    otpResendTimeout = 0;
    errorMessage.value = '';
    if (value.length == msisdnLength) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
    msisdn = value;
  }

  onSubmitButtonAction() async {
    userData = '';
    otpResendTimeout = 0;
    errorMessage.value = '';
    if (msisdn.isEmpty) {
      errorMessage.value = enterValidMobileNumberStr;
      return;
    }
    if (msisdn.length < msisdnLength) {
      errorMessage.value = enterValidMobileNumberStr;
      return;
    }
    isVerifying.value = true;
    ScGenerateOtpModel mo = await scGenerateOtpApi(msisdn);
    print("generate otp = $mo");
    if (mo.respCode == 1000) {
      authTypes.value = AuthTypes.showOtpScreen;
      userData = mo.userData ?? '';
      otpResendTimeout = mo.otpResendTimeout ?? 0;
      AesEnDeCryptor().decryptWithAES(userData);
    } else {
      errorMessage.value = mo.message ?? someThingWentWrongStr;
    }
    isVerifying.value = false;
    return;
    /*
    SubscriberValidationModel model = await subscriberValidateApi(msisdn);
    if (model.statusCode == 'SC0000') {
      if (model.responseMap?.respCode == "SC0000") {
        GenerateOtpModel genModel = await generateOtpApi(msisdn);
        if (genModel.statusCode == "SC0000") {
          authTypes.value = AuthTypes.showOtpScreen;
        } else {
          errorMessage.value = model.message ?? someThingWentWrongStr;
        }
      } else if (model.responseMap?.respCode == "100") {
        print("it is a new user");
      } else if (model.responseMap?.respCode == "101") {
        errorMessage.value =
            model.responseMap?.respDesc ?? someThingWentWrongStr;
      } else {
        errorMessage.value = model.message ?? someThingWentWrongStr;
      }
    } else {
      errorMessage.value = model.message ?? someThingWentWrongStr;
    }
    isVerifying.value = false;
    */
  }
}
