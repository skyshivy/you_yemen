import 'package:flutter/material.dart';

Widget UAnimatedSwitcher(Widget firstChild, Widget secondChild, bool isChange) {
  return AnimatedSwitcher(
    child: isChange
        ? Container(
            key: UniqueKey(),
            //color: Colors.red,
            child: firstChild,
          )
        : Container(
            key: UniqueKey(),
            //color: Colors.blue,
            child: secondChild,
          ),
    duration: Duration(milliseconds: 300),
    transitionBuilder: (child, animation) {
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
  );
}
