//import 'package:flutter/material.dart';
import 'dart:convert';

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
    String toDate = '13-05-2024';
    DateTime now = DateTime.now();
    DateTime oneYearAgo = DateTime(now.year - 1, now.month, now.day);

    String fromDateFormatted =
        '${oneYearAgo.year}-${oneYearAgo.month}-${oneYearAgo.day}';
    String toDateFormatted = '${now.year}-${now.month}-${now.day}';

    final url =
        'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/view-transactions-scm?msisdn=$msisdn&fromDate=$fromdate&toDate=$toDate';

    try {
      //Map<String, dynamic> response = await NetworkManager().get(url);
      Map<String, dynamic> response = json.decode(_resp); //_resp
      HistoryModel model = HistoryModel.fromJson(response);
      list.value = model.responseMap?.transactionDetailsList ?? [];
      apiResponses.add(response);
      print('API Response: $response');
    } catch (e) {
      print('Error making API call: $e');
    }
  }
}

String _resp = """{
    "responseMap": {
        "transactionDetailsList": [
            {
                "subscriptionDate": "2024-06-24 09:00:03",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "0",
                "nextBillingDate": "2024-06-25 09:00:03",
                "channel": "NI_PUSH",
                "toneType": "JINGLE",
                "transactionType": "Activated",
                "englishToneName": "Cherish you CHO",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-24 09:00:03",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "100",
                "nextBillingDate": "2024-06-25 09:00:03",
                "channel": "NI_PUSH",
                "toneType": "N/A",
                "transactionType": "Activated",
                "englishToneName": "Tune Buffet",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-24 08:59:35",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "0",
                "nextBillingDate": "2024-06-24 09:14:41",
                "channel": "SMS",
                "toneType": "JINGLE",
                "transactionType": "Deactivated",
                "englishToneName": "Tune Buffet",
                "validityDays": "N/A"
            },
            {
                "subscriptionDate": "2024-06-24 08:57:05",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "0",
                "nextBillingDate": "2024-06-24 09:14:41",
                "channel": "SMS",
                "toneType": "N/A",
                "transactionType": "Deactivated",
                "englishToneName": "Mini Pack",
                "validityDays": "N/A"
            },
            {
                "subscriptionDate": "2024-06-24 08:26:14",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "13.0",
                "nextBillingDate": "2024-06-25 08:26:14",
                "channel": "SMS",
                "toneType": "N/A",
                "transactionType": "Renewed",
                "englishToneName": "Chit Nay Pyi CHO",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-24 08:26:09",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "13.0",
                "nextBillingDate": "2024-06-25 08:26:09",
                "channel": "USSD",
                "toneType": "N/A",
                "transactionType": "Renewed",
                "englishToneName": "NWAY MA V1",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-24 08:25:55",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "13.0",
                "nextBillingDate": "2024-06-25 08:25:55",
                "channel": "IVR",
                "toneType": "N/A",
                "transactionType": "Renewed",
                "englishToneName": "NGAR NINT KO MONE TAL CHORUS",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-24 05:50:12",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "47.0",
                "nextBillingDate": "2024-06-25 05:50:12",
                "channel": "IVR",
                "toneType": "N/A",
                "transactionType": "Renewed",
                "englishToneName": "Mini Pack",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-23 23:46:05",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "13.0",
                "nextBillingDate": "2024-06-24 23:46:05",
                "channel": "USSD",
                "toneType": "N/A",
                "transactionType": "Activated",
                "englishToneName": "NWAY MA V1",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-23 23:45:22",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "13.0",
                "nextBillingDate": "2024-06-24 23:45:22",
                "channel": "SMS",
                "toneType": "N/A",
                "transactionType": "Activated",
                "englishToneName": "Chit Nay Pyi CHO",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-23 23:44:40",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "47",
                "nextBillingDate": "2024-06-24 23:44:40",
                "channel": "IVR",
                "toneType": "N/A",
                "transactionType": "Activated",
                "englishToneName": "Mini Pack",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-23 23:44:40",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "13.0",
                "nextBillingDate": "2024-06-24 23:44:40",
                "channel": "IVR",
                "toneType": "N/A",
                "transactionType": "Activated",
                "englishToneName": "NGAR NINT KO MONE TAL CHORUS",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-23 23:43:29",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "0",
                "nextBillingDate": "2024-06-24 00:14:40",
                "channel": "SMS",
                "toneType": "N/A",
                "transactionType": "Deactivated",
                "englishToneName": "Tune Buffet",
                "validityDays": "N/A"
            },
            {
                "subscriptionDate": "2024-06-23 23:42:58",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "0",
                "nextBillingDate": "2024-06-24 23:42:58",
                "channel": "OBD",
                "toneType": "N/A",
                "transactionType": "Activated",
                "englishToneName": "MONE TAL SO PAY MAE NEW VERSION CHORUS",
                "validityDays": "1"
            },
            {
                "subscriptionDate": "2024-06-23 23:30:49",
                "aParty": "9420784096",
                "bParty": "N/A",
                "callCharge": "0",
                "nextBillingDate": "2024-06-24 00:14:40",
                "channel": "SMS",
                "toneType": "N/A",
                "transactionType": "Deactivated",
                "englishToneName": "Tune Buffet",
                "validityDays": "N/A"
            }
        ]
    },
    "respTime": "Jun 24, 2024 11:44:32 AM",
    "statusCode": "SC0000"
}""";
