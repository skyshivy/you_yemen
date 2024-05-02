import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:you_yemen/files/api_calls/generate_otp_api.dart';
import 'package:you_yemen/files/api_calls/subscriber_validation_api.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/generete_otp_model.dart';
import 'package:you_yemen/files/models/subscriber_validation_model.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';

class LoginPopupController extends GetxController {
  RxString errorMessage = ''.obs;
  String msisdn = '';
  RxBool isVerifying = false.obs;
  RxBool enableButton = false.obs;
  Rx<AuthTypes> authTypes = AuthTypes.showLoginPopup.obs;

  updateMsisdn(String value) {
    errorMessage.value = '';
    if (value.length == msisdnLength) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
    msisdn = value;
  }

  onSubmitButtonAction() async {
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
  }
}