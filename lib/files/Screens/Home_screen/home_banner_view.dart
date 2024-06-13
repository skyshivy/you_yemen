import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/controllers/banner_controller.dart';
import 'package:you_yemen/files/models/home_banner_model.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

class HomeBannerView extends StatelessWidget {
  HomeBannerView({super.key, this.carouselController});
  final BannerController con = Get.find();
  final CarouselController? carouselController;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            carouselController: carouselController,
            items: [
              for (HomeBanner banner in con.banners) bannerCard(banner),
            ],
            options: carousalOption(context),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: carousalIndicator(),
          ),
        ],
      );
    });
  }

  Widget bannerCard(HomeBanner homeBanner) {
    return uImage(
        gredientColor: transparent,
        url: homeBanner.bannerPath ?? '',
        fit: BoxFit.fill,
        height: double.infinity);
  }

  Widget carousalIndicator() {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: black.withOpacity(0.4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ListView.builder(
          itemCount: con.banners.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: indicatorDot(index),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget indicatorDot(int index) {
    return InkWell(
      onTap: () {
        con.updateSelectedIndex(index);
        carouselController?.jumpToPage(index);
      },
      child: Obx(() {
        return Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
              border: Border.all(color: white, width: 2),
              borderRadius: BorderRadius.circular(6),
              color: index == con.selectedIndex.value ? white : black),
        );
      }),
    );
  }

  CarouselOptions carousalOption(BuildContext context) {
    return CarouselOptions(
      height: MediaQuery.of(context).size.width / 3.20,
      aspectRatio: 16 / 9,
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.1,
      onPageChanged: (index, reason) {
        con.updateSelectedIndex(index);
        print("changes index $index");
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
