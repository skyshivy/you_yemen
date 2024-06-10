
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:you_yemen/files/controllers/advanced_setting_api.dart';
import 'package:you_yemen/files/controllers/mobile_controller.dart';

import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/cancel_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_msisdn_textfield.dart';
import 'package:you_yemen/files/utility/colors.dart';

class AdvancedSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileAdvancedSettingScreen();
        } else {
          return DesktopAdvancedSettingScreen();
        }
      },
    );
  }
}

class DesktopAdvancedSettingScreen extends StatelessWidget {
  final AdvancedSettingController cont = Get.put(AdvancedSettingController());
  final TextEditingController msisdnController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 20, bottom: 20),
            child: UText(
              title: "Advanced Setting",
              enfontName: FontName.acMunaBlack,
              enfontSize: 20,
            ),
          ),SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      height: 250,
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: uImage(
                              fit: BoxFit.cover,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero,
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UText(title: "ILIKEYOU"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UText(title: "UNA RMS"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 800,
                    decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius : BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildCallerOptions(context),
                    ),
                  ),
                  
                  Obx(() {
                    if (cont.selectedCallerOption.value != 'add_to_shuffle') {
                      return Container(
                        width: 800,
                        color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: UText(
                                title: "Whom you want to play it?",
                                enfontName: FontName.helveticaBold,
                              ),
                            ),
                            if (cont.selectedCallerOption.value == 'special_callers')
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: UMsisdnTextField(
            textEditingController: cont.msisdnController,
            hintText: 'Enter Special Callers',
          ),
        ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Obx(() {
                                    return Container(
                                      height: 60,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              cont.selectedTimeOption.value ==
                                                      null
                                                  ? 'Select time type'
                                                  : cont
                                                      .selectedTimeOption.value!
                                                      .replaceAll('_', ' ')
                                                      .toUpperCase(),
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              PopupMenuButton<String>(
                                                onSelected: (String newValue) {
                                                  cont.selectedTimeOption
                                                      .value = newValue;
                                                },
                                                itemBuilder: (BuildContext
                                                        context) =>
                                                    <PopupMenuEntry<String>>[
                                                  const PopupMenuItem<String>(
                                                    value: 'full_day',
                                                    child: Text('FULL DAY'),
                                                  ),
                                                  const PopupMenuItem<String>(
                                                    value: 'select_time',
                                                    child: Text('SELECT TIME'),
                                                  ),
                                                  const PopupMenuItem<String>(
                                                    value: 'select_date_time',
                                                    child: Text(
                                                        'SELECT DATE TIME'),
                                                  ),
                                                ],
                                                child:
                                                    Icon(Icons.arrow_drop_down),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                  if (cont.selectedTimeOption.value ==
                                      'full_day') ...[
                                    SizedBox(width: 10),
                                    Icon(Icons.alarm),
                                    UText(title: 'Time', textColor: lightGrey),
                                    SizedBox(height: 5),
                                    UText(title: "24 hrs", textColor: black)
                                  ],
                                  SizedBox(width: 15),
                                  if (cont.selectedTimeOption.value ==
                                      'select_time')
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildTimeContainer('Start Time',
                                            cont.startTime, context),
                                        SizedBox(width: 15),
                                        _buildTimeContainer(
                                            'End Time', cont.endTime, context),
                                      ],
                                    ),
        
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            if (cont.selectedTimeOption.value ==
                                'select_date_time')
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        _buildDateTimeContainer(
                                            'Start Date',
                                            cont.startDate,
                                            cont.startTime,
                                            context),
                                        SizedBox(width: 10),
                                        _buildDateTimeContainer(
                                            'End Date',
                                            cont.endDate,
                                            cont.endTime,
                                            context),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: UText(
                                title: "Repeat",
                                enfontName: FontName.helveticaBold,
                              ),
                            ),
                            if (cont.selectedCallerOption.value !=
                                    'add_to_shuffle' &&
                                cont.selectedTimeOption.value != null)
                              ..._buildTimeOptionWidgets(context),
                               
                          ],
                        ),
                      );
                    }
                    return SizedBox();
                  }),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      confirmButton(),
                      SizedBox(width: 10),
                      cancelButton(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  // if (cont.selectedCallerOption.value == 'special_callers')
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: UMsisdnTextField(
  //           textEditingController: cont.msisdnController,
  //           hintText: 'Enter Special Callers',
  //         ),
  //       ),



  Column _buildCallerOptions(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: UText(
          title: "Whom you want to play it?",
          enfontName: FontName.helveticaBold,
          enfontSize: 15,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            if (cont.selectedCallerOption.value == 'special_callers')
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: UMsisdnTextField(
            textEditingController: cont.msisdnController,
            hintText: 'Enter Special Callers',
          ),
        ),
            Obx(() {
              return Radio<String>(
                value: 'all_callers',
                groupValue: cont.selectedCallerOption.value,
                onChanged: (value) {
                  cont.selectedCallerOption.value = value!;
                },
              );
            }),
            Obx(() {
              return UText(
                title: 'All Callers',
                enfontName: FontName.acMunaBlack,
                enfontSize: 20,
                textColor: cont.selectedCallerOption.value == 'all_callers'
                    ? Color.fromARGB(255, 3, 33, 58)
                    : Colors.grey,
              );
            }),
            SizedBox(width: 30),
            Obx(() {
              return Radio<String>(
                value: 'special_callers',
                groupValue: cont.selectedCallerOption.value,
                onChanged: (value) {
                  cont.selectedCallerOption.value = value!;
                },
              );
            }),
            Obx(() {
              return UText(
                title: 'Special Callers',
                enfontName: FontName.acMunaBlack,
                enfontSize: 20,
                textColor: cont.selectedCallerOption.value == 'special_callers'
                    ? Color.fromARGB(255, 3, 33, 58)
                    : Colors.grey,
              );
            }),
            SizedBox(width: 30),
            Obx(() {
              return Radio<String>(
                value: 'add_to_shuffle',
                groupValue: cont.selectedCallerOption.value,
                onChanged: (value) {
                  cont.selectedCallerOption.value = value!;
                },
              );
            }),
            Obx(() {
              return UText(
                title: 'Add to Shuffle',
                enfontName: FontName.acMunaBlack,
                enfontSize: 20,
                textColor: cont.selectedCallerOption.value == 'add_to_shuffle'
                    ? Color.fromARGB(255, 3, 33, 58)
                    : Colors.grey,
              );
            }),
       
          ],
        ),
      ),
     
    ]);
  }
// if (cont.selectedCallerOption.value == 'special_callers')
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: UMsisdnTextField(
//             textEditingController: cont.msisdnController,
//             hintText: 'Enter Special Callers',
//           ),
//         ),
  List<Widget> _buildTimeOptionWidgets(BuildContext context) {
    if (cont.selectedTimeOption.value == 'full_day' ||
        cont.selectedTimeOption.value == 'select_time') {
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                .map((day) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: UText(
                            title: day,
                            textColor: Colors.grey,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ];
    } else if (cont.selectedTimeOption.value == 'select_date_time') {
      return [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: ['None', 'Monthly', 'Yearly']
                .map((label) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          cont.selectedRepeatOption.value = label;
                        },
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: cont.selectedRepeatOption.value == label
                                ? Colors.blue
                                : Colors.white,
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: UText(
                              title: label,
                              textColor:
                                  cont.selectedRepeatOption.value == label
                                      ? Colors.white
                                      : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ];
    }
    return [];
  }

  Widget _buildTimeContainer(
      String label, Rx<TimeOfDay> time, BuildContext context) {
    return Obx(() {
      return Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(2),
        ),
        child: TextButton(
          onPressed: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: time.value,
            );
            if (pickedTime != null) {
              time.value = pickedTime;
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label),
              Text(_formatTimeOfDay(time.value)),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDateTimeContainer(String label, Rx<DateTime> date,
      Rx<TimeOfDay> time, BuildContext context) {
    return Obx(() {
      return Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            TextButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: date.value,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: time.value,
                  );
                  if (pickedTime != null) {
                    date.value = pickedDate;
                    time.value = pickedTime;
                  }
                }
              },
              child: Text(_formatDateTime(date.value, time.value)),
            ),
          ],
        ),
      );
    });
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  String _formatDateTime(DateTime date, TimeOfDay time) {
    final dt =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    final format = DateFormat.yMMMd().add_jm();
    return format.format(dt);
  }
}

class MobileAdvancedSettingScreen extends StatelessWidget {
  final MobileAdvancedSettingController controller =
      Get.put(MobileAdvancedSettingController());
  final TextEditingController msisdnController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: UText(
              title: "Advanced Setting",
              enfontName: FontName.acMunaBlack,
              enfontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(3),
              ),
              height: 250,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: uImage(
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                  ),
                  Text("ILIKEYOU"),
                  Text("UNA RMS"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildCallerOptions(),
                  ),
                ),
                Obx(() {
                  if (controller.selectedCallerOption.value !=
                      'add_to_shuffle') {
                    return Container(
                      width: double.infinity,
                      color: Colors.grey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UText(
                              title: "When you want to play it?",
                              enfontName: FontName.helveticaBold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Obx(() {
                                          return Text(
                                            controller.selectedTimeOption
                                                        .value ==
                                                    null
                                                ? 'Select time type'
                                                : controller
                                                    .selectedTimeOption.value!
                                                    .replaceAll('_', ' ')
                                                    .toUpperCase(),
                                          );
                                        }),
                                      ),
                                      PopupMenuButton<String>(
                                        onSelected:
                                            controller.setSelectedTimeOption,
                                        itemBuilder: (BuildContext context) {
                                          return <String>[
                                            'full_day',
                                            'select_time',
                                            'select_date_time'
                                          ].map((String value) {
                                            return PopupMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value
                                                    .replaceAll('_', ' ')
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                if (controller.selectedTimeOption.value ==
                                    'select_time')
                                  Column(
                                    children: [
                                      _buildTimeContainer('Start Time',
                                          controller.startTime, context),
                                      SizedBox(height: 15),
                                      _buildTimeContainer('End Time',
                                          controller.endTime, context),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          if (controller.selectedTimeOption.value ==
                              'select_date_time')
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      _buildDateTimeContainer(
                                          'Start Date',
                                          controller.startDate,
                                          controller.startTime,
                                          context),
                                      SizedBox(height: 10),
                                      _buildDateTimeContainer(
                                          'End Date',
                                          controller.endDate,
                                          controller.endTime,
                                          context),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UText(
                              title: "Repeat",
                              enfontName: FontName.helveticaBold,
                            ),
                          ),
                          if (controller.selectedCallerOption.value !=
                                  'add_to_shuffle' &&
                              controller.selectedTimeOption.value != null)
                            ..._buildTimeOptionWidgets(),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
                SizedBox(height: 10),
                Row(
                  children: [
                    confirmButton(),
                    SizedBox(width: 10),
                    cancelButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildCallerOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UText(
          title: "Whom you want to play it",
          enfontName: FontName.helveticaBold,
          arfontSize: 15,
        ),
        Obx(() {
          return Column(
            children: [
              RadioListTile<String>(
                value: 'all_callers',
                groupValue: controller.selectedCallerOption.value,
                onChanged: (value) {
                  controller.setSelectedCallerOption(value!);
                },
                title: Text(
                  'All Callers',
                  style: TextStyle(
                      color:
                          controller.selectedCallerOption.value == 'all_callers'
                              ? const Color.fromARGB(255, 12, 63, 209)
                              : Colors.black),
                ),
              ),
              RadioListTile<String>(
                value: 'selected_callers',
                groupValue: controller.selectedCallerOption.value,
                onChanged: (value) {
                  controller.setSelectedCallerOption(value!);
                },
                title: Text(
                  'Selected Callers',
                  style: TextStyle(
                      color: controller.selectedCallerOption.value ==
                              'selected_callers'
                          ? const Color.fromARGB(255, 12, 63, 209)
                          : Colors.black),
                ),
              ),
              if (controller.selectedCallerOption.value == 'selected_callers')
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UMsisdnTextField(
                    textEditingController: msisdnController,
                    hintText: 'Enter Special Callers',
                  ),
                ),
              RadioListTile<String>(
                value: 'add_to_shuffle',
                groupValue: controller.selectedCallerOption.value,
                onChanged: (value) {
                  controller.setSelectedCallerOption(value!);
                },
                title: Text(
                  'Add to Shuffle',
                  style: TextStyle(
                      color: controller.selectedCallerOption.value ==
                              'add_to_shuffle'
                          ? const Color.fromARGB(255, 12, 63, 209)
                          : Colors.black),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  List<Widget> _buildTimeOptionWidgets() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: ['None', 'Monthly', 'Yearly']
              .map((label) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        controller.setSelectedRepeatOption(label);
                      },
                      child: Obx(() {
                        return Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                controller.selectedRepeatOption.value == label
                                    ? Colors.blue
                                    : Colors.white,
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: UText(
                              title: label,
                              textColor:
                                  controller.selectedRepeatOption.value == label
                                      ? Colors.white
                                      : Colors.grey,
                            ),
                          ),
                        );
                      }),
                    ),
                  ))
              .toList(),
        ),
      ),
    ];
  }

  Widget _buildTimeContainer(
      String label, Rx<TimeOfDay> time, BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Center(
          child: TextButton(
            onPressed: () => controller.setStartTime(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label),
                Obx(() {
                  return Text(controller.formatTimeOfDay(time.value));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimeContainer(String label, Rx<DateTime> date,
      Rx<TimeOfDay> time, BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          TextButton(
            onPressed: () => controller.setStartDateTime(context),
            child: Obx(() {
              return Text(controller.formatDateTime(date.value, time.value));
            }),
          ),
        ],
      ),
    );
  }

  Widget confirmButton() {
    return ElevatedButton(
      onPressed: () {
        // Add your confirmation logic here
      },
      child: Text("Confirm"),
    );
  }

  Widget cancelButton() {
    return ElevatedButton(
      onPressed: () {
        // Add your cancel logic here
      },
      child: Text("Cancel"),
    );
  }
}







// class DesktopAdvancedSettingScreen extends StatefulWidget {
//   @override
//   _DesktopAdvancedSettingScreenState createState() =>
//       _DesktopAdvancedSettingScreenState();
// }

// class _DesktopAdvancedSettingScreenState
//     extends State<DesktopAdvancedSettingScreen> {
//   String selectedCallerOption = 'all_callers';
//   String? selectedTimeOption;
//   TimeOfDay startTime = TimeOfDay.now();
//   TimeOfDay endTime = TimeOfDay.now();
//   DateTime startDate = DateTime.now();
//   DateTime endDate = DateTime.now();
//   String selectedRepeatOption = 'None';
//   final TextEditingController msisdnController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 50.0, top: 20, bottom: 20),
//             child: UText(
//               title: "Advanced Setting",
//               enfontName: FontName.acMunaBlack,
//               enfontSize: 20,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 50.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(3),
//                       ),
//                       height: 250,
//                       width: 350,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: uImage(
//                               fit: BoxFit.cover,
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.zero,
//                                 bottomRight: Radius.zero,
//                                 topLeft: Radius.circular(5),
//                                 topRight: Radius.circular(5),
//                               ),
//                             ),
//                           ),
//                           Text("ILIKEYOU"),
//                           Text("UNA RMS"),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 30),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 800,
//                     decoration: BoxDecoration(
//                       color: lightGrey,
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: _buildCallerOptions(),
//                     ),
//                   ),
//                   if (selectedCallerOption != 'add_to_shuffle')
//                     Container(
//                       width: 800,
//                       color: Colors.grey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: UText(
//                               title: "Whom you want to play it?",
//                               enfontName: FontName.helveticaBold,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   height: 60,
//                                   width: 300,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(2),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Text(
//                                           selectedTimeOption == null
//                                               ? 'Select time type'
//                                               : selectedTimeOption!.replaceAll('_', ' ').toUpperCase(),
//                                         ),
//                                       ),
//                                       Stack(
//                                         children:[ 
//                                           PopupMenuButton
//                                         <String>(
//                                           onSelected: (String newValue) {
//                                             setState(() {
//                                               selectedTimeOption = newValue;
//                                             });
//                                           },
//                                           itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                                             const PopupMenuItem<String>(
//                                               value: 'full_day',
//                                               child: Text('FULL DAY'),
//                                             ),
//                                             const PopupMenuItem<String>(
//                                               value: 'select_time',
//                                               child: Text('SELECT TIME'),
//                                             ),
//                                             const PopupMenuItem<String>(
//                                               value: 'select_date_time',
//                                               child: Text('SELECT DATE TIME'),
//                                             ),
//                                           ],
//                                           child: Icon(Icons.arrow_drop_down),
//                                         ),]
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 if (selectedTimeOption == 'full_day') ...[
//                                   SizedBox(width: 10),
//                                   Icon(Icons.alarm),
//                                   UText(title: 'Time', textColor: lightGrey),
//                                   SizedBox(height: 5),
//                                   UText(title: "24 hrs", textColor: black)
//                                 ],
//                                 SizedBox(width: 15),
//                                 if (selectedTimeOption == 'select_time')
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       _buildTimeContainer('Start Time', startTime),
//                                       SizedBox(width: 15),
//                                       _buildTimeContainer('End Time', endTime),
//                                     ],
//                                   ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           if (selectedTimeOption == 'select_date_time')
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       _buildDateTimeContainer('Start Date', startDate, startTime),
//                                       SizedBox(width: 10),
//                                       _buildDateTimeContainer('End Date', endDate, endTime),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 20),
//                               ],
//                             ),
//                           Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: UText(
//                               title: "Repeat",
//                               enfontName: FontName.helveticaBold,
//                             ),
//                           ),
//                           if (selectedCallerOption != 'add_to_shuffle' && selectedTimeOption != null)
//                             ..._buildTimeOptionWidgets(),
//                         ],
//                       ),
//                     ),
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                       confirmButton(),
//                       SizedBox(width: 10),
//                       cancelButton(),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Column _buildCallerOptions() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: UText(
//             title: "Whom you want to play it?",
//             enfontName: FontName.helveticaBold,
//             enfontSize: 15,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Radio<String>(
//                 value: 'all_callers',
//                 groupValue: selectedCallerOption,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedCallerOption = value!;
//                   });
//                 },
//               ),
//               UText(
//                 title: 'All Callers',
//                 enfontName: FontName.acMunaBlack,
//                 enfontSize: 20,
//                 textColor: selectedCallerOption == 'all_callers'
//                     ? Color.fromARGB(255, 3, 33, 58)
//                     : Colors.grey,
//               ),
//               SizedBox(width: 30),
//               Radio<String>(
//                 value: 'special_callers',
//                 groupValue: selectedCallerOption,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedCallerOption = value!;
//                   });
//                 },
//               ),
//               UText(
//                 title: 'Special Callers',
//                 enfontName: FontName.acMunaBlack,
//                 enfontSize: 20,
//                 textColor: selectedCallerOption == 'special_callers'
//                     ? Color.fromARGB(255, 3, 33, 58)
//                     : Colors.grey,
//               ),
//               SizedBox(width: 30),
//               Radio<String>(
//                 value: 'add_to_shuffle',
//                 groupValue: selectedCallerOption,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedCallerOption = value!;
//                   });
//                 },
//               ),
//               UText(
//                 title: 'Add to Shuffle',
//                 enfontName: FontName.acMunaBlack,
//                 enfontSize: 20,
//                 textColor: selectedCallerOption == 'add_to_shuffle'
//                     ? Color.fromARGB(255, 3, 33, 58)
//                     : Colors.grey,
//               ),
//             ],
//           ),
//         ),
//         if (selectedCallerOption == 'special_callers')
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: UMsisdnTextField(
//               textEditingController: msisdnController,
//               hintText: 'Enter Special Callers',
//             ),
//           ),
//       ],
//     );
//   }

//   List<Widget> _buildTimeOptionWidgets() {
//     if (selectedTimeOption == 'full_day' || selectedTimeOption == 'select_time') {
//       return [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
//                 .map((day) => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       child: Container(
//                         width: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         padding: EdgeInsets.all(8.0),
//                         child: Center(
                         
//                             child: UText(
//                               title: day,
//                               textColor: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ))
//                 .toList(),
//           ),
//         ),
//       ];
//     } else if (selectedTimeOption == 'select_date_time') {
//       return [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: ['None', 'Monthly', 'Yearly']
//                 .map((label) => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedRepeatOption = label;
//                           });
//                         },
//                         child: Container(
//                           width: 80,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: selectedRepeatOption == label
//                                 ? Colors.blue
//                                 : Colors.white,
//                           ),
//                           padding: EdgeInsets.all(8.0),
//                           child: Center(
//                             child: UText(
//                               title: label,
//                               textColor: selectedRepeatOption == label
//                                   ? Colors.white
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//       ];
//     }
//     return [];
//   }

//   Widget _buildTimeContainer(String label, TimeOfDay initialTime) {
//     return Container(
//       height: 60,
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.white),
//         borderRadius: BorderRadius.circular(2),
//       ),
//       child: TextButton(
//         onPressed: () async {
//           TimeOfDay? pickedTime = await showTimePicker(
//             context: context,
//             initialTime: initialTime,
//           );
//           if (pickedTime != null) {
//             setState(() {
//               if (label == 'Start Time') {
//                 startTime = pickedTime;
//               } else {
//                 endTime = pickedTime;
//               }
//             });
//           }
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(label),
//             Text(_formatTimeOfDay(initialTime)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDateTimeContainer(
//       String label, DateTime initialDate, TimeOfDay initialTime) {
//     return Container(
//       height: 60,
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.white),
//         borderRadius: BorderRadius.circular(2),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(label),
//           TextButton(
//             onPressed: () async {
//               DateTime? pickedDate = await showDatePicker(
//                 context: context,
//                 initialDate: initialDate,
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2100),
//               );
//               if (pickedDate != null) {
//                 TimeOfDay? pickedTime = await showTimePicker(
//                   context: context,
//                   initialTime: initialTime,
//                 );
//                 if (pickedTime != null) {
//                   setState(() {
//                     if (label == 'Start Date') {
//                       startDate = pickedDate;
//                       startTime = pickedTime;
//                     } else {
//                       endDate = pickedDate;
//                       endTime = pickedTime;
//                     }
//                   });
//                 }
//               }
//             },
//             child: Text(_formatDateTime(initialDate, initialTime)),
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatTimeOfDay(TimeOfDay time) {
//     final now = DateTime.now();
//     final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     final format = DateFormat.jm(); 
//     return format.format(dt);
//   }

//   String _formatDateTime(DateTime date, TimeOfDay time) {
//     final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
//     final format = DateFormat.yMMMd().add_jm(); 
//     return format.format(dt);
//   }
// }

// class MobileAdvancedSettingScreen extends StatefulWidget {
//   @override
//   _MobileAdvancedSettingScreenState createState() =>
//       _MobileAdvancedSettingScreenState();
// }
// class _MobileAdvancedSettingScreenState
//     extends State<MobileAdvancedSettingScreen> {
//   String selectedCallerOption = 'all_callers';
//   String? selectedTimeOption;
//   DateTime startDate = DateTime.now();
//   DateTime endDate = DateTime.now();
//   TimeOfDay startTime = TimeOfDay.now();
//   TimeOfDay endTime = TimeOfDay.now();
//   DateTime currentDate = DateTime.now();
//   final TextEditingController msisdnController = TextEditingController();
//   String selectedRepeatOption = 'None';

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: UText(
//               title: "Advanced Setting",
//               enfontName: FontName.acMunaBlack,
//               enfontSize: 20,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(3),
//               ),
//               height: 250,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: uImage(
//                       fit: BoxFit.cover,
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.zero,
//                         bottomRight: Radius.zero,
//                         topLeft: Radius.circular(5),
//                         topRight: Radius.circular(5),
//                       ),
//                     ),
//                   ),
//                   Text("ILIKEYOU"),
//                   Text("UNA RMS"),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: lightGrey,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: _buildCallerOptions(),
//                   ),
//                 ),
//                 if (selectedCallerOption != 'add_to_shuffle')
//                   Container(
//                     width: double.infinity,
//                     color: Colors.grey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: UText(
//                             title: "When you want to play it?",
//                             enfontName: FontName.helveticaBold,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: 60,
//                                 width: 300,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(2),
//                                 ),
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           selectedTimeOption == null
//                                               ? 'Select time type'
//                                               : selectedTimeOption!.replaceAll('_', ' ').toUpperCase(),
//                                         ),
//                                       ),
//                                       Stack(
//                                         children:[ PopupMenuButton 
//                                         <String>(
//                                           onSelected: (String newValue) {
//                                             setState(() {
//                                               selectedTimeOption = newValue;
//                                             });
//                                           },
//                                       itemBuilder: (BuildContext context) {
//                                         return <String>[
//                                           'full_day',
//                                           'select_time',
//                                           'select_date_time'
//                                         ].map((String value) {
//                                           return PopupMenuItem<String>(
//                                             value: value,
//                                             child: Container(

                                          
//                                               child: Text(
//                                                 value
//                                                     .replaceAll('_', ' ')
//                                                     .toUpperCase(),
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         }).toList();
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ],  ),
//                               ),
//                               //  if (selectedTimeOption == 'full_day') ...[
//                               //     SizedBox(width: 10),
//                               //     Icon(Icons.alarm),
//                               //     UText(title: 'Time', textColor: lightGrey),
//                               //     SizedBox(height: 5),
//                               //     UText(title: "24 hrs", textColor: black)
//                               //   ],
//                               SizedBox(height: 10,),
//                               if (selectedTimeOption == 'select_time')
//                                 Column(
                                
//                                   children: [
//                                     _buildTimeContainer(
//                                         'Start Time', startTime),
//                                     SizedBox(height: 15),
//                                     _buildTimeContainer(
//                                         'End Time', endTime),
//                                   ],
//                                 ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         if (selectedTimeOption == 'select_date_time')
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     _buildDateTimeContainer(
//                                         'Start Date', startDate, startTime),
//                                     SizedBox(height: 10),
//                                     _buildDateTimeContainer(
//                                         'End Date', endDate, endTime),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 20),
//                             ],
//                           ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: UText(
//                             title: "Repeat",
//                             enfontName: FontName.helveticaBold,
//                           ),
//                         ),
//                         if (selectedCallerOption != 'add_to_shuffle' &&
//                             selectedTimeOption != null)
//                           ..._buildTimeOptionWidgets(),
//                       ],
//                     ),
//                   ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     confirmButton(),
//                     SizedBox(width: 10),
//                     cancelButton(),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Column _buildCallerOptions() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         UText(
//           title: "Whom you want to play it",
//           enfontName: FontName.helveticaBold,
//           arfontSize: 15,
//         ),
//         Column(
//           children: [
//             RadioListTile<String>(
//               value: 'all_callers',
//               groupValue: selectedCallerOption,
//               onChanged: (value) {
//                 setState(() {
//                   selectedCallerOption = value!;
//                 });
//               },
//               title: Text(
//                 'All Callers',
//                 style: TextStyle(
//                     color: selectedCallerOption == 'all_callers'
//                         ? const Color.fromARGB(255, 12, 63, 105)
//                         : Colors.grey),
//               ),
//             ),
//             RadioListTile<String>(
//               value: 'special_callers',
//               groupValue: selectedCallerOption,
//               onChanged: (value) {
//                 setState(() {
//                   selectedCallerOption = value!;
//                 });
//               },
//               title: Text(
//                 'Special Callers',
//                 style: TextStyle(
//                     color: selectedCallerOption == 'special_callers'
//                         ? const Color.fromARGB(255, 12, 63, 105)
//                         : Colors.grey),
//               ),
//             ),
//             RadioListTile<String>(
//               value: 'add_to_shuffle',
//               groupValue: selectedCallerOption,
//               onChanged: (value) {
//                 setState(() {
//                   selectedCallerOption = value!;
//                 });
//               },
//               title: Text(
//                 'Add to Shuffle',
//                 style: TextStyle(
//                     color: selectedCallerOption == 'add_to_shuffle'
//                         ? const Color.fromARGB(255, 12, 63, 105)
//                         : Colors.grey),
//               ),
//             ),
//           ],
//         ),
//         if (selectedCallerOption == 'special_callers')
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: UMsisdnTextField(
//               textEditingController: msisdnController,
//               hintText: 'Enter Special Callers',
//             ),
//           ),
//       ],
//     );
//   }

//   List<Widget> _buildTimeOptionWidgets() {
//     if (selectedTimeOption == 'full_day' || selectedTimeOption == 'select_time') {
//       return [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: ['Su', 'M', 'Tu', 'W', 'T', 'F', 'S']
//                 .map((day) => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       child: Container(
//                         width: 50,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(2),
//                           color: Colors.white,
//                         ),
//                         padding: EdgeInsets.all(8.0),
//                         child: Center(
//                           child: UText(
//                             title: day,
//                             textColor: Colors.grey,
//                           ),
//                         ),
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//       ];
//     } else if (selectedTimeOption == 'select_date_time') {
//       return [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: ['None', 'Monthly', 'Yearly']
//                 .map((label) => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
                          
//                             selectedRepeatOption = label;
//                           });
//                         },
//                         child: Container(
//                           width: 80,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: selectedRepeatOption == label
//                                 ? Colors.blue
//                                 : Colors.white,
//                           ),
//                           padding: EdgeInsets.all(8.0),
//                           child: Center(
//                             child: UText(
//                               title: label,
//                               textColor: selectedRepeatOption == label
//                                   ? Colors.white
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//       ];
//     }
//     return [];
//   }

//   Widget _buildTimeContainer(String label, TimeOfDay initialTime) {
//     return Center(
//       child: Container(
//         height: 60,
//         width: 200,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(2),
//         ),
//         child: Center(
//           child: TextButton(
//             onPressed: () async {
//               TimeOfDay? pickedTime = await showTimePicker(
//                 context: context,
//                 initialTime: initialTime,
//               );
//               if (pickedTime != null) {
//                 setState(() {
//                   if (label == 'Start Time') {
//                     startTime = pickedTime;
//                   } else {
//                     endTime = pickedTime;
//                   }
//                 });
//               }
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(label),
//                 Text(_formatTimeOfDay(initialTime)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDateTimeContainer(
//       String label, DateTime initialDate, TimeOfDay initialTime) {
//     return Container(
//       height: 60,
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.white),
//         borderRadius: BorderRadius.circular(2),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(label),
//           TextButton(
//             onPressed: () async {
//               DateTime? pickedDate = await showDatePicker(
//                 context: context,
//                 initialDate: initialDate,
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2100),
//               );
//               if (pickedDate != null) {
//                 TimeOfDay? pickedTime = await showTimePicker(
//                   context: context,
//                   initialTime: initialTime,
//                 );
//                 if (pickedTime != null) {
//                   setState(() {
//                     if (label == 'Start Date') {
//                       startDate = pickedDate;
//                       startTime = pickedTime;
//                     } else {
//                       endDate = pickedDate;
//                       endTime = pickedTime;
//                     }
//                   });
//                 }
//               }
//             },
//             child: Text(_formatDateTime(initialDate, initialTime)),
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatTimeOfDay(TimeOfDay time) {
//     final now = DateTime.now();
//     final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     final format = DateFormat.jm(); 
//     return format.format(dt);
//   }

//   String _formatDateTime(DateTime date, TimeOfDay time) {
//     final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
//     final format = DateFormat.yMMMd().add_jm();
//     return format.format(dt);
//   }
// }