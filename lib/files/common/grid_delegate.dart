import 'package:flutter/material.dart';

SliverGridDelegateWithMaxCrossAxisExtent gridDelegate(
    {double childAspectRatio = 0.75, double maxCrossAxisExtent = 240}) {
  return SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: maxCrossAxisExtent,
    crossAxisSpacing: 20,
    mainAxisSpacing: 60,
    childAspectRatio: childAspectRatio,
  );
}
