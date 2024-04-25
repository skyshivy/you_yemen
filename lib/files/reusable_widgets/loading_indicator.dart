import 'package:flutter/cupertino.dart';

loadingIndicator({double? height, double? width, double radius = 10}) {
  return SizedBox(
    height: height,
    width: width,
    child: Center(
      child: CupertinoActivityIndicator(
        radius: radius,
      ),
    ),
  );
}
