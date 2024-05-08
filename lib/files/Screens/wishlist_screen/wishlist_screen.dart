import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/wishlist_controller.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  late WishlistController cont;
  @override
  void initState() {
    cont = Get.put(WishlistController());
    makeWishlistApi();
    super.initState();
  }

  makeWishlistApi() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return GenericGridView(list: cont.toneList);
  }
}
