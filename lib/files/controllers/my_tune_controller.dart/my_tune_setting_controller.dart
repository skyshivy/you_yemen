import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:you_yemen/files/api_calls/add_suffle_api.dart';
import 'package:you_yemen/files/api_calls/get_pack_status_api.dart';
import 'package:you_yemen/files/api_calls/set_default_tone_api.dart';
import 'package:you_yemen/files/api_calls/tune_setting_dedicated_api.dart';
import 'package:you_yemen/files/api_calls/tune_setting_fullday_api.dart';
import 'package:you_yemen/files/common/warning_popup/warning_popup.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/custom_calender_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/menu_model.dart';
import 'package:you_yemen/files/models/my_tune_shuffle_model.dart';
import 'package:you_yemen/files/models/pack_status_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/constants.dart';

class MyTuneSettingController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt whomIndex = 0.obs;
  RxInt whenIndex = 0.obs;
  RxString bParty = ''.obs;
  String _packName = '';
  RxInt yearRepeatindex = 0.obs;
  RxString fromTimeTitle = ''.obs;
  RxString toTimeTitle = ''.obs;
  RxString fromTimeValue = ''.obs;
  RxString toTimeValue = ''.obs;
  RxString whenButtonTitle = ''.obs;
  String _selectedDayStr = '0';
  CallerType callerType = CallerType.allCaller;
  TimeType timeType = TimeType.fullDay;
  RepeatType repeatType = RepeatType.none;

  Function()? onSuccess = null;
  RxList<String> selectedDays = <String>['', '', '', '', '', '', ''].obs;
  late TuneInfo info;
  CustomCalenderController calCont = Get.find();
  @override
  void onInit() {
    getPackDetail();
    super.onInit();
    whenButtonTitle.value = fullDayStr.tr;
  }

  getPackDetail() async {
    PackStatusModel model = await getPackStatusApi();
    if (model.statusCode == "SC0000") {
      _packName = model.responseMap?.packStatusDetails?.packName ?? '';
    }
  }

  resetData() {
    bParty.value = '';
    isLoading.value = false;
    whomIndex.value = 0;
    whenIndex.value = 0;
    yearRepeatindex.value = 0;
    fromTimeTitle.value = '';
    toTimeTitle.value = '';
    fromTimeValue.value = '';
    toTimeValue.value = '';
    whenButtonTitle.value = '';
    _selectedDayStr = '0';
    callerType = CallerType.allCaller;
    timeType = TimeType.fullDay;
    repeatType = RepeatType.none;

    selectedDays.value = <String>['', '', '', '', '', '', ''];
    whenButtonTitle.value = fullDayStr.tr;
  }

  updateBparty(String msisdn) {
    bParty.value = msisdn;
  }

  updateYearTab(int index) {
    yearRepeatindex.value = index;
    if (index == 0) {
      repeatType = RepeatType.none;
    } else if (index == 1) {
      repeatType = RepeatType.monthly;
    } else {
      repeatType = RepeatType.yearly;
    }
  }

  updateWhom(int index) {
    whomIndex.value = index;
    if (index == 0) {
      callerType = CallerType.allCaller;
    } else if (index == 1) {
      callerType = CallerType.dedicated;
    } else {
      callerType = CallerType.shuffle;
    }
  }

  openFromTime() {
    print("Func called from time");
  }

  openToTime() {
    print("Func called to time");
  }

  openFromTimeDate(BuildContext context) {
    print("Func called from time and date");
    _fromCalender(context);
  }

  openToTimeDate(BuildContext context) {
    print("Func called to time and date");
    _toCalender(context);
  }

  updateWhen(MenuModel p0) {
    //whenIndex.value = index;
    if (p0.title == selectTimeDateStr.tr) {
      whenIndex.value = 2;
      fromTimeTitle.value = startDateStr.tr;
      toTimeTitle.value = endDateStr.tr;
      fromTimeValue.value = selectTimeDateStr;
      toTimeValue.value = selectTimeDateStr;
      whenButtonTitle.value = selectTimeDateStr.tr;
      timeType = TimeType.dateBase;
    } else if (p0.title == selectTimeStr.tr) {
      fromTimeTitle.value = startTimeStr.tr;
      toTimeTitle.value = endTimeStr.tr;
      whenIndex.value = 1;
      whenButtonTitle.value = selectTimeStr.tr;
      fromTimeValue.value = selectTimeStr.tr;
      toTimeValue.value = selectTimeStr.tr;
      timeType = TimeType.timeBase;
    } else {
      timeType = TimeType.fullDay;
      whenIndex.value = 0;
      whenButtonTitle.value = fullDayStr.tr;
    }
  }

  _fromCalender(BuildContext context) async {
    print("_fromCalender");
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021, 8),
        lastDate: DateTime(2101));

    final TimeOfDay? timePicker = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: childWidget!);
        });
  }

  _toCalender(BuildContext context) async {
    print("_toCalender");
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021, 8),
        lastDate: DateTime(2101));
    final TimeOfDay? timePicker = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: childWidget!);
        });
  }

  bool _getSelectedDays({isShowAlert = true}) {
    List<String> newLst = [];
    for (var element in selectedDays) {
      if (element.isNotEmpty) {
        newLst.add(element);
      }
    }
    _selectedDayStr = newLst.join(',');
    if (_selectedDayStr.isEmpty) {
      _selectedDayStr = '0';
      if (isShowAlert) {
        _warningAlert(selectRepeatDaysStr.tr);
      }

      return false;
    }

    print("Selected days = $newLst into string = $_selectedDayStr");
    return true;
  }

  confirmButtonTap() {
    if (callerType == CallerType.allCaller) {
      if (timeType == TimeType.dateBase) {
        if (repeatType == RepeatType.none) {
          print("Make all caller date base None");

          allCallerRepeatNoneSetting();
        } else if (repeatType == RepeatType.monthly) {
          print("Make all caller date base Monthly");
          allCallerRepeatMonthlySetting();
        } else {
          print("Make all caller date base Yearly");
          allCallerRepeatYearlySetting();
        }
      } else if (timeType == TimeType.timeBase) {
        print("Make all caller time base");
        allCallertTimeBaseSetting();
      } else {
        allCallerFulldayTuneSetting();
        print("Make all caller Fullday");
      }
    } else if (callerType == CallerType.dedicated) {
      if (bParty.value.length < msisdnLength) {
        openWarning(enterValidMobileNumberStr.tr, () => null,
            isSingleButton: true, buttonTitle: okStr.tr);
        return;
      }
      print("valid msisdn ${bParty.value}");

      if (timeType == TimeType.dateBase) {
        if (repeatType == RepeatType.none) {
          print("Make Dedicated caller date base None");
          //allCallerRepeatNoneSetting();
          dedicatedRepeatNoneBaseSetting();
        } else if (repeatType == RepeatType.monthly) {
          print("Make Dedicated caller date base Monthly");
          dedicatedMonthlyRepeatSetting();
        } else {
          print("Make Dedicated caller date base Yearly");
          dedicatedYearlyRepeatSetting();
        }
      } else if (timeType == TimeType.timeBase) {
        print("Make Dedicated caller time base");
        dedicatedTimeBaseSetting();
      } else {
        print("Make Dedicated caller Fullday");
        dedicatedFulldaySetting();
      }
    } else {
      print("Make Shuffle caller ");
      addToShuffle();
    }
  }

  allCallerFulldayTuneSetting() async {
    bool status = _getSelectedDays();
    if (status) {
      isLoading.value = true;
      TuneSettingModel model =
          await fulldayApi(_selectedDayStr, info.toneId ?? '');
      onComplition(model);
    }
  }

  allCallertTimeBaseSetting() async {
    bool status = _getSelectedDays();
    if (!status) return;
    isLoading.value = true;
    bool isValid = await _isValidTimeDifference(calCont.fromHour.value,
        calCont.fromMin.value, calCont.toHour.value, calCont.toMin.value);

    if (isValid) {
      isLoading.value = true;
      TuneSettingModel model = await fulldayTimeBaseApi(
          _selectedDayStr, info.toneId ?? '', calCont.fromTime, calCont.toTime);
      onComplition(model);
    }
  }

  allCallerRepeatNoneSetting() async {
    bool status = await _isValidDateDifference();
    if (!status) return;
    isLoading.value = true;
    DateTime fy = calCont.fromDate ?? DateTime.now();
    DateTime ty = calCont.toDate ?? DateTime.now();
    TuneSettingModel model = await fulldayRepeatBaseNoneApi(
        info.toneId ?? '',
        _getDateInString(fy),
        _getDateInString(ty),
        _getTimeInString(fy),
        _getTimeInString(ty));
    onComplition(model);
  }

  allCallerRepeatMonthlySetting() async {
    bool status = await _isValidDateDifference();
    if (!status) return;
    isLoading.value = true;
    DateTime fy = calCont.fromDate ?? DateTime.now();
    DateTime ty = calCont.toDate ?? DateTime.now();
    String toneId = info.toneId ?? '';
    String fd = '${fy.day}';
    String td = '${ty.day}';

    TuneSettingModel model = await fulldayRepeatBaseMonthlyApi(
        toneId, fd, td, _getTimeInString(fy), _getTimeInString(ty));
    onComplition(model);
  }

  allCallerRepeatYearlySetting() async {
    bool status = await _isValidDateDifference();
    if (!status) return;
    isLoading.value = true;
    DateTime fy = calCont.fromDate ?? DateTime.now();
    DateTime ty = calCont.toDate ?? DateTime.now();
    String toneId = info.toneId ?? '';
    TuneSettingModel model = await fulldayRepeatBaseYearlyApi(toneId, fy, ty);
    onComplition(model);
  }

  dedicatedFulldaySetting() async {
    bool status = _getSelectedDays();
    if (status) {
      isLoading.value = true;

      TuneSettingModel model = await fulldayDedicatedApi(
          info.toneId ?? '', bParty.value, _packName, _selectedDayStr);
      onComplition(model);
    }
  }

  dedicatedTimeBaseSetting() async {
    bool status = _getSelectedDays(isShowAlert: false);
    bool isValid = await _isValidTimeDifference(calCont.fromHour.value,
        calCont.fromMin.value, calCont.toHour.value, calCont.toMin.value);
    if (isValid) {
      isLoading.value = true;

      TuneSettingModel model = await fulldayTimeBaseDedicatedApi(
          info.toneId ?? '',
          bParty.value,
          _packName,
          _selectedDayStr,
          calCont.fromTime,
          calCont.toTime);

      onComplition(model);
    }
  }

  dedicatedRepeatNoneBaseSetting() async {
    //bool status = _getSelectedDays(isShowAlert: false);

    bool isValid = await _isValidDateDifference();
    if (isValid) {
      isLoading.value = true;
      String toneId = info.toneId ?? '';
      TuneSettingModel model = await fulldayRepeatBaseNoneDedicatedApi(
          toneId, bParty.value, _packName, calCont.fromDate!, calCont.toDate!);
      onComplition(model);
    }
  }

  dedicatedMonthlyRepeatSetting() async {
    bool isValid = await _isValidDateDifference();
    if (isValid) {
      isLoading.value = true;
      String toneId = info.toneId ?? '';
      TuneSettingModel model = await fulldayRepeatBaseMonthlyDedicatedApi(
          toneId, bParty.value, _packName, calCont.fromDate!, calCont.toDate!);
      onComplition(model);
    }
  }

  dedicatedYearlyRepeatSetting() async {
    bool isValid = await _isValidDateDifference();
    if (isValid) {
      isLoading.value = true;
      String toneId = info.toneId ?? '';
      TuneSettingModel model = await fulldayRepeatBaseYearlyDedicatedApi(
          toneId, bParty.value, _packName, calCont.fromDate!, calCont.toDate!);
      // (
      //     toneId, bParty.value, _packName, calCont.fromDate!, calCont.toDate!);
      onComplition(model);
    }
  }

  setDefaultTone() async {
    isLoading.value = true;
    String toneId = info.toneId ?? '';

    TuneSettingModel model = await setDefaultToneApi(toneId, _packName);
    onComplition(model);
  }

  addToShuffle() async {
    isLoading.value = true;
    String toneId = info.toneId ?? '';
    TuneSettingModel model = await addToShuffleApi(toneId);
    onComplition(model);
  }

  onComplition(TuneSettingModel model) {
    isLoading.value = false;
    if (model.statusCode == 'SC0000') {
      print("Api call successs");
      _successAlert(yourTuneLiveStr.tr);
    } else {
      _errorAlert(model.message ?? someThingWentWrongStr.tr);
      print("Error = ${model.message}");
    }
  }

  _warningAlert(String message) {
    openWarning(message, () => null,
        type: PopupType.warning, isSingleButton: true, buttonTitle: okStr.tr);
  }

  _successAlert(String message) async {
    openWarning(
      message,
      () {
        if (onSuccess != null) {
          onSuccess!();
        }
      },
      type: PopupType.success,
      isSingleButton: true,
      buttonTitle: okStr.tr,
    );
  }

  _errorAlert(String message) {
    openWarning(message, () => null,
        type: PopupType.error, isSingleButton: true, buttonTitle: okStr.tr);
  }

  String _getTimeInString(DateTime date) {
    final DateFormat formatter = DateFormat('HH:mm');
    final String formatted = formatter.format(date);
    print("converted time = $formatted");
    return formatted;
  }

  String _getDateInString(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }

  Future<bool> _isValidDateDifference() async {
    try {
      DateTime fy = calCont.fromDate ?? DateTime.now();
      DateTime ty = calCont.toDate ?? DateTime.now();
      var fh = calCont.fromHour.value;
      var fm = calCont.fromMin.value;
      var th = calCont.toHour.value;
      var tm = calCont.toMin.value;

      DateTime fromTime1 = DateTime(fy.year, fy.month, fy.day, fh, fm);
      DateTime toTime1 = DateTime(ty.year, ty.month, ty.day, th, tm);
      print("from time $fromTime1");
      print("to time $toTime1");

      bool isValidTIme = fromTime1.isBefore(toTime1);

      print("Is valid date and time $isValidTIme");
      if (isValidTIme) {
        return true;
      } else {
        _warningAlert(invalidTimeMessageStr.tr);
        return false;
      }
    } catch (e) {
      _warningAlert(someThingWentWrongStr.tr);
      return false;
    }
  }

  Future<bool> _isValidTimeDifference(
      int fromH, int fromM, int toH, int toM) async {
    try {
      DateTime now = DateTime.now();
      DateTime fromTime1 = DateTime(now.year, now.month, now.day, fromH, fromM);
      DateTime toTime1 = DateTime(now.year, now.month, now.day, toH, toM);

      print("Time diff = ${toTime1.difference(fromTime1).inMinutes}");
      if ((toTime1.difference(fromTime1).inMinutes) > 0) {
        return true;
      } else {
        _warningAlert(invalidTimeMessageStr.tr);
        return false;
      }
    } catch (e) {
      _warningAlert(someThingWentWrongStr.tr);
      return false;
    }
  }
}
