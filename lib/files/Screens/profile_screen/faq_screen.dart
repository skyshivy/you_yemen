//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:you_yemen/files/controllers/faq_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';

import 'package:get/get.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';

import '../../api_calls/faq_api.dart';
import '../../models/faq_screen_model.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.grey[300],
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 15),
                ],
              ),
            ),
          ),
          Expanded(
            child: GetX<FaqController>(
              init: FaqController(),
              builder: (controller) {
                if (controller.isLoading.value) {
                  return Center(child: loadingIndicator(radius: 20));
                } else if (controller.error.isNotEmpty) {
                  return Center(child: Text('Error: ${controller.error}'));
                } else if (controller.faqList.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  return ListView.builder(
                    itemCount: controller.faqList.length,
                    itemBuilder: (context, index) {
                      return ContainerListItem(controller.faqList[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerListItem extends StatelessWidget {
  final FaqList faqItem;
  final RxBool isExpanded = false.obs; // RxBool for expansion state

  ContainerListItem(this.faqItem);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: si.isMobile ? 8 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: si.isMobile ? 8 : 20, vertical: 6),
                child: InkWell(
                  onTap: () {
                    isExpanded.toggle();
                    getFaqDetailApi();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: UText(
                                  title: faqItem.question ?? '',
                                  fontName: FontName.helveticaBold,
                                ),
                              ),
                              Icon(isExpanded.value ? Icons.remove : Icons.add),
                            ],
                          ),
                          //SizedBox(height: 8),
                          if (isExpanded.value && faqItem.answer != null)
                            ...faqItem.answer!.map((answer) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (answer.header != null)
                                    UText(
                                      title: answer.header ?? '',
                                    ),
                                  if (answer.dataList != null)
                                    ...answer.dataList!.map((dataList) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: dataList.data!.map((datum) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Icon(
                                                      Icons.fiber_manual_record,
                                                      size: 7),
                                                ),
                                                SizedBox(width: 8),
                                                Expanded(
                                                  child: UText(
                                                    title: datum.text ?? '',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    }).toList(),
                                ],
                              );
                            }).toList(),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
