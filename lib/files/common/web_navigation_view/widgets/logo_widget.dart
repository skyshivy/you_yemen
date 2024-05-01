import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/utility/images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).replace(homeRoute);
      },
      child: Row(
        children: [
          Image.asset(
            youLogoPng,
            height: height,
          ),
        ],
      ),
    );
  }
}
