import 'package:flutter/material.dart';

Widget uVisibility(Widget firstChild, bool hide,
    {Widget? secondChild, int duration = 200}) {
  return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild ?? const SizedBox(),
      //secondCurve: Curves.bounceInOut,
      // firstCurve: Curves.easeInOutCubic,
      // secondCurve: Curves.easeInOutCubic,
      crossFadeState:
          !hide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: duration));
}

// Widget uVisibility({required Widget child, required bool isHide}) {
//   return 
//   AnimatedSwitcher(
//       switchInCurve: Curves.easeIn,
//       switchOutCurve: Curves.easeOut,
//       duration: const Duration(milliseconds: 500),
//       reverseDuration: const Duration(milliseconds: 500),
//       child: isHide ? const SizedBox() : child);
// }




