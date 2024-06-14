import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return _buildMobileFooter();
        } else {
          return _buildDesktopFooter();
        }
      },
    );
  }

  Widget _buildDesktopFooter() {
    return Container(
      height: 250,
      color: black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UText(title: "Company",fontName: FontName.helveticaBold,fontSize: 20,textColor:  Colors.blueAccent,),
                    InkWell(onTap: () {}, child: UText(title: "Help",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,)),
                    InkWell(onTap: () {}, child: UText(title: "Privacy Policy",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,)),
                     InkWell(onTap: () {}, child: UText(title: "Terms and Conditions",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,)),
                    SizedBox(height: 10),
                    UText(title: "Follow Us On",fontName: FontName.helveticaBold,fontSize: 20,textColor:  Colors.blueAccent,),
                    Row(
                      children: List.generate(5, (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: genericButton(height: 30, width: 30),
                      )),
                    ),Divider(color: yellow,),
                    // UText(title: "@2020 CopyRight. All Rights Reserved",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UText(title: "My Tune | Location",fontName: FontName.helveticaBold,fontSize: 20,textColor:  Colors.blueAccent,),
                  UText(title: "No.221, Level 17-22-23,",textColor: white,fontName: FontName.helveticaLight,fontSize: 15, ),
                  UText(title: "Sule Pagoda Road,",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
                  UText(title: "Kyauktada Township",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
                  UText(title: "Yangon, 11182 Myanmar",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 220.0,),
            child: Divider(color:white),
          ),
           Padding(
             padding: const EdgeInsets.only(left: 220.0),
             child: UText(title: "@2020 CopyRight. All Rights Reserved",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
           ),
        ],
      ),
    );
  }

  Widget _buildMobileFooter() {
    return Container(
      color: black,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           UText(title: "Company",fontName: FontName.helveticaBold,fontSize: 20,textColor:  Colors.blueAccent,),
                    InkWell(onTap: () {}, child: UText(title: "Help",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,)),
                    InkWell(onTap: () {}, child: UText(title: "Privacy Policy",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,)),
                     InkWell(onTap: () {}, child: UText(title: "Terms and Conditions",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,)),
          SizedBox(height: 20),
          UText(title: "My Tune | Location",fontName: FontName.helveticaBold,fontSize: 20,textColor:  Colors.blueAccent,),
                  UText(title: "No.221, Level 17-22-23,",textColor: white,fontName: FontName.helveticaLight,fontSize: 15, ),
                  UText(title: "Sule Pagoda Road,",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
                  UText(title: "Kyauktada Township",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
                  UText(title: "Yangon, 11182 Myanmar",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
          SizedBox(height: 20),
           UText(title: "Follow Us On",fontName: FontName.helveticaBold,fontSize: 20,textColor:  Colors.blueAccent,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: genericButton(height: 30, width: 30),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(color: white),
          ),
          UText(title: "@2020 CopyRight. All Rights Reserved",textColor: white,fontName: FontName.helveticaLight,fontSize: 15,),
        ],
      ),
    );
  }
}