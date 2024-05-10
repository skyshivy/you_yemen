import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'package:you_yemen/files/api_calls/get_tune_price.dart';
import 'package:you_yemen/files/controllers/tell_a_friend_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';

import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';

import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

import '../../reusable_widgets/u_text_field/u_msisdn_textfield.dart';

CustomPopupController cont = Get.put(CustomPopupController());

 TextEditingController umsisdnTextController = TextEditingController();

class CustomPopupView extends StatelessWidget {
  final String msisdn;
  final TuneInfo info;

  const CustomPopupView({
    Key? key,
    required this.msisdn,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: transparent,
        child: Container(
          width: popupWidth,
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color:lightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 8),
                    Expanded(
                      child: Center(
                        child: UText(
                          title: 'Tell a Friend',
                          textColor:lightGrey,
                          enfontName: FontName.helveticaLight,
                          arfontSize: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),
                    child:uImage(url: info.toneIdpreviewImageUrl?? '')
                    
                  ),
                ),
              ),
              SizedBox(height: 10),
             Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        UText(
          title:
              'Ask Your Friend to replace standard ring back tone with  ',
          enfontName: FontName.helvetica,
          textColor: Colors.grey,
        ),
        
        UText(
          title: 'their favourite tune.',
          enfontName: FontName.helvetica,
          textColor: Colors.grey,
        ),
            ],
          ),
        ),
              SizedBox(height: 10,),
              Material(
                child: UMsisdnTextField(
                  enabled: true,
                  hintText: StoreManager().msisdn,
                  textEditingController: TextEditingController(),
                ),
              ),
             SizedBox(height: 20),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Obx(() => confirmButton(
    onTap: () async {
      await cont.getTonePrice(msisdn, info);
    }
  )),
)

            ],
          ),
        ),
      ),
    );
  }
}


// Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Obx(() => confirmButton(
//                       onTap: () async {
//                         await controller.getTonePrice(msisdn, info);
//                       },