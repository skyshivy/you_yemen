import 'package:flutter/material.dart';
import 'package:you_yemen/files/utility/colors.dart';

BoxDecoration cardDecoration({double radius = 4}) {
  return BoxDecoration(
      color: white,
      border: Border.all(color:lightGrey),
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(spreadRadius: 2, blurRadius: 4, color: black.withOpacity(0.1))
      ]);
}
