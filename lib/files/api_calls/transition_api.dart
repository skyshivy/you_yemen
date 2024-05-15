
import 'package:flutter/material.dart';
import 'package:you_yemen/files/models/transition_history_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/utility/urls.dart';


const String msisdn = " msisdn";
const String fromDate = "fromDate";
const String toDate = " toDate";

void makeAPICall( context) async {
  final url =  'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/view-transactions-scm?msisdn=$msisdn&fromDate=$fromDate&toDate=$toDate';
     Map<String, dynamic> payload = {
    'msisdn': 09975654677,
    'fromDate': 13 - 05 - 2023,
    'toDate': 13 - 05 - 2024
  };
     
      
      Map<String, dynamic> response = await NetworkManager().get(url);

     
      print('API Response: $response');
    }  
     
      
   
  



// const String msisdn = " msisdn";
// const String fromDate = "fromDate";
// const String toDate = " toDate";

// Future<HistoryModel> makeAPICall(context) async {
//   await makeAPICall(context);

//   final url =
//       'https://funtone.ooredoo.com.mm/security/Middleware/api/adapter/v1/crbt/view-transactions-scm?msisdn=$msisdn&fromDate=$fromDate&toDate=$toDate';

  // Map<String, dynamic> payload = {
  //   'msisdn': 09975654677,
  //   'fromDate': 13 - 05 - 2023,
  //   'toDate': 13 - 05 - 2024
  // };
//   Map<String, dynamic> response = await NetworkManager().get(url);

//   HistoryModel modal = HistoryModel.fromJson(response);
//   return modal;
// }