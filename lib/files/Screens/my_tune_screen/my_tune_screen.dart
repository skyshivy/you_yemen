import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';
import 'package:you_yemen/files/screens/my_tune_screen/widgets/my_tune_list_widgets/my_tune_list_view.dart';
import 'package:you_yemen/files/screens/my_tune_screen/widgets/playing_list_widgets/playing_list_view.dart';

class MyTuneScreen extends StatefulWidget {
  const MyTuneScreen({super.key});

  @override
  State<MyTuneScreen> createState() => _MyTuneScreenState();
}

class _MyTuneScreenState extends State<MyTuneScreen> {
  MyTuneController co = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.teal,
            height: 250,
          ),
        ),
        SliverToBoxAdapter(
          child: PlayingTuneListView(),
        ),
        SliverToBoxAdapter(
          child: MyTuneListView(),
        ),
      ],
    );
  }
}
