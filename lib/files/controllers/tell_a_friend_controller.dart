import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/get_tune_price.dart';
import 'package:you_yemen/files/models/get_tune_price_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/translation/strings.dart';

class CustomPopupController extends GetxController {
  final TextEditingController umsisdnTextController = TextEditingController();

  final isLoading = false.obs; // Example observable variable
  RxString errorMessage = '' as RxString;
  getTonePrice(String msisdn, TuneInfo info) async {
    errorMessage.value = '';
    isLoading.value = true; // Set loading state to true
    TonePriceModel model = await getTonePriceApi(msisdn, info);
    if (model.statusCode == 'SC0000') {
    } else {
      errorMessage.value = model.message ?? someThingWentWrongStr;
    }
    isLoading.value = false; // Set loading state to false after API call
  }
}
