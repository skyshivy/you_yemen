import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/api_calls/transition_api.dart';
import 'package:you_yemen/files/controllers/transition_controller.dart';
import 'package:you_yemen/files/models/transition_history_model.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
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
    controller = Get.put(TransitionScreenController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.makeAPICall();
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
              ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  return Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        return sizingInformation.isMobile
                            ? mobileCardBuilder()
                            : ApiResponseContainer(
                                info: controller.list[index]);
                      },
                    );
                  });
                },
              )
              // Column(
              //   children:
              //   // List.generate(
              //   //   controller.list.length,
              //   //   (index) => ApiResponseContainer(
              //   //       apiResponse: controller.apiResponses[index]),
              //   // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mobileCardBuilder() {
    return Container(
      color: white,
      child: UText(title: "Mobile card here"),
    );
  }
}

class ApiResponseContainer extends StatelessWidget {
  final TransactionDetailsList info;

  const ApiResponseContainer({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

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
                  isMobile ? 'N/A' : info.englishToneName ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Transaction Type',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  isMobile ? 'N/A' : 'Subscription',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  isMobile ? 'N/A' : 'Channel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  isMobile ? 'N/A' : info.callCharge ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${info.transactionType}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: info.transactionType == 'Renewed'
                        ? Colors.red
                        : info.transactionType == 'Activated'
                            ? Colors.green
                            : black,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${info.subscriptionDate}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${info.channel}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Column(
    //   children: transactionDetailsList.map((transaction) {
    //     String subscriptionDate = transaction['subscriptionDate'] ?? 'N/A';
    //     String callCharge = transaction['callCharge'] ?? 'N/A';
    //     String transactionType = transaction['transactionType'] ?? 'N/A';
    //     String channel = transaction['channel'] ?? 'N/A';
    //     String englishToneName = transaction['englishToneName'] ?? 'N/A';

    //     return }).toList(),
    //);
  }
}
