import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/controllers/artist_tunes_controller.dart';

class ArtistTunesScreen extends StatefulWidget {
  const ArtistTunesScreen({super.key, required this.artistKey});
  final String artistKey;
  @override
  State<ArtistTunesScreen> createState() => _ArtistTunesScreenState();
}

class _ArtistTunesScreenState extends State<ArtistTunesScreen> {
  ArtistTunesController cont = Get.find();
  @override
  void initState() {
    super.initState();
    print("_ArtistTunesScreenState initiated");
  }

  @override
  void dispose() {
    super.dispose();
    print("_ArtistTunesScreenState Disposed");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return cont.isLoading.value
            ? loadingIndicator()
            : GenericGridView(list: cont.list, totalCount: 0);
      }),
    );
  }
}
