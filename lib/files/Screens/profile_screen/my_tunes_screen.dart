import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/Screens/Home_screen/success_popup.dart';
import 'package:you_yemen/files/Screens/profile_screen/advanced_setting_screen.dart';
import 'package:you_yemen/files/enums/enums.dart';

import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';


class MyTuneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            Row(
              children: [ 
                Flexible(
                  child: 
                  Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      UText(title: "Currently Playing To My Callers",
                     textColor: black,enfontName: FontName.helvetica,enfontSize: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: 500,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            childAspectRatio: 1,
                            maxCrossAxisExtent: 250, 
                          ),
                          itemBuilder: (context, index) {
                            return 
                            // Card(color: white,
                            // child: 
                            Container(
                              decoration: BoxDecoration(
                                border:Border(
                                  right: BorderSide(color: Colors.transparent.withOpacity(0.4)),
                                  bottom: BorderSide(color: Colors.transparent.withOpacity(0.2),
                                  
                                    
                                  )
                              
                                )
                              ),
                              child: Column(
                                children: [
                                  Image.asset('assets/png/77.png'),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          UText(
                                            title: 'Sai Sai',
                                            enfontName: FontName.helveticaLight,
                                            textColor: black,
                                          ),
                                          UText(title: "Sai Sai ",enfontName: FontName.helveticaLight,textColor: grey,)
                                        ],
                                      ),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Icon(Icons.play_arrow),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () => _showDeletePopup(context),
                                        child: Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [UText(title: "Status",
                                          enfontName: FontName.helvetica,textColor: grey,), 
                                          UText(title: "Shuffle",
                                          enfontName: FontName.helvetica,textColor:black,)],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            UText(title: "Callers",
                                            enfontName: FontName.helvetica,textColor: grey,), 
                                            UText(title: "All",
                                            enfontName: FontName.helvetica,textColor:black,)],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          UText(title: "Time",
                                          enfontName: FontName.helvetica,textColor: grey,), 
                                          UText(title: "Full Day",
                                          enfontName: FontName.helvetica,textColor: black,)],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                                    UText(title: "From",
                                                    enfontName: FontName.helvetica,textColor: grey,),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text("00:00"),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                                    UText(title: "To",textColor: lightGrey,
                                                    enfontName: FontName.helvetica,),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                           Text("00:00"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        UText(title: "Repeat",
                                        enfontName: FontName.helvetica,textColor: grey,),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: _buildDayButtons(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 10),
                // Flexible(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       UText(title: "My Tunes",textColor: black,enfontName: FontName.helvetica,enfontSize: 20,),
                //       GridView.builder(
                //         shrinkWrap: true,
                //         physics: NeverScrollableScrollPhysics(),
                //         itemCount: 1,
                //         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //           mainAxisExtent: 300,
                //           crossAxisSpacing: 10,
                //           mainAxisSpacing: 10,
                //           childAspectRatio: 2,
                //           maxCrossAxisExtent: 300,
                //         ),
                //         itemBuilder: (context, index) {
                //           return Column(
                //             children: [
                //               Image.asset('assets/png/3.png'),
                //               UText(
                //                 title: "Ngar Nint Ko Mone Tal Chorus",
                //                 textColor: Colors.black,
                //               ),
                //               SizedBox(
                //                 height: 2,
                //               ),
                //               UText(
                //                 title: "Sai Sai Kham Leng Amera jkiu",
                //                 textColor: Colors.grey,
                //               ),
                //               Row(
                //                 children: [
                //                   Icon(Icons.gif_box_outlined,color: lightGrey,),
                //                   SizedBox(
                //                     width: 5,
                //                   ),
                //                   UText(title: "Gift",
                //                    enfontName: FontName.helvetica,
                //                         textColor: black,),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   GestureDetector(
                //                     onTap: () {
                //                       Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                           builder: (context) =>
                //                               AdvancedSettingScreen(),
                //                         ),
                //                       );
                //                     },
                //                     child: Row(
                //                       children: [
                //                         Icon(Icons.settings,color: lightGrey,),
                //                         SizedBox(
                //                           width: 5,
                //                         ),
                //                         UText(title: "Settings",
                //                         enfontName: FontName.helvetica,
                //                         textColor: black,),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 10,
            ),Center(
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UText(title: "My Tunes",
                        textColor: black,
                        enfontName: FontName.helvetica,
                        enfontSize: 20,),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: 500,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2,
                            maxCrossAxisExtent: 300,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            
                              children: [
                                Image.asset('assets/png/3.png'),
                                SizedBox(height: 8,),
                                UText(
                                  title: "Ngar Nint Ko Mone Tal Chorus",
                                  textColor: Colors.black,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                UText(
                                  title: "Sai Sai Kham Leng Amera chorus",
                                  textColor: Colors.grey,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.gif_box_outlined,color: lightGrey,),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    UText(title: "Gift",
                                     enfontName: FontName.helvetica,
                                          textColor: black,),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdvancedSettingScreen(),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.settings,color: lightGrey,),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          UText(title: "Settings",
                                          enfontName: FontName.helvetica,
                                          textColor: black,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeletePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeletePopupView();
      },
    );
  }

  List<Widget> _buildDayButtons() {
    final List<String> days = ['M', 'TU', 'W', 'T', 'F', 'SAT', 'S'];
    return days.map((day) {
      return Container(
        width: 25,
        height: 25,
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(color: lightGrey),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.all(2),
        child: Center(
          child: UText(enfontName: FontName.helvetica,textColor: grey,
            title: day,
            arfontSize: 2,
          ),
        ),
      );
    }).toList();
  }
}

class DeletePopupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300, // Adjust width if needed
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12), // Adjust corner radius if needed
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CheckImageBuilder(),
              SizedBox(height: 10),
              SuccessMessageBuilder(),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessMessageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UText(
            title: "You should have at-least one tune in your currently playing list.",
            enfontName: FontName.helvetica,
            textColor: Colors.white,
            enfontSize: 20,
            alignment: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CheckImageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 6),
        ),
        child: Center(
          child: Icon(Icons.close, size: 60, color: Colors.white),
        ),
      ),
    );
  }
}









//   List<Widget> _buildDayButtons() {
//     final List<String> days = ['M', 'T', 'W', 'TH', 'F', 'SAT', 'S'];
//     return days.map((day) {
//       return Container(
//         width: 25,
//         height: 25,
//         margin: EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           border: Border.all(color: black),
//           borderRadius: BorderRadius.circular(100),
//         ),
//         padding: EdgeInsets.all(8),
//         child: UText(
//           title: day,
//           arfontSize: 2,
//         ),
//       );
//     }).toList();
//   }
// }






            // GridView.builder(
            //   clipBehavior: Clip.hardEdge,
            //     shrinkWrap: true,
            //     itemCount: 1,
            //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //       mainAxisExtent: 1,
            //       crossAxisSpacing: 10,
            //       mainAxisSpacing: 10,
            //       childAspectRatio: 1,
            //       maxCrossAxisExtent: 200,
            //     ),
            //     itemBuilder: (context, index) {
            //       return Column(
            //         children: [
            //           Image.asset('assets/png/3.png'),
            //           UText(title: "Ngar Nint Ko Mone Tal Chorus",
            //           textColor: black,),
            //           SizedBox(height: 2,),
                          
            //           UText(title: "Sai Sai Kham Leng Amera Hpone",
            //           textColor: lightGrey,),Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Row(
            //                 children: [
            //                   Icon(Icons.gif_box_outlined),
            //                    SizedBox(width: 5,),
            //                 Text("Gift"),
            //                 SizedBox(width: 10,),
            //                 Icon(Icons.settings),
            //                 SizedBox(width: 5,),
            //                 Text("Settings")
            //                 ],
            //               ),
            //           ),
                         
                    
            //         ],
            //       );
            //     }
            //     )