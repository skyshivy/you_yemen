import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:you_yemen/files/api_self_care/add_tone_from_shufflelist.dart';
import 'package:you_yemen/files/api_self_care/deactivate_tone_api.dart';
import 'package:you_yemen/files/api_self_care/delete_pack_api.dart';
import 'package:you_yemen/files/api_self_care/delete_tone_from_shuffle_api.dart';
import 'package:you_yemen/files/api_self_care/list_settings_api.dart';

import 'package:you_yemen/files/Screens/wishlist_screen/wishlist_screen.dart';
import 'package:you_yemen/files/api_gokul/add_detail_api.dart';
import 'package:you_yemen/files/api_gokul/delete_wishlist_api.dart';
import 'package:you_yemen/files/api_gokul/get_content_price_api.dart';
import 'package:you_yemen/files/api_gokul/get_wishlist_api.dart';
import 'package:you_yemen/files/api_gokul/gift_api.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

//import 'package:you_yemen/files/api_self_care/activation_api.dart';
//import 'package:you_yemen/files/api_self_care/deactivate_tone_api.dart';
//import 'package:you_yemen/files/api_self_care/list_settings_api.dart';
import 'package:you_yemen/files/api_self_care/pack_deatil_api.dart';
import 'package:you_yemen/files/api_self_care/suspend_api.dart';
import 'package:you_yemen/files/api_self_care/tone_details_api.dart';
//import 'package:you_yemen/files/api_self_care/suspend_api.dart';

import 'package:you_yemen/files/api_gokul/add_to_wishlist_api.dart';

import 'package:you_yemen/files/common/footer_view.dart';
import 'package:you_yemen/files/common/search_tune_text_field.dart';
import 'package:you_yemen/files/screens/home_screen/home_banner_view.dart';

import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_list_view.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_tab_view.dart';
import 'package:you_yemen/files/utility/colors.dart';

// import 'package:you_yemen/files/screens/profile_screen/transition_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        bannerView(),
        const SizedBox(height: 10),
        searchSection(),
        const SizedBox(height: 10),
        RecomendedTabView(),
        RecomendedListView(),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishListScreen()),
              );
              getContentPriceApi();
              //getWislistApi(); //working
              //addtoWishListApi();  //working
              //deleteWishlistApi(); //working
              //getContentPriceApi(); //Status code 404
              //giftApi(); //Status code 404
            },
            child: Text('Wishlist')),
        const SizedBox(height: 10),
        FooterView(),
      ],
    );
  }

  Widget bannerView() {
    return Container(
      color: transparent,
      child: HomeBannerView(carouselController: carouselController),
    );
  }

  Widget searchSection() {
    return GetPlatform.isWeb
        ? Container(
            color: black,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: searchTuneTextField(context, textEditingController),
            ),
          )
        : SizedBox();
  }
}
