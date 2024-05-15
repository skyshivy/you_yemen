import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/api_calls/transition_api.dart';
import 'package:you_yemen/files/controllers/transition_controller.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/utility/colors.dart';






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/utility/colors.dart';

 // Assuming ApiResponseContainer is in a separate file
class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
late TransitionScreenController controller;
  @override
  void initState() {
   controller =Get.put(TransitionScreenController());
    super.initState();
  }
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// class TransitionScreen extends StatelessWidget {
//   TransitionScreenController controller = Get.put(TransitionScreenController());

  @override
  Widget build(BuildContext context) {
    controller.makeAPICall();
    return Scaffold(
      appBar: AppBar(
        title: Text('Transition Screen'),
      ),
      backgroundColor: lightGrey,
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Column(
                  children: List.generate(
                    controller.apiResponses.length,
                    (index) =>
                        ApiResponseContainer(apiResponse: controller.apiResponses[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transition Screen'),
      ),
      backgroundColor: lightGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Column(
                children: List.generate(

                 controller.list.length,
                  (index) =>
                      ApiResponseContainer(apiResponse: apiResponses[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApiResponseContainer extends StatelessWidget {
  final Map<String, dynamic> apiResponse;

  const ApiResponseContainer({Key? key, required this.apiResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    List<dynamic> transactionDetailsList = apiResponse['responseMap']['transactionDetailsList'];

    return Column(
      children: transactionDetailsList.map((transaction) {
        String subscriptionDate = transaction['subscriptionDate'] ?? 'N/A';
        String callCharge = transaction['callCharge'] ?? 'N/A';
        String transactionType = transaction['transactionType'] ?? 'N/A';
        String channel = transaction['channel'] ?? 'N/A';
        String englishToneName = transaction['englishToneName'] ?? 'N/A';

        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      isMobile ? 'N/A' : englishToneName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Transaction Type',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      isMobile ? 'N/A' : 'Subscription',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      isMobile ? 'N/A' : 'Channel',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      isMobile ? 'N/A' : callCharge,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '$transactionType',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: transactionType == 'Renewed' ? Colors.red : transactionType == 'Activated' ? Colors.green : black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '$subscriptionDate',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '$channel',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
