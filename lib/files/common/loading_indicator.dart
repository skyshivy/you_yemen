import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customLoadingIndicator(
    {bool isIos = false,
    double radius = 20,
    double? width,
    double? height,
    bool isOverlay = false}) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
          height: height,
          width: width,
          child: Center(
              child: isOverlay
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: _mainContaner(isIos, radius, isOverlay),
                      ),
                    )
                  : _mainContaner(isIos, radius, isOverlay)))
    ],
  );
}

Widget _mainContaner(bool isIos, double radius, bool isOverlay) {
  return isIos
      ? CupertinoActivityIndicator(
          radius: radius,
        )
      : const CircularProgressIndicator();
}
