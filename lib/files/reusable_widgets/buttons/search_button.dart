import 'package:flutter/material.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget searchButton(Function() onTap) {
  return InkWell(
    highlightColor: transparent,
    focusColor: transparent,
    hoverColor: transparent,
    splashColor: transparent,
    onTap: onTap,
    child: AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(shape: BoxShape.circle, color: black),
          child: Icon(
            Icons.search,
            size: 18,
            color: white,
          ),
        ),
      ),
    ),
  );
}
