
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'package:you_yemen/files/common/u_date_formate.dart';
import 'package:you_yemen/files/controllers/transition_controller.dart';
import 'package:you_yemen/files/models/transition_history_model.dart';

import 'package:you_yemen/files/utility/colors.dart';

import 'package:get/get.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

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
      body: 
      SingleChildScrollView(
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
                            ? mobileCardBuilder(controller.list[index])
                            : ApiResponseContainer(
                                info: controller.list[index]);
                      },
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mobileCardBuilder(TransactionDetailsList info) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.englishToneName ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  info.callCharge ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  uDateFormat(info.subscriptionDate ?? ''),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  uTimeFormat(info.subscriptionDate ?? ''),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Transaction Type',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${info.transactionType}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: info.transactionType == 'Renewed'
                            ? Colors.red
                            : info.transactionType == 'Activated'
                                ? Colors.green
                                : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Channel',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '${info.channel}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ApiResponseContainer extends StatelessWidget {
  final TransactionDetailsList info;

  ApiResponseContainer({Key? key, required this.info}) : super(key: key);
  TransitionScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.englishToneName ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  info.callCharge ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction Type',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${info.transactionType}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: info.transactionType == 'Renewed'
                        ? Colors.red
                        : info.transactionType == 'Activated'
                            ? Colors.green
                            : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  uDateFormat(info.subscriptionDate ?? ''),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  uTimeFormat(info.subscriptionDate ?? ''),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Channel',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  '${info.channel}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// //uDateFormat(info.subscriptionDate ?? ''),

 // return Container(
    //   color: white,
    //   padding: EdgeInsets.all(16),
    //   margin: EdgeInsets.symmetric(vertical: 8),
    //   child: Column(
    //     children: [
    //       Row(
    //         children: [
    //           Expanded(
    //             child: Text(
    //               info.englishToneName ?? '',
    //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 3,
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Text(
    //                   'SubscriptionDate',
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       SizedBox(height: 2),
    //       Row(
    //         children: [
    //           Expanded(
    //             child: Text(
    //               info.callCharge ?? '',
    //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 Text(
    //                   'subscriptionTime',
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       Row(
    //         children: [
    //           Expanded(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Text(
    //                   'Transaction Type',
    //                   style:
    //                       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Expanded(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 Text(
    //                   'Channel',
    //                   style:
    //                       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       Row(
    //         children: [
    //           Expanded(
    //             flex: 3,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 Text(
    //                   '${info.transactionType}',
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                     color: info.transactionType == 'Renewed'
    //                         ? Colors.red
    //                         : info.transactionType == 'Activated'
    //                             ? Colors.green
    //                             : black,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 Text(
    //                   '${info.channel}',
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );