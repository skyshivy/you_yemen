import 'package:flutter/material.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/images.dart';

class CustomHeaderView extends StatelessWidget {
  const CustomHeaderView(
      {super.key,
      this.bgImage = defaultHeaderImage,
      required this.title,
      required this.subTitle});
  final String bgImage;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return ovalShape(sizingInformation);
      },
    ));
  }

  Container ovalShape(SizingInformation si) {
    return Container(
      width: double.infinity,
      height: si.isMobile ? 200 : 280,
      child: Stack(alignment: Alignment.centerRight, children: [
        backgroundImageBuilder(),
        Positioned(
          right: -60,
          child: clipOvalShape(si),
        ),
      ]),
    );
  }

  ClipOval clipOvalShape(SizingInformation si) {
    return ClipOval(
      child: Container(
          height: si.isMobile ? 130 : 200,
          width: si.isMobile ? 280 : 400,
          decoration: BoxDecoration(color: myTuneHeaderViewColor),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 80,
            ),
            child: infoColumnBuilder(si),
          )),
    );
  }

  Column infoColumnBuilder(SizingInformation si) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UText(
          title: title,
          fontSize: si.isMobile ? 18 : 24,
          fontWeight: FontWeight.w900,
        ),
        UText(
          title: subTitle,
          fontSize: si.isMobile ? 12 : 15,
        ),
      ],
    );
  }

  Positioned backgroundImageBuilder() {
    return Positioned.fill(
      child: Image.asset(
        bgImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
