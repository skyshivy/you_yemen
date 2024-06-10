import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:you_yemen/files/utility/colors.dart';

Widget uImage({
  String url = "https://picsum.photos/seed/picsum/200/300",
  BorderRadiusGeometry borderRadius = BorderRadius.zero,
  Color? gredientColor,
  BoxFit fit = BoxFit.fill,
  //  required int width,           //bhavya
}) {
  return ClipRRect(
    borderRadius: borderRadius,
    child: Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          width: double.infinity,
          fit: BoxFit.cover,
          imageUrl: url,
          placeholder: (context, url) =>
              Center(child: const CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fadeInDuration: const Duration(seconds: 1),
        ),
        Container(
          color: gredientColor ?? gredientBlack,
        ),
      ],
    ),
  );
}
