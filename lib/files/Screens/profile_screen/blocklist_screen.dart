import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:you_yemen/files/controllers/blacklist_controller.dart';
import 'package:you_yemen/files/utility/colors.dart';

class CreateBlackListScreen extends StatelessWidget {
  CreateBlackListScreen({super.key});
  final ViewBlacklistController controller =
      Get.put(ViewBlacklistController()); 
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 48,
              ),
              SizedBox(height: 16),
              Text(
                'Your Blacklist Created Successfully.',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Thank you',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('DONE'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Colors.yellow[700], height: 250),
                  Container(
                    height: 50,
                    color: Colors.grey[300],
                    child: Row(
                      children: [
                        SizedBox(width: isMobile ? 20 : 60),
                        Text(
                          'My Account > Blacklist ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w900,
                              fontSize: isMobile ? 12 : 15),
                        ),
                        Text(' > Create a Blacklist',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: isMobile ? 12 : 15)),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(left: isMobile ? 20 : 60),
                    child: Text(
                      'Blacklist',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: isMobile ? 20 : 60),
                    child: Row(
                      children: [
                        Text('How to create a blacklist? ',
                            style: TextStyle(color: Colors.grey)),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Learn More >',
                            style: TextStyle(
                              color: Colors.yellow[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  textfieldContainer(isMobile),
                  listContainer(isMobile),
                  SizedBox(height: 20),
                  Obx(() => bottomButtons(context, isMobile)),
                  SizedBox(height: 30)
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Padding bottomButtons(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
      child: isMobile
          ? Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.pink,
                      width: 2,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: controller.blacklist.isNotEmpty
                        ? Colors.yellow[700]
                        : Colors.grey[300],
                  ),
                  child: TextButton(
                    onPressed: () {
                      // controller.onBlockButtonAction();
                      if (controller.blacklist.isNotEmpty) {
                        _showPopup(context);
                      }
                    },
                    child: Text(
                      'Block',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.pink,
                          width: 2,
                        )),
                    child: Center(
                        child: Text('Cancel',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900))),
                  ),
                ),
                SizedBox(width: 30),
                InkWell(
                  onTap: () {
                    // controller.onBlockButtonAction();
                    if (controller.blacklist.isNotEmpty) {
                      _showPopup(context);
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: controller.blacklist.isNotEmpty
                          ? Colors.yellow[700]
                          : Colors.grey[300],
                    ),
                    child: Center(
                        child: Text('Block',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900))),
                  ),
                ),
              ],
            ),
    );
  }

  Widget listContainer(bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
      child: Container(
          decoration: BoxDecoration(
              // color: Colors.grey[200],
              // borderRadius: BorderRadius.only(
                // bottomLeft: Radius.circular(6),
                // bottomRight: Radius.circular(6),
              ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Obx(
              () => controller.blacklist.isEmpty
                  ? Container()
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 30 : 50.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Mobile Number',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Remove',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 6,
                              left: isMobile ? 10 : 30.0,
                              right: isMobile ? 10 : 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              
                              border: Border.all(color:red
                                // color: Color.fromARGB(255, 206, 205, 205),
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: controller.blacklist
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key;
                                Map<String, String> contact = entry.value;
                                return Column(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      contact['bPartyName'] ??
                                                          ''),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(contact[
                                                              'bPartyMsisdn'] ??
                                                          ''),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(Icons
                                                            .clear_rounded),
                                                        onPressed: () => controller
                                                            .removeFromBlacklist(
                                                                index),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (index !=
                                                controller.blacklist.length - 1)
                                              Divider(
                                                  color: const Color.fromRGBO(
                                                      224, 224, 224, 1))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
            ),
          )),
    );
  }

  Padding textfieldContainer(bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            )),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: isMobile
              ? Column(
                  children: [
                    inputField(controller.nameController, 'Enter Name', 'Name',
                        '', isMobile),
                    SizedBox(height: 10),
                    inputField(
                        controller.mobileNumberController,
                        'Enter Mobile Number',
                        'Mobile Number',
                        '+27 ',
                        isMobile),
                    SizedBox(height: 10),
                    addButton(isMobile),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: inputField(controller.nameController, 'Enter Name',
                          'Name', '', isMobile),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: inputField(
                          controller.mobileNumberController,
                          'Enter Mobile Number',
                          'Mobile Number',
                          '+27 ',
                          isMobile),
                    ),
                    SizedBox(width: 30),
                    addButton(isMobile),
                  ],
                ),
        ),
      ),
    );
  }

  Widget inputField(TextEditingController controller, String hint, String label,
      String prefix, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 400,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            prefixText: prefix,
            labelText: label,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  Widget addButton(bool isMobile) {
    return InkWell(
      onTap: controller.addToBlacklist,
      child: Container(
        width: isMobile ? double.infinity : 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.transparent,
          border: Border.all(
            color: Colors.pink,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
