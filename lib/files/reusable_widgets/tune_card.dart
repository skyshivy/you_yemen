import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/common/buy_popup/buy_popup.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/buy_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/card_more_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/play_button.dart';
import 'package:you_yemen/files/reusable_widgets/decorations/card_decoration.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

// class TuneCard extends StatelessWidget {
//   const TuneCard({super.key});

class TuneCard extends StatelessWidget {
  final TuneInfo? info;
  const TuneCard({super.key, this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: cardDecoration(),
      child: Column(
        children: [
          Expanded(child: imageBuilder()),
          infoBuilder(),
        ],
      ),
    );
  }

  Widget imageBuilder() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        uImage(url: info?.toneIdpreviewImageUrl ?? ''),
        moreButton(),
      ],
    );
  }

  Widget moreButton() {
    return cardMoreButton();
  }

  Widget infoBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UText(
            title: info?.toneName ?? '',
            enfontName: FontName.helveticaBold,
            arfontName: FontName.acMunaBlack,
          ),
          UText(
            title: info?.artist ?? '',
            textColor: grey,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: playButton(() => null)),
              const SizedBox(width: 20),
              Expanded(child: buyButton(() => null)),
            ],
          )
        ],
      ),
    );
  }
}

// class TuneCard extends StatelessWidget {
//   final BuildContext context;

//   const TuneCard({required this.context, Key? key}) : super(key: key);

//   const TuneCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.hardEdge,
//       decoration: cardDecoration(),
//       child: Column(
//         children: [
//           Expanded(child: imageBuilder()),
//           infoBuilder(),
//         ],
//       ),
//     );
//   }

//   Widget imageBuilder() {
//     return Stack(
//       alignment: Alignment.topRight,
//       children: [
//         uImage(),
//         moreButton(),
//       ],
//     );
//   }

//   Widget moreButton() {
//     return cardMoreButton();
//   }

//   Widget infoBuilder() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           UText(
//             title: "Tune name here",
//             enfontName: FontName.helveticaBold,
//             arfontName: FontName.acMunaBlack,
//           ),
//           UText(
//             title: "Artist name here",
//             textColor: grey,
//           ),
//           SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(child: playButton(() => null)),
//               const SizedBox(width: 20),
//               Expanded(child: buyButton(() => showBuyPopup(context))),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
