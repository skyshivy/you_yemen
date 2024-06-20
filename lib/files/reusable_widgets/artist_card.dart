import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/mobile_navigation.dart';
import 'package:you_yemen/files/controllers/artist_tunes_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/play_button.dart';
import 'package:you_yemen/files/reusable_widgets/decorations/card_decoration.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/screens/artist_tunes_screen/artist_tunes_screen.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class ArtistCard extends StatelessWidget {
  ArtistCard({super.key, this.info});
  final TuneInfo? info;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: cardDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: imageBuilder()),
          infoBuilder(),
        ],
      ),
    );
  }

  Widget imageBuilder() {
    return uImage(
      url: info?.toneIdpreviewImageUrl ?? '',
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4),
        topRight: Radius.circular(4),
      ),
    );
  }

  Widget infoBuilder() {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UText(
                title: info?.artist ?? '',
                fontName: FontName.helveticaBold,
                maxLine: 1,
              ),
              SizedBox(height: 8),
              genericButton(
                height: 35,
                width: 100,
                btnColor: black,
                textColor: white,
                title: viewStr,
                onTap: () {
                  ArtistTunesController cont = Get.find();
                  cont.getArtistTunes(info?.artist ?? '');
                  if (GetPlatform.isWeb) {
                    context.goNamed(artistTunesRoute,
                        queryParameters: {'artistKey': info?.artist ?? ''});
                  } else {
                    mobileNavigation(context,
                        ArtistTunesScreen(artistKey: info?.artist ?? ''));
                  }

                  print("View tapped");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
