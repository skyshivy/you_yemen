import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AdvancedSettingController extends GetxController {
  var selectedCallerOption = 'all_callers'.obs;
  var selectedTimeOption = Rx<String?>(null);
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var selectedRepeatOption = 'None'.obs;
  final TextEditingController msisdnController = TextEditingController();
}




