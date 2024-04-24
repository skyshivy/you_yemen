import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget uImage(
    {String url = "https://picsum.photos/seed/picsum/200/300",
    BorderRadiusGeometry borderRadius = BorderRadius.zero}) {
  return ClipRRect(
    borderRadius: borderRadius,
    child: CachedNetworkImage(
      width: double.infinity,
      fit: BoxFit.fill,
      imageUrl: url,
      placeholder: (context, url) =>
          Center(child: const CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fadeInDuration: const Duration(seconds: 1),
    ),
  );
}
