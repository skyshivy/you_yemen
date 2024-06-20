import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class MyTuneHeaderView extends StatelessWidget {
  const MyTuneHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          LayoutBuilder(builder: (context, constraints){
            if(constraints.maxWidth>650){
          return DesktopLayout(size);
        }
        else if(constraints.maxWidth>450){
          return TabletLayout(size);
        }
        else{
          return MobileLayout(size);
        }
          }),
          
        ],
      ),
    );
  }

  Container DesktopLayout(Size size) {
    return Container(
          width: double.infinity,
          height: 280,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
            Positioned.fill(
              child: Image.asset(
                'assets/png/you_yamen.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right:-60,
              child: ClipOval(
                child: Container(
                  height:200, 
                  
                  width:400,
                  
                  decoration:BoxDecoration(
                    color:myTuneHeaderViewColor
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(
                      left:12,
                      right:80,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UText(
                          title:callerGroupStr1,
                          fontSize: 28 ,
                          fontWeight: FontWeight.w900,
                        ),
                         UText(
                          title:callerGroupStr2,
                          fontSize: 16,
                          //fontWeight: FontWeight.w900,
                          
                        ),
                      ],
                    ),
                  )),
              ),
            ),
          ]),
        );
  }

  Container TabletLayout(Size size) {
    return Container(
          width: double.infinity,
          height: size.height * 0.5,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
            Positioned.fill(
              child: Image.asset(
                'assets/png/you_yamen.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right:-size.width*0.09,
              //-60,
              child: ClipOval(
                child: Container(
                  height:size.width*0.28,
                  //200, 
                  
                  width:size.width*0.55,
                  
                  decoration:BoxDecoration(
                    color:myTuneHeaderViewColor
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(
                      left:5,
                      right:45,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UText(
                          title:callerGroupStr1,
                          fontSize: size.width*0.035 ,
                          fontWeight: FontWeight.w900,
                        ),
                         UText(
                          title:callerGroupStr2,
                          fontSize: size.width*0.023,
                          //fontWeight: FontWeight.w900,
                          
                        ),
                      ],
                    ),
                  )),
              ),
            ),
          ]),
        );
  }

  Container MobileLayout(Size size) {
    return Container(
          width: double.infinity,
          height: 180,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
            Positioned.fill(
              child: Image.asset(
                'assets/png/you_yamen.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right:-size.width*0.09,
              child: ClipOval(
                child: Container(
                  height:size.width*0.3, 
                  
                  width:size.width*0.6,
                  
                  decoration:BoxDecoration(
                    color:myTuneHeaderViewColor
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(
                      left:0,
                      right:30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UText(
                          title:callerGroupStr1,
                          fontSize: size.width*0.040,
                          fontWeight: FontWeight.w900,
                        ),
                         UText(
                          title:callerGroupStr2,
                          fontSize: size.width*0.029,
                          //fontWeight: FontWeight.w900,
                          
                        ),
                      ],
                    ),
                  )),
              ),
            ),
          ]),
        );
  }
}
