import 'package:get/get.dart';

class CustomCalenderController extends GetxController {
  DateTime? fromDate;
  DateTime? toDate;
  RxInt fromHour = 0.obs;
  RxInt fromMin = 0.obs;
  RxInt toHour = 0.obs;
  RxInt toMin = 0.obs;
  String fromDateTime = "";
  String toDateTime = "";
  String fromTime = "";
  String toTime = "";
  DateTime? tempfromDate;
  DateTime? temptoDate;
  RxInt tempfromHour = 0.obs;
  RxInt tempfromMin = 0.obs;
  RxInt temptoHour = 0.obs;
  RxInt temptoMin = 0.obs;

  @override
  void onInit() {
    resetValue();
    resetTimeValue();
    super.onInit();
  }

  resetTimeValue() {
    final now = DateTime.now();
    fromHour.value = now.hour;
    toHour.value = now.hour;
    fromMin.value = now.minute;
    toMin.value = now.minute;
  }

  resetValue() {
    final now = DateTime.now();
    fromDate = now;
    toDate = DateTime(now.year, now.month, now.day);
    fromHour.value = now.hour;
    toHour.value = now.hour;
    fromMin.value = now.minute;
    toMin.value = now.minute;
    tempfromHour.value = now.hour;
    temptoHour.value = now.hour;
    tempfromMin.value = now.minute;
    temptoMin.value = now.minute;
  }

  confirmFromTimeButtonAction() {
    fromHour.value = tempfromHour.value;
    fromMin.value = tempfromMin.value;

    String time =
        " ${fromHour.toString().padLeft(2, '0')}:${fromMin.toString().padLeft(2, '0')}";
    fromTime = time;
  }

  confirmToTimeButtonAction() {
    toHour.value = temptoHour.value;
    toMin.value = temptoMin.value;

    String time =
        " ${toHour.toString().padLeft(2, '0')}:${toMin.toString().padLeft(2, '0')}";
    toTime = time;
  }

  confirmFromDateButtonAction() {
    fromDate = tempfromDate;
    // toDate = temptoDate;
    fromHour.value = tempfromHour.value;
    fromMin.value = tempfromMin.value;
    String date =
        "${fromDate?.day.toString().padLeft(2, '0')}/${fromDate?.month.toString().padLeft(2, '0')}/${fromDate?.year}";
    String time =
        " ${fromHour.toString().padLeft(2, '0')}:${fromMin.toString().padLeft(2, '0')}";
    fromDateTime = date + time;
    if (fromDate != null) {
      DateTime f = fromDate!; //DateTime.now();

      fromDate = DateTime(f.year, f.month, f.day, tempfromHour.value,
          tempfromMin.value); //fromDate.h
    }
    // toHour.value = temptoHour.value;
    // toMin.value = temptoMin.value;
  }

  confirmToDateButtonAction() {
    //fromDate = tempfromDate;
    toDate = temptoDate;
    // fromHour.value = tempfromHour.value;
    // fromMin.value = tempfromMin.value;
    toHour.value = temptoHour.value;
    toMin.value = temptoMin.value;
    String date =
        "${toDate?.day.toString().padLeft(2, '0')}/${toDate?.month.toString().padLeft(2, '0')}/${toDate?.year}";
    String time =
        " ${toHour.toString().padLeft(2, '0')}:${toMin.toString().padLeft(2, '0')}";
    toDateTime = date + time;
    if (toDate != null) {
      DateTime t = toDate!; //DateTime.now();

      toDate = DateTime(t.year, t.month, t.day, temptoHour.value,
          temptoMin.value); //fromDate.h
    }
  }

  updateFromTempAction(DateTime? date) {
    tempfromDate = date;
  }

  updateFromTempHour(int value) {
    print("From Hour =$value");
    tempfromHour.value = value;
  }

  updateFromTempMin(int value) {
    print("From Minute =$value");
    tempfromMin.value = value;
  }

  updateToTempAction(DateTime? date) {
    temptoDate = date;
  }

  updateToTempHour(int value) {
    print("To Hour =$value");
    temptoHour.value = value;
  }

  updateToTempMin(int value) {
    print("To Minute =$value");
    temptoMin.value = value;
  }
}
