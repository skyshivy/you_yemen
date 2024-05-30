import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdvancedSettingController extends GetxController {
  var selectedCallerOption = 'all_callers'.obs;
  var selectedTimeOption = RxnString();
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  var selectedRepeatOption = 'None'.obs;
  final msisdnController = TextEditingController();

  void setSelectedCallerOption(String value) {
    selectedCallerOption.value = value;
  }

  void setSelectedTimeOption(String value) {
    selectedTimeOption.value = value;
  }

  void setStartTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: startTime.value,
    );
    if (pickedTime != null) {
      startTime.value = pickedTime;
    }
  }

  void setEndTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: endTime.value,
    );
    if (pickedTime != null) {
      endTime.value = pickedTime;
    }
  }

  void setStartDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: startTime.value,
      );
      if (pickedTime != null) {
        startDate.value = pickedDate;
        startTime.value = pickedTime;
      }
    }
  }

  void setEndDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: endDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: endTime.value,
      );
      if (pickedTime != null) {
        endDate.value = pickedDate;
        endTime.value = pickedTime;
      }
    }
  }

  void setSelectedRepeatOption(String value) {
    selectedRepeatOption.value = value;
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm(); 
    return format.format(dt);
  }

  String formatDateTime(DateTime date, TimeOfDay time) {
    final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    final format = DateFormat.yMMMd().add_jm();
    return format.format(dt);
  }
}
