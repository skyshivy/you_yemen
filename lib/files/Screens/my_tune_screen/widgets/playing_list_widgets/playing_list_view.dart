import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:you_yemen/files/common/grid_delegate.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_controller.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/screens/my_tune_screen/widgets/playing_list_widgets/playing_tune_cell.dart';
import 'package:you_yemen/files/screens/my_tune_screen/widgets/playing_list_widgets/playing_tune_header_view.dart';

class PlayingTuneListView extends StatelessWidget {
  PlayingTuneListView({super.key});
  final MyTuneController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return cont.isLoadingPlayingList.value
          ? loadingIndicator(height: 300)
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: playingTuneHeaderView(),
                ),
                const SizedBox(height: 20),
                gridView(),
              ],
            );
    });
  }

  Widget gridView() {
    return Obx(() {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shrinkWrap: true,
        itemCount: cont.newPlayingList.length, //cont.playingList.length,
        gridDelegate:
            gridDelegate(childAspectRatio: 0.6, maxCrossAxisExtent: 260),
        itemBuilder: (context, index) {
          return playingTuneCell(cont.newPlayingList[index]);
        },
      );
    });
  }
}
