import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import 'package:you_yemen/files/Screens/wishlist_screen/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/get_category_list_api.dart';

import 'package:you_yemen/files/api_self_care/get_banner_list_api.dart';

import 'package:you_yemen/files/api_self_care/tone_detail_api.dart';

//import 'package:you_yemen/files/api_self_care/activation_api.dart';
//import 'package:you_yemen/files/api_self_care/deactivate_tone_api.dart';
//import 'package:you_yemen/files/api_self_care/list_settings_api.dart';

import 'package:you_yemen/files/common/encryptor/aes_en_de_cryptor.dart';

import 'package:you_yemen/files/common/footer_view.dart';
import 'package:you_yemen/files/common/search_tune_text_field.dart';

import 'package:you_yemen/files/models/tune_info_model.dart';

import 'package:you_yemen/files/reusable_widgets/buttons/generic_button.dart';
import 'package:you_yemen/files/screens/custom_header_view.dart';

import 'package:you_yemen/files/screens/home_screen/home_banner_view.dart';

import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_list_view.dart';
import 'package:you_yemen/files/screens/home_screen/recomended_view/recomended_tab_view.dart';
import 'package:you_yemen/files/translation/strings.dart';
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
        genericButton(
          title: "8123812512",
          onTap: () {
            AesEnDeCryptor().aesEnc("8123812512");
          },
        ),
        ElevatedButton(onPressed: () {}, child: Text('api')),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishListScreen()),
              );
              //getContentPriceApi();//working
              //getWishlistApi(); //working
              //addtoWishListApi(TuneInfo());  //working
              //deleteWishlistApi(); //working
              //getContentPriceApi(); //working
              //giftApi(); //Status code 404

              //scGetBannerDetailsApi();
              scGetCategoryListApi();
              //getRecommendationSongApi();
              scGetBannerlistApi();
              toneDetailApi();
              // suspendApi();
            },
            child: Text('api')),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomHeaderView(
                        title: callerGroupStr1, subTitle: callerGroupStr2)),
              );
            },
            child: Text('myTuneHeaderView')),
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
