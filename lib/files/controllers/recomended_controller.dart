import 'package:get/state_manager.dart';

class RecomendedController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  List<String> tabList = [
    'square',
    'container',
    'than',
    'was',
    'needed',
    'BorderRadius'
  ];
  updateTabIndex(int index) {
    selectedTabIndex.value = index;
  }
}
