import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/get_mytune_list_api.dart';
import 'package:you_yemen/files/api_calls/get_playing_list_api.dart';
import 'package:you_yemen/files/api_calls/mytunes_api.dart';

import 'package:you_yemen/files/api_calls/suffle_playing_tune_api.dart';
import 'package:you_yemen/files/common/warning_popup/warning_popup.dart';
import 'package:you_yemen/files/models/my_tune_model.dart';
import 'package:you_yemen/files/models/my_tune_shuffle_model.dart';
import 'package:you_yemen/files/models/playint_tune_model.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/translation/strings.dart';

class MyTuneController extends GetxController {
  RxBool isLoadingPlayingList = false.obs;
  RxBool isLoadingMyTuneList = false.obs;
  RxString playingError = ''.obs;
  RxString myTuneError = ''.obs;
  RxBool isShuffle = false.obs;
  RxBool isChangeSuffleStatus = false.obs;
  RxList<PlayingToneList> playingList = <PlayingToneList>[].obs;
  RxList<Listtone> myTuneList = <Listtone>[].obs;
  RxList<PlayingToneDetail> newPlayingList = <PlayingToneDetail>[].obs;

  @override
  void onInit() {
    super.onInit();
    //makeApiCall();
  }

  makeApiCall() async {
    _getPlayingList();
    _getMytuneList();
  }

  _getPlayingList() async {
    if (isLoadingPlayingList.value) {
      return;
    }
    playingError.value = '';
    isLoadingPlayingList.value = true;
    PlayingTuneModel model = await getPlayingListApi();
    //await scMyTunesListApi();
    print("SKY1 newPlayingList = ${model.playingToneList}");
    if (model.respCode == '0') {
      playingList.value = model.playingToneList ?? [];
      newPlayingList.value = await createANewList(model.playingToneList ?? []);
      print("SKY newPlayingList = ${newPlayingList}");
      if (playingList.isNotEmpty) {
        playingList.removeAt(0);
      }
      //
      if (playingList.isEmpty) {
        playingError.value = emptyToneListStr.tr;
      }
      checkSwitch(playingList);
    } else {
      playingError.value = model.message ?? someThingWentWrongStr.tr;
    }

    isLoadingPlayingList.value = false;
  }

  Future<List<PlayingToneDetail>> createANewList(
      List<PlayingToneList> listToneApk) async {
    if (listToneApk.isEmpty) return [];
    List<PlayingToneDetail> newList = [];
    for (var element in listToneApk) {
      if (element.toneDetails != null) {
        PlayingToneDetail item = element.toneDetails ?? PlayingToneDetail();
        //for (PlayingToneDetail item in element.toneDetails ?? []) {
        if (item.customiseStartDate != '0') {
          print("SKY NONE");

          newList.add(createNewDetail(
              item,
              "None",
              (element.msisdnB == null) ? element.serviceName : element.msisdnB,
              repeatType.none));
        }
        if (item.endDayMonthly != '0') {
          print("SKY MONTHLY");
          newList.add(createNewDetail(
              item,
              "Monthly",
              (element.msisdnB == null) ? element.serviceName : element.msisdnB,
              repeatType.monthly));
        }
        if (item.yearlyEndMonth != '0') {
          print("SKY YEARLY");

          newList.add(createNewDetail(
              item,
              "Yearly",
              (element.msisdnB == null) ? element.serviceName : element.msisdnB,
              repeatType.yearly));
        }
        if (item.startTimeWeekly == "00:00:00" &&
            item.endTimeWeekly != "00:00:00") {
          print("SKY full day ");
          newList.add(createNewDetail(
              item,
              "Full day",
              (element.msisdnB == null) ? element.serviceName : element.msisdnB,
              repeatType.fullday));
        }
        if (item.endTimeWeekly != "00:00:00" &&
            item.startTimeWeekly != "00:00:00") {
          print("SKY Custom time base ");
          newList.add(createNewDetail(
              item,
              "Custom time",
              (element.msisdnB == null) ? element.serviceName : element.msisdnB,
              repeatType.customTime));
        }
        //}
      }
    }
    print("SKY total items are ${newList.length}");
    return newList;
  }

  PlayingToneDetail createNewDetail(PlayingToneDetail item, String type,
      String? callerType, repeatType cellType) {
    PlayingToneDetail td = PlayingToneDetail();

    td.toneId = item.toneId;
    td.toneName = item.toneName;
    td.toneUrl = item.toneUrl;
    td.previewImageUrl = item.previewImageUrl;
    td.albumName = item.albumName;
    td.artistName = item.artistName;
    td.price = item.price;
    td.createdDate = item.createdDate;
    td.isShuffle = item.isShuffle;
    td.status = item.status;
    td.endTime = item.endTime;
    td.startTime = item.startTime;
    td.endDayMonthly = item.endDayMonthly;
    td.endTimeMonthly = item.endTimeMonthly;
    td.startDayMonthly = item.startDayMonthly;
    td.startTimeMonthly = item.startTimeMonthly;
    td.endTimeWeekly = item.endTimeWeekly;
    td.startTimeWeekly = item.startTimeWeekly;
    td.weeklyDays = item.weeklyDays;
    td.customiseEndDate = item.customiseEndDate;
    td.customiseEndTime = item.customiseEndTime;
    td.customiseStartDate = item.customiseStartDate;
    td.customiseStartTime = item.customiseStartTime;
    td.yearlyEndDay = item.yearlyEndDay;
    td.yearlyEndMonth = item.yearlyEndMonth;
    td.yearlyEndTime = item.yearlyEndTime;
    td.yearlyStartDay = item.yearlyStartDay;
    td.yearlyStartMonth = item.yearlyStartMonth;
    td.yearlyStartTime = item.yearlyStartTime;
    td.toneIdStreamingUrl = item.toneIdStreamingUrl;
    td.toneIdpreviewImageUrl = item.toneIdpreviewImageUrl;
    td.type = cellType;
    td.typeStr = type;
    td.callerType = callerType;
    return td;
  }

  checkSwitch(List<PlayingToneList> list) {
    if (list.isNotEmpty) {
      isShuffle.value = false;
      for (var item in list) {
        if (item.serviceName == 'AllCaller') {
          isShuffle.value = (item.packDetails?.isShuffle == 'T') ? true : false;
        }
      }
    }
  }

  changeSuffleStatus() async {
    if (isShuffle.value) {
      openWarning(suffleDisableMessageStr.tr, () async {
        _suffleApiCall(false);
      });
    } else {
      openWarning(doYouWantToEnableShuffleStr.tr, () async {
        _suffleApiCall(true);
      });
    }

    print("Change sufle state = $isShuffle");
  }

  _suffleApiCall(bool enable) async {
    isChangeSuffleStatus.value = true;
    TuneSettingModel model = await sufflePlayingTuneApi(enable);
    isChangeSuffleStatus.value = false;
    if (model.statusCode == 'SC0000') {
      isShuffle.value = !isShuffle.value;
      _getPlayingList();
    } else {}
  }

  _getMytuneList() async {
    if (isLoadingMyTuneList.value) {
      return;
    }
    myTuneError.value = '';
    isLoadingMyTuneList.value = true;
    //scGetPlayingListApi();
    MyTuneModel model = await getMyTuneListApi();
    if (model.respCode == '0') {
      myTuneList.value = model.listtones ?? [];
      if (myTuneList.isEmpty) {
        myTuneError.value = emptyToneListStr.tr;
      }
      // for (var it in myTuneList) {
      //   print("sky======== ${it.toneName}");
      //   print("sky=======cons= ${it.contentName}");
      // }
    } else {
      myTuneError.value = model.message ?? someThingWentWrongStr.tr;
    }
    isLoadingMyTuneList.value = false;
  }

  String timeType(PlayingToneDetail info) {
    PlayingToneDetail? info1 = info; //toneDetails?.first;
    // if ((info1?.startTimeWeekly != '00:00:00') ||
    //     (info1?.endTimeWeekly != '00:00:00')) {
    //   return customStr;
    // }
    if (info1?.weeklyDays == '0') {
      return fullDayStr.tr;
    } else {
      return confirmStr.tr;
    }
  }

  String statusType(PlayingToneDetail info) {
    PlayingToneDetail? info1 = info; //.toneDetails?.first;
    if (info1.isShuffle == "T") {
      return shuffleStr.tr;
    } else {
      return activeStr.tr;
    }
  }

  String getCallersType(PlayingToneDetail info) {
    return info.callerType ?? '';
  }

  String fromDate(PlayingToneDetail info1) {
    if (info1.type == repeatType.yearly) {
      return "${info1.yearlyStartDay}/${info1.yearlyStartMonth}, ${getCustomTime(info1.yearlyStartTime ?? "")}";
    } else if (info1.type == repeatType.monthly) {
      return "${getDayOfSuffix(int.parse(info1.startDayMonthly ?? '0'))}, ${getCustomTime(info1.startTimeMonthly ?? "")}";
    } else if (info1.type == repeatType.none) {
      return "${customDate(info1.customiseStartDate ?? "")}, ${getCustomTime(info1.customiseStartTime ?? "")}";
    } else if (info1.type == repeatType.fullday) {
      return "00:00";
    } else {
      return getCustomTime(info1.startTimeWeekly ?? "");
    }

    // ToneDetail? info1 = info; //.toneDetails?.first;
    // if (info1?.endDayMonthly != "0") {
    //   return "${getDayOfSuffix(int.parse(info1?.startDayMonthly ?? '0'))}, ${getCustomTime(info1?.startTimeWeekly ?? "")}";
    // } else if (info1?.yearlyEndDay != "0") {
    //   return "${info1?.yearlyStartDay}/${info1?.yearlyStartMonth}, ${getCustomTime(info1?.yearlyStartTime ?? "")}";
    // } else if (info1?.customiseEndDate != '0') {
    //   return "${customDate(info1?.customiseStartDate ?? "")}, ${getCustomTime(info1?.customiseStartTime ?? "")}";
    // } else if (info1?.endTimeWeekly != null) {
    //   return getCustomTime(info1?.startTimeWeekly ?? '');
    // } else {
    //   return 'no time 1';
    // }
  }

  String toDate(PlayingToneDetail info) {
    PlayingToneDetail? info1 = info; //toneDetails?.first;

    if (info1.type == repeatType.yearly) {
      return "${info1.yearlyEndDay}/${info1.yearlyEndMonth}, ${getCustomTime(info1.yearlyEndTime ?? "")}";
    } else if (info1.type == repeatType.monthly) {
      return "${getDayOfSuffix(int.parse(info1.endDayMonthly ?? '0'))}, ${getCustomTime(info1.endTimeMonthly ?? "")}";
    } else if (info1.type == repeatType.none) {
      return "${customDate(info1.customiseEndDate ?? "")}, ${getCustomTime(info1.customiseEndTime ?? "")}";
    } else if (info1.type == repeatType.fullday) {
      return "23:59";
    } else {
      return getCustomTime(info1.endTimeWeekly ?? "");
    }
    // if (info1?.endDayMonthly != "0") {
    //   return "${getDayOfSuffix(int.parse(info1?.endDayMonthly ?? '0'))}, ${getCustomTime(info1?.endTimeWeekly ?? "")}";
    // } else if (info1?.yearlyEndDay != "0") {
    //   return "${info1?.yearlyEndDay}/${info1?.yearlyEndMonth}, ${getCustomTime(info1?.yearlyEndTime ?? "")}";
    // } else if (info1?.customiseEndDate != '0') {
    //   return "${customDate(info1?.customiseEndDate ?? "")}, ${getCustomTime(info1?.customiseEndTime ?? "")}";
    // } else if (info1?.endTimeWeekly != null) {
    //   return getCustomTime(info1?.endTimeWeekly ?? '');
    // } else {
    //   return 'no time 1';
    // }
  }

  String customDate(String date) {
    List<String> lst = date.split('-');
    return "${lst[2]}/${lst[1]}/${lst[0]}";
  }

  String getDayOfSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return '${dayNum}th Day';
    }

    switch (dayNum % 10) {
      case 1:
        return '${dayNum}st Day';
      case 2:
        return '${dayNum}nd Day';
      case 3:
        return '${dayNum}rd Day';
      default:
        return '${dayNum}th Day';
    }
  }

  String getCustomTime(String time) {
    List<String> list = time.split(":");
    return "${list[0]}:${list[1]}";
  }

  int repeatYearlySelectedType(PlayingToneDetail info) {
    PlayingToneDetail? info1 = info; //.toneDetails?.first;
    if (info1.type == repeatType.monthly) {
      return 1;
    } else if (info1.type == repeatType.yearly) {
      return 2;
    } else if (info1.type == repeatType.none) {
      return 0;
    } else {
      return -1;
    }
  }

  bool isHideRepeatView(PlayingToneDetail info) {
    PlayingToneDetail? info1 = info; //.toneDetails?.first;
    if ((info1.type == repeatType.monthly) ||
        (info1.type == repeatType.yearly) ||
        (info1.type == repeatType.none)) {
      return false;
    }
    return true;
  }

  deletePlayingTune(PlayingToneDetail info) {
    print("Delete plating tune");
  }

  deleteMyTune(TuneInfo info) {
    print("Delete My tune");
  }
}
