import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:you_yemen/files/api_calls/faq_api.dart';
import 'package:you_yemen/files/models/faq_model.dart';

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
      var faqData = await getFaqDetailApi();
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