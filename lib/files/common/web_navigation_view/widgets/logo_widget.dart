import 'package:flutter/material.dart';
import 'package:you_yemen/files/utility/images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          youLogoPng,
          height: height,
        ),
      ],
    );
  }
}
