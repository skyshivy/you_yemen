import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DesktopAdvancedSettingController extends GetxController {
  var selectedCallerOption = 'all_callers'.obs;
  var selectedTimeOption = Rx<String?>(null);
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var selectedRepeatOption = 'None'.obs;
  var msisdnController = TextEditingController();

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); // "6:00 AM"
    return format.format(dt);
  }

  String formatDateTime(DateTime date, TimeOfDay time) {
    final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    final format = DateFormat.yMMMd().add_jm(); // "Jan 1, 2023 6:00 AM"
    return format.format(dt);
  }
}
