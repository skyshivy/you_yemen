import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:you_yemen/files/api_gokul/get_content_price_api.dart';

import 'package:you_yemen/files/models/get_tune_price_model.dart';
import 'package:you_yemen/files/models/tell_friend_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/translation/strings.dart';

class CustomPopupController extends GetxController {
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

    TonePriceModel model = await getContentPriceApi(
        info.toneId ?? ''); //getTonePriceApi(msisdn, info);
    if (model.respCode == 0) {
      String packName = model.toneDetails?.packName ?? '';
      print("Packname ========0 $packName ");
      if (packName.isNotEmpty) {
        print("Packname ========3 $packName ");
        TellFreindModel tellFreindModel = TellFreindModel();
        //await tellFriendApi(info, msisdn, packName);
        if (tellFreindModel.statusCode == 'SC0000') {
          isLoading.value = false;
          successMessage = tellFreindModel.message ?? '';
          isSuccess.value = true;
        } else {
          print("Packname ========2 $packName ");
          isLoading.value = false;
          errorMessage.value = model.message ?? someThingWentWrongStr;
        }
      } else {
        print("Packname ========1 $packName ");
        errorMessage.value = someThingWentWrongStr;
        isLoading.value = false;
      }
    } else {
      errorMessage.value = model.message ?? someThingWentWrongStr;
      isLoading.value = false;
    }
  }
}
