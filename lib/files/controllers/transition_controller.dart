//import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/models/transition_history_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';

class TransitionScreenController extends GetxController {
  List<Map<String, dynamic>> apiResponses = [];

  RxList<TransactionDetailsList> list = <TransactionDetailsList>[].obs;

//   Future<void> makeAPICall() async {
//     const String msisdn = "09975654677";
//     const String fromDate = "13-05-2023";
//     const String toDate = "13-05-2024";

//     final url =
//         'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/view-transactions-scm?msisdn=$msisdn&fromDate=$fromDate&toDate=$toDate';

//     try {
//       Map<String, dynamic> response = await NetworkManager().get(url);
//       HistoryModel model = HistoryModel.fromJson(response);
//     list.value= model.responseMap?.transactionDetailsList ?? [];
//       apiResponses.add(response);
//       print('API Response: $response');
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }

  Future<void> makeAPICall() async {
    String msisdn = StoreManager().msisdn;
    String fromdate = '13-05-2023';
    String toDate= '13-05-2024' ; 
    DateTime now = DateTime.now();
    DateTime oneYearAgo = DateTime(now.year - 1, now.month, now.day);

    String fromDateFormatted =
        '${oneYearAgo.year}-${oneYearAgo.month}-${oneYearAgo.day}';
    String toDateFormatted = '${now.year}-${now.month}-${now.day}';

    final url =
        'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/view-transactions-scm?msisdn=$msisdn&fromDate=$fromdate&toDate=$toDate';

    try {
      Map<String, dynamic> response = await NetworkManager().get(url);
      HistoryModel model = HistoryModel.fromJson(response);
      list.value = model.responseMap?.transactionDetailsList ?? [];
      apiResponses.add(response);
      print('API Response: $response');
    } catch (e) {
      print('Error making API call: $e');
    }
  }
}


