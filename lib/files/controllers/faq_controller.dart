import 'package:get/get.dart';

import 'package:you_yemen/files/api_self_care/sc_faq_api.dart';

import 'package:you_yemen/files/models/faq_screen_model.dart';

class FaqController extends GetxController {
  var isLoading = true.obs;
  var error = ''.obs;
  var faqList = <FaqList>[].obs;

  @override
  void onInit() {
    fetchFaqList();
    super.onInit();
  }

  void fetchFaqList() async {
    try {
      isLoading(true);
      var faqData = await scGetFaqDetailApi();
      if (faqData.faqList!.isEmpty) {
        error('No data available');
      } else {
        faqList.assignAll(faqData.faqList!);
      }
    } catch (e) {
      error('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
