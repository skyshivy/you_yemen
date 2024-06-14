import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:you_yemen/files/controllers/artist_tunes_controller.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';

class ArtistTunesScreen extends StatefulWidget {
  const ArtistTunesScreen({super.key, required this.artistKey});
  final String artistKey;
  @override
  State<ArtistTunesScreen> createState() => _ArtistTunesScreenState();
}

class _ArtistTunesScreenState extends State<ArtistTunesScreen> {
  late ArtistTunesController cont;
  @override
  void initState() {
    cont = Get.put(ArtistTunesController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ArtistTunesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return cont.isLoading.value ? loadingIndicator() : Text("data");
      }),
    );
  }
}
