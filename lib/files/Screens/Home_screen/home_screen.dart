import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:you_yemen/files/api_self_care/add_tone_from_shufflelist.dart';

import 'package:you_yemen/files/api_self_care/deactivate_tone_api.dart';
import 'package:you_yemen/files/api_self_care/delete_pack_api.dart';
import 'package:you_yemen/files/api_self_care/delete_tone_from_shuffle_api.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/api_self_care/get_banner_list_api.dart';
import 'package:you_yemen/files/api_self_care/resume_api.dart';
import 'package:you_yemen/files/api_self_care/suspend_api.dart';

//import 'package:you_yemen/files/api_self_care/activation_api.dart';
//import 'package:you_yemen/files/api_self_care/deactivate_tone_api.dart';
//import 'package:you_yemen/files/api_self_care/list_settings_api.dart';

//import 'package:you_yemen/files/api_self_care/suspend_api.dart';

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
              getBannerlistApi();
              // suspendApi();
            },
            child: Text('api')),
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
