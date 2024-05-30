import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/Screens/profile_screen/advanced_setting_screen.dart';
import 'package:you_yemen/files/controllers/my_tunes_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';

import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

class MyTuneScreen extends StatelessWidget {
  final MyTunesController myTunesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            playingTuneSection(),
            SizedBox(height: 10),
            myTuneSection(),
          ],
        ),
      ),
    ));
  }

  Row playingTuneSection() {
    return Row(children: [
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UText(
              title: "Currently Playing To My Callers",
              textColor: black,
              enfontName: FontName.helvetica,
              enfontSize: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: playingGridViewBuilder(),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget playingGridViewBuilder() {
    return Obx(() {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: myTunesController.playingList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 500,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1,
          maxCrossAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    right:
                        BorderSide(color: Colors.transparent.withOpacity(0.4)),
                    bottom: BorderSide(
                      color: Colors.transparent.withOpacity(0.2),
                    ))),
            child: Column(
              children: [
                Image.asset('assets/png/77.png'),
                Row(
                  children: [
                    Column(
                      children: [
                        UText(
                          title: "toneName",
                          enfontName: FontName.helveticaLight,
                          textColor: black,
                        ),
                        UText(
                          title: "albumName",
                          enfontName: FontName.helveticaLight,
                          textColor: grey,
                        )
                      ],
                    ),
                    SizedBox(width: 80),
                    Icon(Icons.play_arrow),
                    SizedBox(width: 5),
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
              ],
            ),
          );
        },
      );
    });
  }

  Center myTuneSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UText(
            title: "My Tunes",
            textColor: black,
            enfontName: FontName.helvetica,
            enfontSize: 20,
          ),
          myTuneGridView(),
        ],
      ),
    );
  }

  Widget myTuneGridView() {
    return Obx(() {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: myTunesController.myTuneList.length,
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
              SizedBox(height: 8),
              UText(
                title: myTunesController
                        .myTuneList.first.toneDetails?[index].toneName ??
                    '',
                textColor: Colors.black,
              ),
              SizedBox(height: 2),
              UText(
                title: myTunesController
                        .myTuneList.first.toneDetails?[index].artistName ??
                    '',
                textColor: Colors.grey,
              ),
              Row(
                children: [
                  Icon(
                    Icons.gif_box_outlined,
                    color: lightGrey,
                  ),
                  SizedBox(width: 5),
                  UText(
                    title: "Gift",
                    enfontName: FontName.helvetica,
                    textColor: black,
                  ),
                  SizedBox(width: 100),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdvancedSettingScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: lightGrey,
                        ),
                        SizedBox(width: 5),
                        UText(
                          title: "Settings",
                          enfontName: FontName.helvetica,
                          textColor: black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    });
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
          child: UText(
            enfontName: FontName.helvetica,
            textColor: grey,
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
          width: 300,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
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
            title:
                "You should have at least one tune in your currently playing list.",
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Tunes Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTuneScreen(),
    );
  }
}
