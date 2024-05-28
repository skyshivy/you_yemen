import 'package:get/get.dart';

class AdvancedSettingController extends GetxController {
  var selectedOption = 'All Callers'.obs;
  var showDropdown = false.obs;
  var callerDropdownValue = ''.obs;
  var showCallerOptions = false.obs;
  var textDropdownValue = ''.obs;
  var showTextDropdown = false.obs;
  RxString hoveredOption = RxString('');
  void setSelectedOption(String value) {
    selectedOption.value = value;
  }

  void toggleDropdown() {
    showDropdown.value = !showDropdown.value;
  }

  void setCallerDropdownValue(String value) {
    callerDropdownValue.value = value;
  }

  void setHoveredOptionString(String option) {
    hoveredOption.value = option;
  }

  void clearHoveredOptionString() {
    hoveredOption.value = '';
  }

  void toggleCallerOptions() {
    showCallerOptions.value = !showCallerOptions.value;
  }

  void setTextDropdownValue(String value) {
    textDropdownValue.value = value;
  }

  void toggleTextDropdown() {
    showTextDropdown.value = !showTextDropdown.value;
  }
}
