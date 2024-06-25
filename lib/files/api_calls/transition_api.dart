// import 'package:flutter/material.dart';

// import 'package:you_yemen/files/network_manager/network_manager.dart';

// import 'package:you_yemen/files/utility/urls.dart';



// String msisdn = "msisdn";
// String fromDate = "";
// String toDate = "";

// Future<void> makeAPICall(BuildContext context) async {
//   DateTime now = DateTime.now();
//   DateTime oneYearAgo = DateTime(now.year - 1, now.month, now.day);

//   String fromDateFormatted =
//       '${oneYearAgo.year}-${oneYearAgo.month}-${oneYearAgo.day}';
//   String toDateFormatted = '${now.year}-${now.month}-${now.day}';

//   fromDate = fromDateFormatted;
//   toDate = toDateFormatted;

//   final url = transactionUrl;
//    // 'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/view-transactions-scm?msisdn=$msisdn&fromDate=$fromDate&toDate=$toDate';
//   try {
//     Map<String, dynamic> response = await NetworkManager().get(url);
//     print('API Response: $response');
//   } catch (e) {
//     print('Error making API call: $e');
//   }
// }



  



// // const String msisdn = " msisdn";
// // const String fromDate = "fromDate";
// // const String toDate = " toDate";

// // Future<HistoryModel> makeAPICall(context) async {
// //   await makeAPICall(context);

// //   final url =
// //       'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/view-transactions-scm?msisdn=$msisdn&fromDate=$fromDate&toDate=$toDate';

//   // Map<String, dynamic> payload = {
//   //   'msisdn': 09975654677,
//   //   'fromDate': 13 - 05 - 2023,
//   //   'toDate': 13 - 05 - 2024
//   // };
// //   Map<String, dynamic> response = await NetworkManager().get(url);

// //   HistoryModel modal = HistoryModel.fromJson(response);
// //   return modal;
// // }